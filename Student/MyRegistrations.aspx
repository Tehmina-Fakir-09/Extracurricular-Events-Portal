<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="MyRegistrations.aspx.cs" Inherits="Student_MyRegistrations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* ===== Page Background ===== */
        body {
            background-color: #f7f7f7; /* light grey background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* ===== Main Container ===== */
        .registration-container {
            width: 85%;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* ===== Heading ===== */
        .page-title {
            text-align: center;
            font-size: 26px;
            font-weight: 600;
            color: #333;
            margin-bottom: 25px;
        }

        /* ===== GridView Table Styling ===== */
        .gridview-style {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #e0e0e0;
        }

        .gridview-style th {
            background-color: #e6e6e6; /* soft grey header */
            color: #333;
            text-align: left;
            padding: 12px;
            font-weight: 600;
            border-bottom: 2px solid #d0d0d0;
        }

        .gridview-style td {
            background-color: #fafafa;
            padding: 10px;
            color: #444;
            border-bottom: 1px solid #e0e0e0;
        }

        /* Alternating Row Colors */
        .gridview-style tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        /* Hover Effect */
        .gridview-style tr:hover td {
            background-color: #e9e9e9;
            transition: 0.3s ease;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .registration-container {
                width: 95%;
                padding: 15px;
            }

            .gridview-style th,
            .gridview-style td {
                font-size: 14px;
                padding: 8px;
            }

            .page-title {
                font-size: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="registration-container">
        <h2 class="page-title">📋 My Event Registrations</h2>

        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            CssClass="gridview-style"
            HeaderStyle-BackColor="#e6e6e6"
            AlternatingRowStyle-BackColor="#f9f9f9"
            RowStyle-BackColor="#ffffff"
            BorderColor="#ddd"
            BorderWidth="1px"
            GridLines="None">
            <Columns>
                <asp:BoundField DataField="Event" HeaderText="Event" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="College" HeaderText="College" />
                <asp:BoundField DataField="Paymentmethod" HeaderText="Payment Method" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT [Event], [Name], [Contact], [Email], [College], [Paymentmethod], [Status]
                           FROM [EventReg] WHERE [Email] = @Email">
            <SelectParameters>
                <asp:Parameter Name="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
