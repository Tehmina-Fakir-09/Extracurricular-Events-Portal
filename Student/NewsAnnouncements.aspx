<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true"
    CodeFile="NewsAnnouncements.aspx.cs" Inherits="Student_NewsAnnouncements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
            font-weight: 600;
            margin: 30px 0 10px;
        }

        .news-container {
            width: 80%;
            margin: 0 auto;
            padding-bottom: 40px;
        }

        .news-card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            margin: 20px 0;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .news-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .news-title {
            font-size: 22px;
            color: #222;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .news-date {
            font-size: 13px;
            color: #888;
            margin-bottom: 12px;
        }

        .news-desc {
            font-size: 15px;
            color: #555;
            line-height: 1.6;
            text-align: justify;
        }

        hr {
            border: none;
            border-top: 2px solid #e0e0e0;
            width: 50%;
            margin: 10px auto 25px;
        }

        @media (max-width: 768px) {
            .news-container {
                width: 95%;
            }
            .news-card {
                padding: 15px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="news-container">
        <div style="text-align:center;">
            <h2>📢 News & Announcements</h2>
            <hr />
        </div>

        <asp:Repeater ID="RepeaterNews" runat="server">
            <ItemTemplate>
                <div class="news-card">
                    <div class="news-title"><%# Eval("Title") %></div>
                    <div class="news-date">📅 Posted on: <%# Eval("PostedDate", "{0:dd MMM yyyy}") %></div>
                    <div class="news-desc"><%# Eval("Description") %></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
