<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vista.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="./scriptConfirmaciones.js" language="javascript" type="text/javascript"></script>
    <title>Login</title>
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
        <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesión" OnClick="btnLogin_Click" onClientClick="return confirmarLogin();" />
        <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lbl_Registrarse" runat="server" Text="No posees cuenta?. REGISTRATE!" ></asp:Label>
        <asp:Button ID="btn_Registrarse" runat="server" OnClick="btn_Registrarse_Click" Text="Registrarse" onClientClick="return confirmarIrRegistro('asdsd');" />
    </form>
</body>
</html>
