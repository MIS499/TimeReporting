<%@ Page Language="C#" MasterPageFile="MasterPage.master"
    Inherits="Project_List_aspx" Title="List of Projects"
    Culture="auto" UICulture="auto" CodeBehind="Project_List.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">

    <h1>Project List</h1>
    <asp:objectdatasource id="ProjectData" runat="server" typename="ASPNET.BusinessLogicLayer.Project"
        deletemethod="DeleteProject" oldvaluesparameterformatstring="{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
            </asp:objectdatasource>
    <asp:gridview id="ListAllProjects" datasourceid="ProjectData" autogeneratecolumns="False" datakeynames="Id"
        allowsorting="true" borderwidth="0" runat="server" borderstyle="None" width="90%"
        cellpadding="2" pagesize="25" bordercolor="White" onrowdeleting="ListAllProjects_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Id" Visible=true />
                    <asp:BoundField DataField="Name" HeaderText="Project Name" SortExpression="Name" />
                    <asp:BoundField DataField="ManagerUserName" HeaderText="Project Manager" SortExpression="ManagerUserName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="CompletionDate" HeaderText="Completion" DataFormatString="{0:d}"
                        SortExpression="CompletionDate" />
                    <asp:BoundField DataField="EstimateDuration" HeaderText="EstimateDuration" SortExpression="EstimateDuration" />
                    <asp:HyperLinkField HeaderText="Edit Project" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="Project_Details.aspx?ProjectId={0}"
                        Text="Edit..." />
                    <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" DeleteImageUrl="images/icon-delete.gif"
                        ButtonType="Image" />
                </Columns>
                <RowStyle HorizontalAlign="Left" CssClass="row1" />
                <HeaderStyle CssClass="grid-header" HorizontalAlign="Left" />
                <EmptyDataTemplate>
                    <asp:Label ID="Label10" runat="server" Text="Label">There are not projects assigned to you</asp:Label>
                </EmptyDataTemplate>
            </asp:gridview>
    <br />
    <asp:button id="CreateProject" runat="server" text="Create new project" onclick="Button_Click" />
</asp:Content>