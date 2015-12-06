<%@ Page Title="Settings" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" Inherits="Content_settings" CodeBehind="settings.aspx.cs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Settings</h1>
    <div id="ProjectAdminSettings" runat="server">
        <h3>Project Administrator Settings</h3>
        <hr />
        <h5><a href="User_Create.aspx">Create a new user</a></h5>
        <h5><a href="User_List.aspx">List all current users</a></h5>
    </div>
    <div id="ProjectManagerSettings" runat="server">
        <h3>Project Administrator Settings</h3>
        <hr />
        <h5><a href="Project_List.aspx">List all projects</a></h5>
        <h5><a href="Report_Project.aspx">Project Reports</a></h5>
        <h5><a href="Report_Resources.aspx">Resource Reports</a></h5>
    </div>
    <div id="ConsultantSettings" runat="server">
        <h3 class="SettingsSubHeader">Security</h3>
        <hr />
        <h5><a href="password.aspx">Change Password</a></h5>
    </div>
</asp:Content>