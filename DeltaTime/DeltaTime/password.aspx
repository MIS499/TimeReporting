<%@ Page Title="Password Change" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" Inherits="password" Codebehind="password.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Change Password</h1>
    <table>
        <tr>
            <td class="PasswordTable">Current Password:</td>
            <td class="PasswordTable">
                <asp:TextBox ID="CurrentPassword" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="PasswordTable">New Password:</td>
            <td class="PasswordTable">
                <asp:TextBox ID="NewPassword" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="PasswordTable">Verify Password:</td>
            <td class="PasswordTable">
                <asp:TextBox ID="VerifyPassword" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Button ID="ChangePasswordButton" runat="server" Text="Change Password" />
</asp:Content>