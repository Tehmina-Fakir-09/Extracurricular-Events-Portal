<%@ Page Title="" Language="C#" MasterPageFile="~/College/College.master" AutoEventWireup="true" CodeFile="ViewEventRegistrations.aspx.cs" Inherits="College_ViewEventRegistrations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /* ======= Page Background ======= */
        body {
            background-color: #f4f5f7;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* ======= Main Container ======= */
        .event-container {
            width: 85%;
            margin: 40px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            font-weight: 600;
            margin-bottom: 25px;
        }

        /* ======= GridView Styling ======= */
        .styled-gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 15px;
        }

        .styled-gridview th {
            background-color: #e9ecef;
            color: #333;
            font-weight: 600;
            text-align: left;
            padding: 12px;
            border-bottom: 2px solid #d1d1d1;
        }

        .styled-gridview td {
            padding: 10px 12px;
            border-bottom: 1px solid #e0e0e0;
            color: #555;
        }

        .styled-gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .styled-gridview tr:hover {
            background-color: #f1f1f1;
            transition: 0.3s;
        }

        /* ======= Responsive ======= */
        @media (max-width: 768px) {
            .event-container {
                width: 95%;
                padding: 20px;
            }
            .styled-gridview {
                font-size: 14px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="event-container">
        <h2>Registered Students for Events</h2>

        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" 
            CssClass="styled-gridview">
            
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

        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
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
    </div>
</asp:Content>
