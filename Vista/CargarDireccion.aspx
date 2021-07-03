<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarDireccion.aspx.cs" Inherits="Vista.CargarDireccion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
        <asp:Button ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" Width="85px" />
            <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" CssClass="auto-style1" />
            </p>
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Calle"></asp:Label>
        <asp:TextBox ID="tbx_Calle" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_Calle" ErrorMessage="Ingrese una calle" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Numero"></asp:Label>
            <asp:TextBox ID="tbx_Numero" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rg_numeros" runat="server" ControlToValidate="tbx_Numero" ErrorMessage="Numero de direccion no valido" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Piso"></asp:Label>
            <asp:TextBox ID="tbx_Piso" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rg_numeros0" runat="server" ControlToValidate="tbx_Piso" ErrorMessage="Numero de piso no valido" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Provincia"></asp:Label>
            <asp:DropDownList ID="ddlProvincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
            </asp:DropDownList>
        </p>
        <asp:Label ID="Label6" runat="server" Text="Ciudad"></asp:Label>
        <asp:DropDownList ID="ddlCiudades" runat="server">
        </asp:DropDownList>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Cargar" OnClick="Button1_Click" ValidationGroup="grupo2" />
        </p>
    </form>
</body>
</html>
