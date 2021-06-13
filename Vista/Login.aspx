<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vista.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUser" runat="server" Text="Usuario"></asp:Label>
            <asp:TextBox ID="tbxUser" runat="server"></asp:TextBox>
        </div>
        <p>
            <asp:Label ID="lblPass" runat="server" Text="Contraseña"></asp:Label>
            <asp:TextBox ID="tbxPass" runat="server" TextMode="Password"></asp:TextBox>
        </p>
        <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" />
    </form>
</body>
</html>
