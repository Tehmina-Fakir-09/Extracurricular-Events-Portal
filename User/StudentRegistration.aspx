<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.master" AutoEventWireup="true" CodeFile="StudentRegistration.aspx.cs" Inherits="User_StudentRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      
         /* Container */
        .container {
            width: 60%;
            margin: 50px auto;
            padding: 30px;
            background-color: #f8f8f8;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            font-family: Arial, sans-serif;
        }

        /* Page Title */
        .page-title {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 25px;
        }

        /* Form group */
        .form-group {
            display: flex;
            margin-bottom: 15px;
            align-items: center;
        }

        .form-group label {
            width: 150px;
            font-weight: bold;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 8px 12px;
            border-radius: 5px;
            border: 1px solid #ccc;
            height: 35px;
            font-size: 14px;
        }

        /* Buttons */
        .form-buttons {
    text-align: center;
    margin-top: 25px;
}

.form-buttons .btn {
    padding: 10px 25px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s, transform 0.2s;
    margin: 0 10px;
}

/* Register button → Blue */
.form-buttons .btn-success {
    background: #007bff; /* Bright Blue */
    color: #fff;
}

.form-buttons .btn-success:hover {
    background: #0056b3;
    transform: translateY(-2px);
}

/* Reset button → Red */
.form-buttons .btn-secondary {
    background: #f44336; /* Bright Red */
    color: #fff;
}

.form-buttons .btn-secondary:hover {
    background: #d32f2f;
    transform: translateY(-2px);
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <div class="page-title">Student Registration</div>

        <div class="form-group">
            <label for="txtid">Student Id:</label>
            <asp:TextBox ID="txtid" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtname">Name:</label>
            <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtclg">College Name:</label>
            <asp:TextBox ID="txtclg" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtdept">Department:</label>
            <asp:TextBox ID="txtdept" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtyear">Year:</label>
            <asp:TextBox ID="txtyear" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtemail">Email:</label>
            <asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtcontact">Contact:</label>
            <asp:TextBox ID="txtcontact" runat="server" TextMode="Phone"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtuser">Username:</label>
            <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtpass">Password:</label>
            <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-buttons">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnReset_Click" />
        </div>
    </div>
</asp:Content>

