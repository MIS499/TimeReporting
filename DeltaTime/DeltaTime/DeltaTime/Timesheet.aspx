<%@ Page Title="Timesheet" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeBehind="Timesheet.aspx.cs" Inherits="Timetracker20test.TimeTracker.Timesheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <form id="form1" runat="server">
        <div>
            <asp:gridview id="GridView1" runat="server" autogeneratecolumns="false" datakeynames="id" onpageindexchanging="GridView1_PageIndexChanging" onrowcancelingedit="GridView1_RowCancelingEdit" onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="S.No." />
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="address" HeaderText="address" />
                <asp:BoundField DataField="country" HeaderText="Country" />
                <asp:CommandField ShowEditButton="true" />
                <asp:CommandField ShowDeleteButton="true" />
            </Columns>
        </asp:gridview>
        </div>
        <div>
            <asp:label id="lblresult" runat="server"></asp:label>
        </div>
    </form>
</asp:Content>