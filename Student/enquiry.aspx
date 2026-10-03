<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="enquiry.aspx.cs" Inherits="Student_enquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
      
        .form-container {
            width: 50%;
            margin: 40px auto;
            background: #fff;
            padding: 25px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        .textbox {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            background-color: #333;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #555;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-container">
        <h2>Submit Your Enquiry</h2>
        <div class="form-group">
            <label for="txtName">Full Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtcontact">Contact</label>
            <asp:TextBox ID="txtcontact" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtSubject">Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtMessage">Message</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="5"></asp:TextBox>
        </div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="btnSubmit_Click" />
    </div>
    <br />
</asp:Content>

