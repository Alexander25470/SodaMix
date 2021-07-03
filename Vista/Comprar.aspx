<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="Vista.Comprar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="./scriptConfirmaciones.js" language="javascript" type="text/javascript"></script>
    <title>Carrito</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
        <asp:Button ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" Width="85px" />
            <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" CssClass="auto-style1" />
            <br />
            <asp:Label ID="lbl_productosElegidos" runat="server"></asp:Label>
            <asp:GridView ID="gvCompra" runat="server" >
            </asp:GridView>
        </div>
        <asp:Label ID="lblPrecioTotalTexto" runat="server" Text="Precio total:"></asp:Label>
        <asp:Label ID="lblPrecioTotal" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Enviar a"></asp:Label>
        <asp:DropDownList ID="ddlDirecciones" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" Text="Cargar otra direccion" OnClick="Button2_Click" />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Metodo de pago"></asp:Label>
        <asp:DropDownList ID="ddlMetodoPago" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnVaciarCarrito" runat="server" OnClick="btnVaciarCarrito_Click" Text="Vaciar Carrito" onClientClick="return confirmarVaciarCarrito();"/>
        <p>
            <asp:Button ID="btnComprar" runat="server" Text="Comprar" onClientClick="return confirmarCompra();" OnClick="btnComprar_Click"/>
        </p>
    </form>
</body>
</html>
