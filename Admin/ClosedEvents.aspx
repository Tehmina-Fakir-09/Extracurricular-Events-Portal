<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ClosedEvents.aspx.cs" Inherits="Admin_ClosedEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
       
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
    <div class="events">
        <h3>Closed Events</h3>
        <asp:GridView ID="gvClosedEvents" runat="server" CssClass="grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Eventname" HeaderText="Event Title" />
                <asp:BoundField DataField="EventType" HeaderText="Event Type" />
                <asp:BoundField DataField="OrganizedBy" HeaderText="Organized By" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false"  />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="false" />
                <asp:BoundField DataField="Venue" HeaderText="Venue" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Eventname], [Organizedby], [Eventtype], [Startdate], [Enddate], [Venue] FROM [ManageEvent] WHERE EndDate < GETDATE()">
            
        </asp:SqlDataSource>
    </div>
</asp:Content>

