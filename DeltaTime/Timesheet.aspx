<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Timesheet.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="Timesheet" runat="server" CssClass="timesheet">
        <asp:TableHeaderRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableHeaderCell runat="server">9/27/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">9/28/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">9/29/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">9/30/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server">9/31/15</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server">Project1</asp:TableHeaderCell>
            <asp:TableCell runat="server">test</asp:TableCell>
            <asp:TableCell runat="server">test3</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server">Project2</asp:TableHeaderCell>
            <asp:TableCell runat="server">test2</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server">Project3</asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server">Project4</asp:TableHeaderCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>