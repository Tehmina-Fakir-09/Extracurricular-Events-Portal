<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/College/College.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="College_EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
        }

        /* Page wrapper */
        .profile-container {
            max-width: 900px;
            margin: 40px auto;
            background-color: #fff;
            padding: 25px 35px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        /* Heading */
        .profile-title {
            font-size: 24px;
            text-align: center;
            margin-bottom: 25px;
            color: #333;
            font-weight: bold;
        }

        /* Modern DetailsView Styling */
        .modern-detailsview {
            width: 100%;
            border-collapse: collapse;
        }

        .modern-detailsview th {
            background-color: #444; /* dark grey to match menu */
            color: #fff;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }

        .modern-detailsview td {
            padding: 12px;
            border-bottom: 1px solid #e0e0e0;
            color: #333;
        }

        /* Alternate row background */
        .modern-detailsview tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        /* Hover effect */
        .modern-detailsview tr:hover td {
            background-color: #f1f1f1;
        }

        /* Edit row highlight */
        .modern-detailsview .edit-row td {
            background-color: #f0f0f0;
            font-weight: bold;
        }

        /* Edit button */
        .modern-detailsview .edit-button {
            background-color: #444;
            color: #fff;
            border: none;
            padding: 8px 14px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .modern-detailsview .edit-button:hover {
            background-color: #666;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="profile-container">
        <div class="profile-title">Edit Profile</div>

        <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" 
            DataKeyNames="Id" 
            DataSourceID="SqlDataSource1" 
            CssClass="modern-detailsview"
            GridLines="None">
            
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="City" HeaderText="City" />
                <asp:BoundField DataField="State" HeaderText="State" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Contact" HeaderText="Contact" />
                <asp:BoundField DataField="Website" HeaderText="Website" />
                <asp:BoundField DataField="Username" HeaderText="Username" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
                <asp:CommandField ShowEditButton="True" EditText="Edit" UpdateText="Update" CancelText="Cancel" ControlStyle-CssClass="edit-button" />
            </Fields>
        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT * FROM [CollegeRegistration] WHERE ([Username] = @Username)" 
            UpdateCommand="UPDATE CollegeRegistration SET Name=@Name, Address=@Address, City=@City, State=@State, Contact=@Contact, Website=@Website, Email=@Email, Password=@Password WHERE Id=@Id">
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="college" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
