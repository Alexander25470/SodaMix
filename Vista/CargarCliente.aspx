<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarCliente.aspx.cs" Inherits="Vista.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="./scriptConfirmaciones.js" language="javascript" type="text/javascript"></script>
    <title>Registro</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 135px;
        }
        .auto-style3 {
            width: 135px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 135px;
            font-size: x-large;
            height: 31px;
        }
        .auto-style6 {
            font-size: large;
            height: 31px;
        }
        .auto-style7 {
            height: 31px;
        }
        .auto-style8 {
            width: 135px;
            height: 26px;
        }
        .auto-style9 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5"></td>
                    <td class="auto-style6">Registrarse</td>
                    <td class="auto-style7"></td>
                </tr>
                <tr>
                    <td class="auto-style8">Nombre:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="tbx_Nombre" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="tbx_Nombre" ErrorMessage="Ingrese el nombre" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style2">Apellido</td>
                    <td>
                        <asp:TextBox ID="tbx_Apellido" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre0" runat="server" ControlToValidate="tbx_Apellido" ErrorMessage="Ingrese el apellido" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Dni:</td>
                    <td>
                        <asp:TextBox ID="tbx_Dni" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre1" runat="server" ControlToValidate="tbx_Dni" ErrorMessage="Ingrese el DNI" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rg_numerosDni" runat="server" ControlToValidate="tbx_Dni" ErrorMessage="DNI No valido." ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Telefono:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbx_Telefono" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="tbx_Telefono" ErrorMessage="Ingrese el Telefono" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rg_numeros" runat="server" ControlToValidate="tbx_Telefono" ErrorMessage="Telefono no valido" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style8">Fecha de Nacimiento:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="tbx_FechaNacimiento" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_FechaNacimiento" ErrorMessage="RequiredFieldValidator" ValidationGroup="grupo2">Seleccione fecha</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style8">Mail:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="tbx_Mail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbx_Mail" ErrorMessage="Mail no valido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Usuario</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbx_Usuario" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="tbx_Usuario" ErrorMessage="Ingrese el usuario" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Contraseña:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbx_Pass" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre3" runat="server" ControlToValidate="tbx_Pass" EnableTheming="True" ErrorMessage="Ingrese contraseña" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">Repetir Contraseña:</td>
                    <td>
                        <asp:TextBox ID="tbx_PassRepetida" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbx_Pass" ControlToValidate="tbx_PassRepetida" ErrorMessage="Las password no coinciden" ValidationGroup="grupo2"></asp:CompareValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btn_Inicio" runat="server" OnClick="btn_Inicio_Click" Text="Login"  onClientClick="return confirmarIrLogin();"/>
                    </td>
                    <td>
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" ValidationGroup="grupo2" onClientClick="if(Page_ClientValidate('grupo2'))return confirmarRegistro();"/>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
