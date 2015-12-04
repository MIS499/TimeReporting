<%@ Page Language="C#" AutoEventWireup="true" Inherits="User_test" Codebehind="User_test.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ObjectDataSource ID="UserData" runat="server" TypeName="System.Web.Security.Membership"
                SelectMethod="GetUser" OldValuesParameterFormatString="original_{0}">
            </asp:ObjectDataSource>

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataKeyNames="UserName"
                DataSourceID="UserData" DefaultMode="Edit" AutoGenerateRows="False" AutoGenerateInsertButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
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
                    <asp:CheckBoxField DataField="IsApproved" HeaderText="IsApproved" SortExpression="IsApproved" />
                </Fields>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:DetailsView>
        </div>
    </form>
</body>
</html>
