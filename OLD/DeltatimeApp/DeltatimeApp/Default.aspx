<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DeltatimeApp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Delta Time</h1>
        <p>
          
               <asp:Literal runat="server" ID="StatusText" />
       
            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Login.aspx" Visible="False">Click Here to Login!!</asp:HyperLink>
        </p>
    
    </div>
    </form>
</body>
</html>
