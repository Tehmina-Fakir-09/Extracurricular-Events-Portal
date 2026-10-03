<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="EventRegistration.aspx.cs" Inherits="Student_EventRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        

        /* Form Container */
        .form-container {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px 40px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .form-container:hover {
            transform: translateY(-3px);
        }

        /* Form Heading */
        .form-container h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            color: #2c3e50;
        }

        /* Form Fields */
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
            transition: border 0.3s, box-shadow 0.3s;
        }

        .form-field input:focus,
        .form-field select:focus,
        .form-field textarea:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 5px rgba(26, 188, 156, 0.3);
            outline: none;
        }

        /* Required Field Error */
        span {
            font-size: 13px;
            color: #e74c3c;
        }

        /* Buttons */
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


        /* Responsive */
        @media screen and (max-width: 768px) {
            .form-container {
                padding: 20px;
                margin: 30px 15px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="form-container">
        <h2>Event Registration Form</h2>

        <!-- Select Event -->
        <div class="form-field">
            <label for="ddlEvent">Select Event</label>
            <asp:DropDownList ID="ddlEvent" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataValueField="Eventname" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Eventname] FROM [ManageEvent] where Status='Upcoming'">
                
            </asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="rfvEvent" runat="server" ControlToValidate="ddlEvent"
                InitialValue="" ErrorMessage="Please select an event" ForeColor="Red" />
        </div>

        <!-- Student Name -->
        <div class="form-field">
            <label for="txtName">Full Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                ErrorMessage="Name is required" ForeColor="Red" />
        </div>

        <!-- Email -->
        <div class="form-field">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Email is required" ForeColor="Red" />
        </div>

        <!-- Contact Number -->
        <div class="form-field">
            <label for="txtContact">Contact Number</label>
            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" MaxLength="10" />
            <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContact"
                ErrorMessage="Contact number is required" ForeColor="Red" />
        </div>

        <!-- College Name -->
        <div class="form-field">
            <label for="txtCollege">College Name</label>
            <asp:TextBox ID="txtCollege" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvCollege" runat="server" ControlToValidate="txtCollege"
                ErrorMessage="College name is required" ForeColor="Red" />
        </div>

        <!-- Payment Method -->
        <div class="form-field">
            <label for="ddlPayment">Payment Method</label>
            <asp:DropDownList ID="ddlPayment" runat="server" CssClass="form-control">
                <asp:ListItem Text="--Select Payment Method--" Value="" />
                <asp:ListItem Text="Cash" Value="Cash" />
                <asp:ListItem Text="Online/UPI" Value="Online/UPI" />
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvPayment" runat="server" ControlToValidate="ddlPayment"
                InitialValue="" ErrorMessage="Payment method is required" ForeColor="Red" />
        </div>

        <!-- Remarks -->
        <div class="form-field">
            <label for="txtRemarks">Remarks (Optional)</label>
            <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>

        <!-- Buttons -->
        <div class="form-buttons">
            <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnReset_Click" />
        </div>
    </div>
</asp:Content>

