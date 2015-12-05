<%@ Page Title="Password Change" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" Inherits="password" CodeBehind="password.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Change Password</h1>
    <table>
        <tr>
            <td class="PasswordTable">Current Password:</td>
            <td class="PasswordTable">
                <asp:textbox id="CurrentPassword" runat="server"></asp:textbox>
            </td>
        </tr>
        <tr>
            <td class="PasswordTable">New Password:</td>
            <td class="PasswordTable">
                <asp:textbox id="NewPassword" runat="server"></asp:textbox>
            </td>
        </tr>
        <tr>
            <td class="PasswordTable">Verify Password:</td>
            <td class="PasswordTable">
                <asp:textbox id="VerifyPassword" runat="server"></asp:textbox>
            </td>
        </tr>
    </table>
    <asp:button id="ChangePasswordButton" runat="server" text="Change Password" />
</asp:Content>