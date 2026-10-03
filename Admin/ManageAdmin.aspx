<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageAdmin.aspx.cs" Inherits="Admin_ManageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        

        /* Container card */
        .admin-card {
            max-width: 600px;
            margin: 40px auto;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 30px 40px;
        }

        /* Card header */
        .admin-card h2 {
            text-align: center;
            margin-bottom: 30px;
            color: black;
        }

        /* Form groups */
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #333333;
        }

        .form-group input {
            padding: 10px 12px;
            font-size: 16px;
            border-radius: 6px;
            border: 1px solid #ccc;
            outline: none;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.5);
        }

        /* Validator */
        .validator-error {
            color: red;
            font-weight: 600;
            margin-top: 5px;
        }

        /* Buttons */
        .button-group {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .btn {
            padding: 10px 20px;
            font-weight: bold;
            border-radius: 6px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            color: #fff;
        }

        .btn-save { background-color: #007bff; }
        .btn-update { background-color: #28a745; }
        .btn-delete { background-color: #dc3545; }
        .btn-cancel { background-color: #6c757d; }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }

        /* GridView */
        .grid-wrapper {
            margin-top: 30px;
            overflow-x: auto;
        }

        .grid-wrapper {
            width: 100%;
            border-collapse: collapse;
            min-width: 400px;
        }

        .grid-wrapper th {
            background-color: #666666;
            color: #fff;
            padding: 12px;
            font-weight: bold;
            text-align: center;
        }

        .grid-wrapper td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        .grid-wrapper tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .grid-wrapper tr:hover {
            background-color: #e9f1ff;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="admin-card">
        <h2>Manage Admin</h2>

        <!-- Username -->
        <div class="form-group">
            <label for="txtuser">Username:</label>
            <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="txtpass">Password:</label>
            <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
        </div>

        <!-- Confirm Password -->
        <div class="form-group">
            <label for="txtconfirm">Confirm Password:</label>
            <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtconfirm" ControlToValidate="txtpass" ErrorMessage="Password must be same!" CssClass="validator-error"></asp:CompareValidator>
        </div>

        <!-- Buttons -->
        <div class="button-group">
            <asp:Button ID="btnsave" runat="server" CssClass="btn btn-save" Text="Save" OnClick="btnsave_Click" />
            <asp:Button ID="btnupdate" runat="server" CssClass="btn btn-update" Text="Update" OnClick="btnupdate_Click" />
            <asp:Button ID="btndelete" runat="server" CssClass="btn btn-delete" Text="Delete" OnClick="btndelete_Click" CausesValidation="false" />
            <asp:Button ID="btncancel" runat="server" CssClass="btn btn-cancel" Text="Cancel" OnClick="btncancel_Click" CausesValidation="false" />
        </div>

        <!-- Grid -->
        <div class="grid-wrapper">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Admin]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

