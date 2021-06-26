<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Vista.Producto" %>

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
        <div>
            <asp:Label ID="lblTitulo" runat="server" Text="Nombre producto"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_VerCarrito" runat="server" CssClass="auto-style1" OnClick="btn_VerCarrito_Click" Text="Ver Carrito" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
            <asp:Button ID="btn_Inicio" runat="server" OnClick="btn_Inicio_Click" Text="Inicio" />
        </div>
        <asp:Image ID="imgProducto" runat="server" Height="200px" />
        <p>
            <asp:Label ID="Label4" runat="server" Text="Cantidad en el carrito: "></asp:Label>
            <asp:Label ID="lblCantidadActual" runat="server" Text="0"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btn_Restar" runat="server" Text="-" OnClick="btn_Restar_Click" />
            <asp:Label ID="lbl_Cantidad" runat="server" Text="0"></asp:Label>
            <asp:Button ID="btn_Sumar" runat="server" Text="+" OnClick="btn_Sumar_Click" />
            <asp:Label ID="lblSumar" runat="server"></asp:Label>
        </p>
        <asp:Button ID="btnAñadir" runat="server" Text="Añadir" OnClick="btnAñadir_Click" />
        <asp:Label ID="lbl_Agregado" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnQuitar" runat="server" OnClick="btnQuitar_Click" Text="Quitar del carrito" />
        <p>
            <asp:Label ID="Label2" runat="server" Text="Nombre producto:"></asp:Label>
            <asp:Label ID="lblNombreProducto" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Descripcion:"></asp:Label>
            <asp:Label ID="lblDescripcionProducto" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            Precio:<asp:Label ID="lbl_precio" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            Subtotal:
            <asp:Label ID="lbl_SubTotal" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
