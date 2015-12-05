<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="User_List_aspx" Title="Administration - List of Users" Culture="auto" UICulture="auto" CodeBehind="User_List.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <div id="adminedit">
        <a name="content_start" id="content_start"></a>
        <fieldset>
            <!-- add H2 here and hide it with css since you can not put h2 inside a legend tag -->
            <h2 class="none">User List</h2>
            <legend>User List</legend>

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
        </fieldset>
    </div>
</asp:Content>