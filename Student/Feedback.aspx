<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Student_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         
        /* Container */
        .feedback-container {
            max-width: 650px;
            margin: 50px auto;
            padding: 30px 40px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        /* Heading */
        .feedback-container h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            color: #2c3e50;
        }

        /* Labels & Inputs */
        .form-field {
            margin-bottom: 20px;
        }

        .form-field label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
            color: #34495e;
        }

        .form-field input,
        .form-field textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border 0.3s, box-shadow 0.3s;
        }

        .form-field input:focus,
        .form-field textarea:focus {
            border-color: #3498db;
            box-shadow: 0 0 6px rgba(52, 152, 219, 0.3);
            outline: none;
        }

        /* Rating */
        .rating-stars {
            display: flex;
            gap: 6px;
            align-items: center;
        }

        .rating-stars img {
            cursor: pointer;
            transition: transform 0.2s;
        }

        .rating-stars img:hover {
            transform: scale(1.2);
        }

        /* Error messages */
        span {
            font-size: 13px;
            color: #e74c3c;
        }

        /* Buttons */
        .form-buttons {
            text-align: center;
            margin-top: 25px;
        }

        .form-buttons .btn {
            padding: 10px 25px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin: 0 10px;
            transition: background 0.3s, transform 0.2s;
            color: #fff;
        }

        .btn-submit {
            background: #3498db;
        }

        .btn-submit:hover {
            background: #2980b9;
            transform: translateY(-2px);
        }

        .btn-reset {
            background: #e74c3c;
        }

        .btn-reset:hover {
            background: #c0392b;
            transform: translateY(-2px);
        }

        /* Responsive */
        @media screen and (max-width: 768px) {
            .feedback-container {
                padding: 20px;
                margin: 30px 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="feedback-container">
        <h2>Feedback</h2>

        <!-- Name -->
        <div class="form-field">
            <label for="txtname">Name</label>
            <asp:TextBox ID="txtname" runat="server" Enabled="False" CssClass="form-control" />
        </div>

        <!-- Email -->
        <div class="form-field">
            <label for="txtemail">Email</label>
            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                ErrorMessage="Invalid Email address" ForeColor="Red"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>

        <!-- Phone -->
        <div class="form-field">
            <label for="txtphone">Phone No.</label>
            <asp:TextBox ID="txtphone" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone"
                ErrorMessage="Enter valid 10-digit phone no." ForeColor="Red"
                ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
        </div>

        <!-- Rating -->
        <div class="form-field">
            <label>Rating</label>
            <div class="rating-stars">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Star.gif" OnClick="ImageButton1_Click" style="height: 17px; width: 17px" />
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/Star.gif" OnClick="ImageButton2_Click" style="height: 17px; width: 17px"/>
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/Star.gif" OnClick="ImageButton3_Click" style="width: 17px; height: 17px" />
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/Star.gif" OnClick="ImageButton4_Click" style="height: 17px; width: 17px" />
                <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/Star.gif" OnClick="ImageButton5_Click" style="height: 17px; width: 17px"/>
                <asp:Label ID="lblrating" runat="server" Visible="False"></asp:Label>
            </div>
        </div>

        <!-- Message -->
        <div class="form-field">
            <label for="txtmsg">Message</label>
            <asp:TextBox ID="txtmsg" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
        </div>

        <!-- Buttons -->
        <div class="form-buttons">
            <strong>
            <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-submit" OnClick="btnsubmit_Click" Font-Bold="True" />
            <asp:Button ID="btnreset" runat="server" Text="Reset" CssClass="btn btn-reset" OnClick="btnreset_Click" CausesValidation="false" Font-Bold="True" Font-Italic="False" />
            </strong>
        </div>
    </div>
</asp:Content>
