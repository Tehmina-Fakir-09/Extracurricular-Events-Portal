<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="CollegeRegistration.aspx.cs" Inherits="User_CollegeRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <style>
      
        /* Container */
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #555;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .form-group textarea {
            resize: vertical;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .form-buttons .btn {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-submit {
            background-color: #007BFF;
            color: #fff;
        }

        .btn-reset {
            background-color: #DC3545;
            color: #fff;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        .btn-reset:hover {
            background-color: #a71d2a;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-container">
        <h2>College Registration</h2>

        <div class="form-group">
            <label>College Id:</label>
            <asp:TextBox ID="txtid" runat="server" Enabled="False"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>College Name:</label>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Address:</label>
            <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>City:</label>
            <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>State:</label>
            <asp:TextBox ID="txtstate" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Contact:</label>
            <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Website:</label>
            <asp:TextBox ID="txtwebsite" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Username:</label>
            <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-buttons">
            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-submit" Text="Submit" OnClick="btnsubmit_Click" />
            <asp:Button ID="btnreset" runat="server" CssClass="btn btn-reset" Text="Reset" OnClick="btnreset_Click" />
        </div>
    </div>
</asp:Content>

