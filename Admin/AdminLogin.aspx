<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Admin_AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <style type="text/css">
        /* ---- Overall Page ---- */
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #f1f1f1, #e0e0e0);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* ---- Login Card ---- */
        .login-container {
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            width: 420px;
            padding: 30px 40px;
            text-align: center;
            transition: all 0.3s ease-in-out;
        }

        .login-container:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        }

        /* ---- Title ---- */
        .login-title {
            font-size: 28px;
            font-weight: 600;
            color: #333;
            margin-bottom: 25px;
        }

        /* ---- Labels and Inputs ---- */
        label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }

        .textbox {
            width: 100%;
            height: 38px;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 6px 10px;
            font-size: 15px;
            background-color: #f9f9f9;
            transition: border 0.2s ease-in-out;
        }

        .textbox:focus {
            border-color: #888;
            outline: none;
            background-color: #fff;
        }

        /* ---- Buttons ---- */
        .btn-row {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button {
            border: none;
            width: 48%;
            height: 38px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            color: white;
            transition: all 0.2s ease-in-out;
        }

        /* Blue Login Button */
        .login-btn {
            background-color: #007BFF;
        }

        .login-btn:hover {
            background-color: #0056b3;
        }

        /* Red Reset Button */
        .reset-btn {
            background-color: #dc3545;
        }

        .reset-btn:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-title">Admin Login</div>

            <div>
                <label for="txtuser">Username</label>
                <asp:TextBox ID="txtuser" runat="server" CssClass="textbox"></asp:TextBox>
            </div>

            <div style="margin-top: 15px;">
                <label for="txtpass">Password</label>
                <asp:TextBox ID="txtpass" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
            </div>

            <div class="btn-row">
                <asp:Button ID="btnlogin" runat="server" CssClass="button login-btn" Text="Login" OnClick="btnlogin_Click" />
                <asp:Button ID="btnreset" runat="server" CssClass="button reset-btn" Text="Reset" OnClick="btnreset_Click" />
            </div>
        </div>
    </form>
</body>
</html>
