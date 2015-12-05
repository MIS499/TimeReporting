<%@ Page Title="Settings" Language="C#" MasterPageFile="MasterPage.Master" AutoEventWireup="true" Inherits="Content_settings" CodeBehind="settings.aspx.cs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Settings</h1>
    <h3 class="SettingsSubHeader">Security</h3>
    <hr />
    <h5><a href="password.aspx">Change Password</a></h5>
    <h5><a href="User_Create.aspx">Create a new user</a></h5>
    <h5><a href="User_Edit.aspx">Edit a current user</a></h5>
    <h5><a href="User_List.aspx">List all current users</a></h5>
</asp:Content>