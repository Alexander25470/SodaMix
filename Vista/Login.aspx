<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vista.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="./scriptConfirmaciones.js" language="javascript" type="text/javascript"></script>
    <title>Login</title>
    <link href="./bootstrap-5.0.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap-5.0.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container text-center">
            <h1>SODAMIX</h1>
            <br />
            <asp:Label ID="lblUser" runat="server" Text="Usuario"></asp:Label>
            <br />
            <asp:TextBox ID="tbxUser" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblPass" runat="server" Text="Contraseña"></asp:Label>
            <br />
            <asp:TextBox ID="tbxPass" class="mb-2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" class="mb-2" runat="server" Text="Iniciar sesión" OnClick="btnLogin_Click" />
            <br />
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lbl_Registrarse" runat="server" Text="No posees cuenta?. REGISTRATE!" ></asp:Label>
            <br />
            <asp:Button ID="btn_Registrarse" runat="server" OnClick="btn_Registrarse_Click" Text="Registrarse" />
        </div>
    </form>
</body>
</html>
