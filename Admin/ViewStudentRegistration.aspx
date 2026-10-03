<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ViewStudentRegistration.aspx.cs" Inherits="Admin_ViewStudentRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
        /* Container */
        .container {
            width: 70%;
            margin: 50px auto;
            padding: 30px;
            background-color: #f8f8f8;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        /* Page Title */
        .page-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 25px;
        }

        /* GridView Styling */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        .gridview th {
            background-color: #888888; /* grey header */
            color: white;
            padding: 10px;
            text-align: center;
        }

        .gridview td {
            background-color: white; /* white rows */
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

        /* Selected Row */
        .gridview .selected-row {
            background-color: #D1DDF1 !important;
            font-weight: bold;
            color: #333;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <div class="page-title">View Student Registration</div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview"
            DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="None" HorizontalAlign="Center"
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="SName" HeaderText="SName" SortExpression="SName" />
                <asp:BoundField DataField="CName" HeaderText="CName" SortExpression="CName" />
                <asp:BoundField DataField="Dept" HeaderText="Dept" SortExpression="Dept" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            </Columns>

            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle CssClass="selected-row" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT DISTINCT * FROM [AdminStudents]">
        </asp:SqlDataSource>
    </div>
</asp:Content>

