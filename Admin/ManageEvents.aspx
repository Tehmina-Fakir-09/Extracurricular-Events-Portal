<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageEvents.aspx.cs" Inherits="Admin_ManageEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .container {
            width: 90%;
            margin: 50px auto;
            padding: 30px;
            background-color: #f8f8f8;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .page-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 25px;
        }

        .form-row {
            display: flex;
            margin-bottom: 15px;
            align-items: center;
        }

        .form-row label {
            width: 180px;
            font-weight: bold;
            color: #555;
        }

        .form-row input[type="text"],
        .form-row input[type="date"],
        .form-row textarea,
        .form-row select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-row textarea {
            resize: vertical;
        }

        .image-upload {
            margin-left: 20px;
            text-align: center;
        }
        .image-upload-text {
          text-align: center;
          font-weight: bold;
          color: #333;
          margin: 10px 0;
          font-size: 14px;
}
        .image-upload img {
            width: 120px;
            height: 150px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            margin-right: 10px;
            cursor: pointer;
        }

        .btn-add { background-color: #4CAF50; color: white; }
        .btn-save { background-color: #2196F3; color: white; }
        .btn-update { background-color: #FF9800; color: white; }
        .btn-delete { background-color: #F44336; color: white; }
        .btn-reset { background-color: #9E9E9E; color: white; }
        .btn-upload { background-color: #607D8B; color: white; }

        .gridview {
            width: 80%;
            border-collapse: collapse;
            margin-top: 30px;
            font-family: Arial, sans-serif;
        }

        .gridview th {
            background-color: #888888;
            color: white;
            padding: 10px;
            text-align: center;
        }

        .gridview td {
            background-color: white;
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        .gridview tr:hover td {
            background-color: #f1f1f1;
        }

        .auto-style4 {
            display: flex;
            margin-bottom: 15px;
            align-items: center;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="page-title">Manage Events</div>

        <div style="display:flex; gap:30px;">
            <!-- Form Section -->
            <div style="flex:2;">
                <div class="form-row">
                    <label>Event ID:</label>
                    <asp:TextBox ID="txtid" runat="server" Enabled="False"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>College Name:</label>
                    <asp:DropDownList ID="ddlCollege" runat="server" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True" DataSourceID="SqlDataSource2">
                        <asp:ListItem Text="-- Select College --" Value="" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Id], [Name] FROM [CollegeRegistration]"></asp:SqlDataSource>
                </div>

                <div class="form-row">
                    <label>Event Name:</label>
                    <asp:TextBox ID="txteventname" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Organized By:</label>
                    <asp:TextBox ID="txtorganizedby" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Event Type:</label>
                    <asp:TextBox ID="txteventtype" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Start Date:</label>
                    <asp:TextBox ID="txtstartdate" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>End Date:</label>
                    <asp:TextBox ID="txtenddate" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Venue:</label>
                    <asp:TextBox ID="txtvenue" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Description:</label>
                    <asp:TextBox ID="txtdescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Registration Deadline:</label>
                    <asp:TextBox ID="txtregister" runat="server" TextMode="Date"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Max Participants:</label>
                    <asp:TextBox ID="txtmax" runat="server"></asp:TextBox>
                </div>

                <div class="form-row">
                    <label>Status:</label>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Text="-- Select Status --" Value="" />
                        <asp:ListItem Text="Upcoming" Value="Upcoming" />
                        <asp:ListItem Text="Closed" Value="Closed" />
                    </asp:DropDownList>
                </div>
                <div class="form-row">
                    <label>Fee:</label>
                    <asp:TextBox ID="txtfee" runat="server"></asp:TextBox>
                </div>
                <!-- Buttons -->
                <div class="auto-style4" style="justify-content:center; margin-top:20px;">
                    <asp:Button ID="btnaddnew" runat="server" Text="Add New" CssClass="btn btn-add" OnClick="btnaddnew_Click" />
                    &nbsp;
                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-save" OnClick="btnsave_Click" />
                    &nbsp;
                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-update" OnClick="btnupdate_Click" />
                    &nbsp;
                    <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-delete" OnClick="btndelete_Click" />
                    &nbsp;
                    <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn btn-reset" OnClick="btnreset_Click" />
                </div>
            </div>
            

            <!-- Image Upload Section -->
            <div class="image-upload">
                <asp:Image ID="Image1" runat="server" />
                <br />
                <!-- Text below image -->
                <div class="image-upload-text">
                  Upload Poster of Event
                 </div>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br /><br />
                <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-upload" OnClick="btnupload_Click" />
            </div>
        </div>

        <!-- GridView -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview"
            DataKeyNames="EventId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="EventId" HeaderText="Id" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="College" />
                <asp:BoundField DataField="EventName" HeaderText="Ename" />
                <asp:BoundField DataField="OrganizedBy" HeaderText="Organizer" />
                <asp:BoundField DataField="Image" HeaderText="Image" />
                <asp:BoundField DataField="EventType" HeaderText="Etype" />
                <asp:BoundField DataField="StartDate" HeaderText="Startdate" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="EndDate" HeaderText="Enddate" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="Venue" HeaderText="Venue" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="RegistrationDeadline" HeaderText="Deadline" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="MaxParticipant" HeaderText="Maxparticipant" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="Fee" HeaderText="Fee" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT E.*, C.Name FROM ManageEvent E INNER JOIN CollegeRegistration C ON E.CollegeID = C.ID">
        </asp:SqlDataSource>
    </div>
</asp:Content>
