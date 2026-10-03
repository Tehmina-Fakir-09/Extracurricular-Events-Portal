<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        
         .dashboard {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin: 30px;
        }

        .card {
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card h3 {
            margin-bottom: 10px;
            color: #333;
        }

        .card p {
            font-size: 14px;
            color: #666;
        }

        .btn {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #555;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #333;
        }

        .welcome {
            margin: 60px;
            text-align: center;
            color: #444;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="welcome">
        <h2>Welcome!</h2>
        <p>Manage your portal from here</p>
    </div>

    <div class="dashboard">
        <div class="card">
            <h3>Manage Events</h3>
            <p>Create, edit, or delete events.</p>
            <a href="ManageEvents.aspx" class="btn">Go</a>
        </div>

        <div class="card">
            <h3>View Students</h3>
            <p>Check registered students for events.</p>
            <a href="ViewStudentRegistration.aspx" class="btn">Go</a>
        </div>

        <div class="card">
            <h3>Announcements</h3>
            <p>Post important news and updates.</p>
            <a class="btn" href="Admin_Announcement.aspx">Go</a>
        </div>

        <div class="card">
            <h3>Closed Events</h3>
            <p>Review past events.</p>
            <a class="btn" href="ClosedEvents.aspx">Go</a>
        </div>

        <div class="card">
            <h3>Enquiries</h3>
            <p>View and respond to student enquiries.</p>
            <a class="btn" href="ViewEnquiry.aspx">Go</a>
        </div>

        <div class="card">
            <h3>Logout</h3>
            <p>Sign out of the admin panel.</p>
            <a href="../User/Home.aspx" class="btn">Logout</a>
        </div>
    </div>
</asp:Content>

