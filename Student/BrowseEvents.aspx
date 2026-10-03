<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="BrowseEvents.aspx.cs" Inherits="Student_BrowseEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            background-color: #f4f4f4;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .page-container {
            display: flex;
            flex-direction: column;  /* Stack cards vertically */
            align-items: center;
            width: 90%;
            max-width: 1000px;
            margin: 40px auto;
        }

        /* --- Tabs --- */
        .tab-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 25px;
        }

        .tab-button {
            background-color: #e0e0e0;
            color: #333;
            border: none;
            border-radius: 8px;
            padding: 10px 25px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .tab-button:hover {
            background-color: #ccc;
        }

        .tab-button.active {
            background-color: #555;
            color: #fff;
            font-weight: 600;
        }

        /* --- Event Card Layout --- */
        .event-card {
            background-color: #ffffff;
            border: 1px solid #d1d1d1;
            border-radius: 12px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.08);
            margin: 25px auto;
            padding: 25px;
            display: flex;
            align-items: flex-start;
            justify-content: flex-start;
            gap: 25px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            width: 95%;
        }

        .event-card:hover {
            transform: scale(1.01);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .event-image {
            width: 160px;
            height: 160px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        .event-details {
            flex: 1;
            text-align: left;
        }

        .event-title {
            font-size: 22px;
            font-weight: 700;
            color: #2e2e2e;
            margin-bottom: 10px;
        }

        .event-info {
            margin-bottom: 8px;
            font-size: 15px;
            color: #444;
            line-height: 1.5;
        }

        .event-label {
            font-weight: 600;
            color: #555;
            margin-right: 5px;
        }

        .view-button {
            background-color: #555;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 8px 18px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .view-button:hover {
            background-color: #333;
        }

        /* --- Responsive --- */
        @media (max-width: 768px) {
            .event-card {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .event-image {
                margin-bottom: 15px;
            }

            .event-details {
                text-align: center;
            }

            .tab-container {
                flex-direction: column;
            }
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

        /* --- Hide and show sections --- */
        .tab-section {
            display: none;
        }

        .tab-section.active {
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-container">

        <!-- Tabs -->
        <div class="tab-container">
            <button id="btnUpcoming" class="tab-button active" type="button" onclick="showTab('upcoming')">Upcoming Events</button>
            <button id="btnClosed" class="tab-button" type="button" onclick="showTab('closed')">Closed Events</button>
        </div>

        <!-- Upcoming Events Section -->
        <div id="tab-upcoming" class="tab-section active">
            <asp:DataList ID="dlUpcoming" runat="server" RepeatColumns="1">
                <ItemTemplate>
                    <div class="event-card">
                        <asp:Image ID="Image1" runat="server" CssClass="event-image" ImageUrl='<%# Eval("Image") %>' onclick="openModal(this)" style="cursor:pointer;" />
                        <div class="event-details">
                            <div class="event-title"><%# Eval("Eventname") %></div>
                            <div class="event-info"><span class="event-label">Event Type:</span><%# Eval("Eventtype") %></div>
                            <div class="event-info"><span class="event-label">Organized By:</span><%# Eval("Organizedby") %></div>
                            <div class="event-info"><span class="event-label">Date:</span><%# Eval("Startdate", "{0:dd/MM/yyyy}") %></div>
                            <div class="event-info"><span class="event-label">Venue:</span><%# Eval("Venue") %></div>
                            <asp:Button ID="Button1" runat="server" CssClass="view-button"
                                CommandArgument='<%# Eval("EventId") %>' OnClick="Button1_Click" Text="View More" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <!-- Closed Events Section -->
        <div id="tab-closed" class="tab-section">
            <asp:DataList ID="dlClosed" runat="server" RepeatColumns="1">
                <ItemTemplate>
                    <div class="event-card">
                        <asp:Image ID="Image2" runat="server" CssClass="event-image" ImageUrl='<%# Eval("Image") %>' onclick="openModal(this)" style="cursor:pointer;" />
                        <div class="event-details">
                            <div class="event-title"><%# Eval("Eventname") %></div>
                            <div class="event-info"><span class="event-label">Event Type:</span><%# Eval("Eventtype") %></div>
                            <div class="event-info"><span class="event-label">Organized By:</span><%# Eval("Organizedby") %></div>
                            <div class="event-info"><span class="event-label">Date:</span><%# Eval("Startdate", "{0:dd/MM/yyyy}") %></div>
                            <div class="event-info"><span class="event-label">Venue:</span><%# Eval("Venue") %></div>
                            <asp:Button ID="Button1" runat="server" CssClass="view-button"
                                CommandArgument='<%# Eval("EventId") %>' OnClick="Button1_Click" Text="View More" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
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

        // Tab switching
        function showTab(tabName) {
            var upcomingSection = document.getElementById("tab-upcoming");
            var closedSection = document.getElementById("tab-closed");
            var btnUpcoming = document.getElementById("btnUpcoming");
            var btnClosed = document.getElementById("btnClosed");

            if (tabName === "upcoming") {
                upcomingSection.classList.add("active");
                closedSection.classList.remove("active");
                btnUpcoming.classList.add("active");
                btnClosed.classList.remove("active");
            } else {
                closedSection.classList.add("active");
                upcomingSection.classList.remove("active");
                btnClosed.classList.add("active");
                btnUpcoming.classList.remove("active");
            }
        }
    </script>
</asp:Content>

