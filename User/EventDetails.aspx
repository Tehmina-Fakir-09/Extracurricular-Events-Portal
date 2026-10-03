<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="EventDetails.aspx.cs" Inherits="User_EventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /* General Layout */
        .events-container {
            width: 100%;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            padding: 20px 0;
        }

        .event-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 2px 2px 8px rgba(0,0,0,0.1);
            display: flex;
            gap: 20px;
            align-items:flex-start;
        }

        .event-image img {
            width: 220px;
            height: 220px;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .event-image img:hover {
            transform: scale(1.05);
        }

        .event-details {
            flex: 1;
        }

        .event-row {
            margin-bottom: 10px;
        }

        .event-label {
            font-weight: bold;
            color: #555;
            display: inline-block;
            width: 150px;
        }

        .event-value {
            color: #333;
        }

        .event-actions {
            margin-top: 15px;
        }

        .register-btn {
            background-color: #4a90e2;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        .register-btn:hover {
            background-color: #357abd;
        }

        .closed-label {
            color: red;
            font-weight: bold;
        }
        /* --- Modal for full-size image --- */
        .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 0;
            top: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(0,0,0,0.95);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .modal-close {
            position: absolute;
            top: 20px;
            right: 35px;
            color: #fff;
            font-size: 40px;
            font-weight: bold;
            cursor: pointer;
            z-index: 10000;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="events-container">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="EventId" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
            <ItemTemplate>
                <div class="event-card">
                    <!-- Event Image -->
                    <div class="event-image">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' 
                            onclick="openModal(this)" style="cursor:pointer;" />
                    </div>

                    <!-- Event Details -->
                    <div class="event-details">
                        <div class="event-row">
                            <span class="event-label">Event Name:</span>
                            <span class="event-value"><%# Eval("Eventname") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">Organized By:</span>
                            <span class="event-value"><%# Eval("Organizedby") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">Event Type:</span>
                            <span class="event-value"><%# Eval("EventType") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">Start Date:</span>
                            <span class="event-value"><%# Eval("Startdate") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">End Date:</span>
                            <span class="event-value"><%# Eval("Enddate") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">Venue:</span>
                            <span class="event-value"><%# Eval("Venue") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">Description:</span>
                            <span class="event-value"><%# Eval("Description") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">Registration Deadline:</span>
                            <span class="event-value"><%# Eval("Registrationdeadline") %></span>
                        </div>
                        <div class="event-row">
                            <span class="event-label">Max Participants:</span>
                            <span class="event-value"><%# Eval("Maxparticipant") %></span>
                        </div>

                        <!-- Actions -->
                        <div class="event-actions">
                            <asp:Button ID="btnRegister" runat="server" CssClass="register-btn" 
                                Text="Register Now" CommandArgument='<%# Eval("EventId") %>' OnClick="btnRegister_Click" />
                            <asp:Label ID="lblClosed" runat="server" CssClass="closed-label" Text="Registration Closed" Visible="false"></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT * FROM [ManageEvent] WHERE ([EventId] = @EventId)">
            <SelectParameters>
             <asp:SessionParameter Name="EventId" SessionField="EId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
<!-- Image Modal -->
    <div id="imageModal" class="modal">
        <span class="modal-close" onclick="closeModal()">&times;</span>
        <img class="modal-content" id="modalImg">
    </div>

    <script type="text/javascript">
        // Modal Image Logic
        function openModal(img) {
            var modal = document.getElementById("imageModal");
            var modalImg = document.getElementById("modalImg");
            modal.style.display = "flex";
            modalImg.src = img.src;
        }

        function closeModal() {
            document.getElementById("imageModal").style.display = "none";
        }

    </script>
</asp:Content>

