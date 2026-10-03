<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageStudents.aspx.cs" Inherits="Admin_ManageStudents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
         /* Container */
        .container {
            width: 60%;
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

        /* Form Rows */
        .form-row {
            display: flex;
            margin-bottom: 15px;
            align-items: center;
        }

        .form-row label {
            width: 150px;
            font-weight: bold;
            color: #555;
        }

        .form-row input[type="text"],
        .form-row input[type="email"],
        .form-row input[type="password"],
        .form-row input[type="tel"] {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        /* Buttons */
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
        .btn-cancel { background-color: #9E9E9E; color: white; }

        /* GridView Styling */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
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
            background-color: #f9f9f9; /* subtle alternate row color */
        }

        .gridview tr:hover td {
            background-color: #f1f1f1;
        }

        .gridview .select-button {
            background-color: #2196F3;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="page-title">Manage Students</div>

        <!-- Student Form -->
        <div class="form-row">
            <label>Student Id:</label>
            <asp:TextBox ID="txtid" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Name:</label>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>College Name:</label>
            <asp:TextBox ID="txtclg" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Department:</label>
            <asp:TextBox ID="txtdept" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Year:</label>
            <asp:TextBox ID="txtyear" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Email:</label>
            <asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Contact:</label>
            <asp:TextBox ID="txtcontact" runat="server" TextMode="Phone"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Username:</label>
            <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
        </div>

        <div class="form-row">
            <label>Password:</label>
            <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
        </div>

        <!-- Buttons -->
        <div class="form-row" style="justify-content: center; margin-top: 20px;">
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnaddnew" runat="server" Text="Add New" CssClass="btn btn-add" OnClick="btnaddnew_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-save" OnClick="btnsave_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-update" OnClick="btnupdate_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn btn-delete" OnClick="btndelete_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn btn-cancel" OnClick="btncancel_Click" />
        </div>

        <!-- GridView -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview"
            DataKeyNames="Id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                <asp:BoundField DataField="SName" HeaderText="Name" />
                <asp:BoundField DataField="CName" HeaderText="College Name" />
                <asp:BoundField DataField="Dept" HeaderText="Department" />
                <asp:BoundField DataField="Year" HeaderText="Year" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" />
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT DISTINCT * FROM [AdminStudents]"></asp:SqlDataSource>
    </div>
</asp:Content>

