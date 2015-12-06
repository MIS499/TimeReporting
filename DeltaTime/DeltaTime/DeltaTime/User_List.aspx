<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="User_List_aspx" Title="Administration - List of Users" Culture="auto" UICulture="auto" CodeBehind="User_List.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <h2>User List</h2>

    <asp:objectdatasource id="UserData" runat="server" typename="System.Web.Security.Membership"
        selectmethod="GetAllUsers" />
    <asp:gridview id="ListAllUsers" datasourceid="UserData" datakeynames="UserName" autogeneratecolumns="False"
        allowsorting="true" allowpaging="true" borderwidth="0" runat="server" borderstyle="None"
        width="90%" cellpadding="2" pagesize="25">
                            <Columns>
                                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                <asp:BoundField DataField="Email" HeaderText="E-Mail Address" />
                            </Columns>
                            <RowStyle HorizontalAlign="Left" CssClass="row1" />
                            <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                        </asp:gridview>
    <br />
    <asp:button id="CreateUser" runat="server" text="Create new user" cssclass="submit"
        onclick="Button_Click" />
    <br />
</asp:Content>