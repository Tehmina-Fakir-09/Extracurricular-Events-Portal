<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Student_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .payment-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px 40px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .payment-container h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            color: #2c3e50;
        }

        .form-field {
            margin-bottom: 20px;
        }

        .form-field label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #34495e;
        }

        .form-field input,
        .form-field select,
        .form-field textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .btn-submit {
            background: #28a745;
            color: #fff;
            padding: 12px 25px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }

        .btn-submit:hover {
            background: #218838;
        }

        #qrCode {
            display: block;
            margin: 20px auto;
            max-width: 250px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="payment-container">
        <h2>Event Payment</h2>

        <div class="form-field">
            <label>Event Name</label>
            <asp:Label ID="lblEventName" runat="server" Text=""></asp:Label>
        </div>

        <div class="form-field">
    <label>Event Fee</label>
    <asp:Label ID="lblEventFee" runat="server" Text=""></asp:Label>
</div>

        <div class="form-field">
            <label>Email</label>
            <asp:Label ID="lblemail" runat="server" Text=""></asp:Label>
        </div>
        <div class="form-field">
            <label>Payment Method</label>
            <asp:Label ID="lblPaymentMethod" runat="server" Text=""></asp:Label>
        </div>

        <!-- QR Code for Online/UPI -->
        <div class="form-field" id="divOnline" runat="server" visible="false">
            <label>Scan QR Code to Pay</label>
            <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl="~/Images/Tehmina UPI.jpg" Width="170px" />
            <p>Scan this QR code using your UPI app and enter the Transaction ID below.</p>
        </div>

        <!-- Bank Transfer Instructions -->



        <!-- Transaction ID input -->
        <div class="form-field" id="divTransaction" runat="server" visible="false">
            <label>Transaction ID / UPI ID</label>
            <asp:TextBox ID="txtTransactionID" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvTransaction" runat="server" ControlToValidate="txtTransactionID"
                ErrorMessage="Transaction ID is required" ForeColor="Red" />
        </div>

        <!-- Submit Payment -->
        <asp:Button ID="btnPay" runat="server" Text="Confirm Payment" CssClass="btn-submit" OnClick="btnPay_Click" />
    </div>
</asp:Content>

