<%@ Page Title="Timesheet" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Timesheet.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="Timesheet" runat="server" CssClass="timesheet">
        <asp:TableHeaderRow runat="server">
            <asp:TableCell runat="server"></asp:TableCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">9/27/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">9/28/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">9/29/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">9/30/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">10/1/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">10/2/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">10/3/15</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetdate">Total</asp:TableHeaderCell>
        </asp:TableHeaderRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject">Project1</asp:TableHeaderCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject"></asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject">Project2</asp:TableHeaderCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject"></asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject">Project3</asp:TableHeaderCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject"></asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject">Project4</asp:TableHeaderCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableCell runat="server" CssClass="timesheethours"></asp:TableCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject"></asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server" CssClass="timesheettotallabel" ColumnSpan="8">Total:</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetproject"></asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableHeaderCell runat="server" CssClass="timesheetremaininglabel" ColumnSpan="8">Remaining Hours:</asp:TableHeaderCell>
            <asp:TableHeaderCell runat="server" CssClass="timesheetremaining">25</asp:TableHeaderCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>