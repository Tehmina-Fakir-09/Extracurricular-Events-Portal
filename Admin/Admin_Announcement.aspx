<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Admin_Announcement.aspx.cs" Inherits="Admin_Admin_Announcement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Scoped styles so they don't affect master page elements */
        .announcement-page .form-box {
            width: 70%;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .announcement-page h2 {
            color: #444;
            font-weight: 600;
            text-align: center;
        }

        .announcement-page h3 {
            color: #333;
            margin-top: 25px;
            font-weight: 500;
        }

        .announcement-page label {
            font-weight: 600;
            color: #555;
            display: inline-block;
            margin-bottom: 5px;
        }

        .announcement-page table {
            width: 100%;
            border-spacing: 10px;
        }

        .announcement-page asp\:TextBox,
        .announcement-page input,
        .announcement-page textarea {
            font-size: 14px;
        }

        .announcement-page .btn {
            background-color: #555;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .announcement-page .btn:hover {
            background-color: #333;
        }

        .announcement-page .grid {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .announcement-page .grid th {
            background-color: #e0e0e0;
            color: #333;
            padding: 10px;
            text-align: left;
            border-bottom: 2px solid #ccc;
        }

        .announcement-page .grid td {
            padding: 10px;
            background-color: #fafafa;
            border-bottom: 1px solid #ddd;
        }

        .announcement-page .grid tr:hover td {
            background-color: #f1f1f1;
        }

        .announcement-page hr {
            border: none;
            border-top: 2px solid #eee;
            margin: 20px 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="announcement-page">
        <div class="form-box">
            <h2>📰 Manage News & Announcements</h2>
            <hr />

            <table>
                <tr>
                    <td style="width:20%;"><label>Title:</label></td>
                    <td><asp:TextBox ID="txtTitle" runat="server" Width="95%" Height="35px" CssClass="textbox" /></td>
                </tr>
                <tr>
                    <td><label>Description:</label></td>
                    <td><asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" Width="95%" CssClass="textbox" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="➕ Add Announcement" CssClass="btn" OnClick="btnAdd_Click" Height="35px" />
                    </td>
                </tr>
            </table>

            <hr />
            <h3>📋 Existing Announcements</h3>

            <asp:GridView ID="GridViewNews" runat="server" AutoGenerateColumns="False" CssClass="grid"
                DataKeyNames="NewsID" OnRowDeleting="GridViewNews_RowDeleting" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="NewsID" HeaderText="ID" ReadOnly="true" />
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="PostedDate" HeaderText="Posted Date" DataFormatString="{0:dd MMM yyyy}" />
                    <asp:CommandField ShowDeleteButton="True" DeleteText="🗑 Delete" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
