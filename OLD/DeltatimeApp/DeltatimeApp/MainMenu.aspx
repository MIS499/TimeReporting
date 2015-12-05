<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.aspx.cs" Inherits="DeltatimeApp.MainMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style4 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Main Menu</h1>
    
    </div>
        <asp:Literal runat="server" ID="StatusText" />
        <p class="auto-style4">
            Please Select from the Options Below</p>
      
        <p>
            <asp:HyperLink ID="LnkTimeSheet" runat="server" ImageUrl="~/Images/EnterTime.png" NavigateUrl="~/TimeMain.aspx"></asp:HyperLink>
        </p>
                  <asp:HyperLink ID="LnkViewReports" runat="server" ImageUrl="~/Images/ViewReports.png" NavigateUrl="~/ReportMenu.aspx"></asp:HyperLink>

    <p>
        <asp:HyperLink ID="LnkLogOff" runat="server" ImageUrl="~/Images/Logout.png" NavigateUrl="~/TimeMain.aspx"></asp:HyperLink>
        </p>

    </form>
    <p>
        &nbsp;</p>
</body>
</html>
