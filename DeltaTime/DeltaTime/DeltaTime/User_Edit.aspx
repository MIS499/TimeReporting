<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MasterPage.master" Inherits="User_Edit" CodeBehind="User_Edit.aspx.cs" Title="User Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="Server">
    <h1>User Edit</h1>
    <form id="form1">
        <div>
            <asp:objectdatasource id="UserData" runat="server" typename="System.Web.Security.Membership"
                selectmethod="GetUser" oldvaluesparameterformatstring="original_{0}">
            </asp:objectdatasource>

            <asp:detailsview id="DetailsView1" runat="server" height="50px" width="400px" datakeynames="UserName"
                datasourceid="UserData" defaultmode="Edit" autogeneraterows="False" autogenerateinsertbutton="True" borderstyle="None" borderwidth="0" cellpadding="10" gridlines="none">
                <EditRowStyle ForeColor="Black" />
                <Fields>
                    <asp:TemplateField HeaderText="Username" SortExpression="Username">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CheckBoxField DataField="IsApproved" HeaderText="Is Approved" SortExpression="Is Approved" />
                </Fields>
            </asp:detailsview>
        </div>
    </form>
</asp:Content>