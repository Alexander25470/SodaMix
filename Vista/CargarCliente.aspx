﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarCliente.aspx.cs" Inherits="Vista.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
                    <td class="auto-style2">Nombre:</td>
                    <td>
                        <asp:TextBox ID="tbx_Nombre" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Apellido</td>
                    <td>
                        <asp:TextBox ID="tbx_Apellido" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Dni:</td>
                    <td>
                        <asp:TextBox ID="tbx_Dni" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Telefono:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbx_Telefono" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style8">Fecha de Nacimiento:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="tbx_FechaNacimiento" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style8">Mail:</td>
                    <td class="auto-style9">
                        <asp:TextBox ID="tbx_Mail" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Usuario</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbx_Usuario" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Contraseña:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="tbx_Pass" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">Repetir Contraseña:</td>
                    <td>
                        <asp:TextBox ID="tbx_PassRepetida" runat="server"></asp:TextBox>
                        <asp:Label ID="lbl_PassNoCoincide" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btn_Inicio" runat="server" OnClick="btn_Inicio_Click" Text="Inicio" />
                    </td>
                    <td>
                        <asp:Button ID="btn_Aceptar" runat="server" Text="Aceptar" OnClick="btn_Aceptar_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
