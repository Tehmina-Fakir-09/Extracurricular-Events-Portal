<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Student_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .banner {
            width: 100%;
            height: 300px;
            background: url('images/event1.jpg') no-repeat center center;
            background-size: cover;
        }
        .welcome-box {
            text-align: center;
            padding: 30px;
        }
        .events {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 15px;
            border: 1px solid #ddd;
        }
        .events h3 {
            margin-bottom: 15px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
        }
        .grid th, .grid td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .grid th {
            background-color: #eee;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Welcome Section -->
    <div class="welcome-box">
        <h2>Welcome
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            !</h2>
        <p>View and register for exciting events!</p>
    </div>


    <!-- Events Grid -->
    <div class="events">
        <h3>Upcoming Events</h3>
        <asp:GridView ID="gvEvents" runat="server" CssClass="grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Eventname" HeaderText="Eventname" SortExpression="Eventname" />
                <asp:BoundField DataField="Organizedby" HeaderText="Organizedby" SortExpression="Organizedby" />
                <asp:BoundField DataField="Eventtype" HeaderText="Eventtype" SortExpression="Eventtype" />
                <asp:BoundField DataField="Startdate" HeaderText="Startdate" SortExpression="Startdate" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="Enddate" HeaderText="Enddate" SortExpression="Enddate" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="Venue" HeaderText="Venue" SortExpression="Venue" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Eventname], [Organizedby], [Eventtype], [Startdate], [Enddate], [Venue] FROM [ManageEvent] WHERE EndDate >= GETDATE()"></asp:SqlDataSource>
    </div>
</asp:Content>

