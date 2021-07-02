<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="Vista.Factura" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Usuario:
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Carrito" runat="server" OnClick="btn_Carrito_Click" Text="Ver carrito" />
            <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" />
            <asp:Button ID="btnVenta" runat="server" OnClick="btnVenta_Click" Text="Venta" />
        <asp:Button ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" Width="85px" />
            <br />
            <br />
            <asp:GridView ID="gvFactura" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
