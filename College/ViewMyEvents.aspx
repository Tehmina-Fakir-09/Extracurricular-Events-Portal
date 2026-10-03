<%@ Page Title="" Language="C#" MasterPageFile="~/College/College.master" AutoEventWireup="true" CodeFile="ViewMyEvents.aspx.cs" Inherits="College_ViewMyEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="table-title">📋 My Events</h2>

    <div class="table-wrapper">
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
    </div>
</asp:Content>
