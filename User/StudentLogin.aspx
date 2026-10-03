<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="StudentLogin.aspx.cs" Inherits="User_StudentLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 40px auto;
            gap: 40px;
            width: 80%;
        }

        .login-image {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-form {
            flex: 1;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 26px;
            color: #333;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #444;
        }

        .textbox {
            width: 100%;
            padding: 10px 12px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            outline: none;
            transition: border 0.3s;
        }

        .textbox:focus {
            border-color: #007bff;
        }

        .btn {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            font-size: 15px;
            transition: background 0.3s;
        }

        .btn-login {
            background-color: #007bff;
            color: white;
        }

        .btn-login:hover {
            background-color: #0056b3;
        }

        .btn-reset {
            background-color: #f44336;
            color: white;
        }

        .btn-reset:hover {
            background-color: #d32f2f;
        }

        .btn-group {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }

        .register-link {
            display: block;
            text-align: center;
            margin-top: 18px;
        }

        .register-link a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="login-container">
        <div class="login-image">
            <asp:Image ID="Image1" runat="server" Height="300px" Width="500px" ImageUrl="~/Images/login1.jpg" />
        </div>
        <div class="login-form">
            <h2>Student Login</h2>
            
            <div class="form-group">
                <label for="txtuser">Username</label>
                <asp:TextBox ID="txtuser" runat="server" CssClass="textbox"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtpass">Password</label>
                <asp:TextBox ID="txtpass" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
            </div>

            <div class="btn-group">
                <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn btn-login" OnClick="btnlogin_Click" />
                <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn btn-reset" OnClick="btnreset_Click" />
            </div>

            <div class="register-link">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/User/StudentRegistration.aspx">Register Here!!</asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Content>

