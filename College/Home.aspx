<%@ Page Title="" Language="C#" MasterPageFile="~/College/College.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="College_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        
        .dashboard {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin: 30px;
        }

        .card {
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card h3 {
            margin-bottom: 10px;
            color: #333;
        }

        .card p {
            font-size: 14px;
            color: #666;
        }

        .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #555;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #333;
        }

        .welcome {
            margin: 20px;
            text-align: center;
            color: #444;
        }
         /* ===== Modern Grey & White Table Theme ===== */
        .table-title {
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            color: #444;
            margin: 25px 0 15px 0;
        }

        .event-grid {
            width: 95%;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            font-family: 'Segoe UI', sans-serif;
        }

        .event-grid th {
            background-color: #e6e6e6;
            color: #333;
            font-weight: 600;
            text-align: left;
            padding: 12px 14px;
            border-bottom: 2px solid #ccc;
        }

        .event-grid td {
            background-color: #fff;
            color: #444;
            padding: 12px 14px;
            border-bottom: 1px solid #ddd;
        }

        .event-grid tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        .event-grid tr:hover td {
            background-color: #efefef;
            transition: 0.3s ease;
        }

        .table-wrapper {
            overflow-x: auto;
        }
    .auto-style4 {
        overflow-x: auto;
        text-align: center;
    }
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcome">
        <h2>Welcome&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </h2>
        <p>Manage your events and track responses</p>
    </div>
    <h2 class="table-title">Recent Events</h2>

    <div class="auto-style4">
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            CssClass="event-grid"
            DataKeyNames="EventId">

            <Columns>
                <asp:BoundField DataField="EventId" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Eventname" HeaderText="Event Name" />
                <asp:BoundField DataField="Eventtype" HeaderText="Type" />
                <asp:BoundField DataField="Startdate" HeaderText="Start Date" DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="Enddate" HeaderText="End Date" DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="Venue" HeaderText="Venue" />
                <asp:BoundField DataField="Registrationdeadline" HeaderText="Deadline" DataFormatString="{0:dd MMM yyyy}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>">
        </asp:SqlDataSource>
        <div class="auto-style4">
        </div>
    </div>
    <h2 class="table-title">View Participants</h2>

    <div class="auto-style4">
        <asp:GridView 
            ID="GridView2" 
            runat="server" 
            AutoGenerateColumns="False" 
            CssClass="event-grid" DataSourceID="SqlDataSource2">

             <Columns>
                <asp:BoundField DataField="Event" HeaderText="Event" SortExpression="Event" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                <asp:BoundField DataField="College" HeaderText="College" SortExpression="College" />
                <asp:BoundField DataField="Paymentmethod" HeaderText="Payment Method" SortExpression="Paymentmethod" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
             SelectCommand="
                SELECT EventReg.Event, EventReg.Name, EventReg.Email, EventReg.Contact, 
                       EventReg.College, EventReg.Paymentmethod, EventReg.Status
                FROM EventReg 
                INNER JOIN ManageEvent ON EventReg.Event = ManageEvent.Eventname
                WHERE ManageEvent.CollegeId = @CollegeId">
            <SelectParameters>
                <asp:Parameter Name='CollegeId' Type='String' />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="auto-style4">
        </div>
    </div>
    </asp:Content>

