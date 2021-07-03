<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Vista.Producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Producto</title>
        <link href="./bootstrap-5.0.2/css/bootstrap.min.css" rel="stylesheet" />
        <script src="./bootstrap-5.0.2/js/bootstrap.min.js" ></script>
        <script src="./scriptConfirmaciones.js" language="javascript" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row d-flex justify-content-between navbar-light" style="background-color: #e3f2fd;">
        <div class="col-auto">
            Usuario:<asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        </div>
        <div class="col-auto">
            <div class="btn-group" role="group" aria-label="Basic outlined example">
                <asp:Button class="btn btn-outline-primary" ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
                <asp:Button class="btn btn-outline-primary" ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
                <asp:Button class="btn btn-outline-primary" ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas"/>
                <asp:Button class="btn btn-outline-primary" ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas"/>
                <asp:Button class="btn btn-outline-primary" ID="btn_Inicio" runat="server" OnClick="btn_Inicio_Click" Text="Inicio"/>
            </div>
        </div>
    </div>
    <div class="d-flex justify-content-center">
        <div class="container text-center">
        <h1><asp:Label ID="lblTitulo" runat="server" Text="Nombre producto"></asp:Label></h1>
        <br />
        <asp:Image ID="imgProducto" runat="server" Height="200px" />
        <p>
            <asp:Button ID="btn_Restar" runat="server" Text="-" OnClick="btn_Restar_Click" />
            <asp:Label ID="lbl_Cantidad" runat="server" Text="0"></asp:Label>
            <asp:Button ID="btn_Sumar" runat="server" Text="+" OnClick="btn_Sumar_Click" />
            <asp:Label ID="lblSumar" runat="server"></asp:Label>
        </p>
        <asp:Button ID="btnAñadir" runat="server" Text="Añadir" OnClick="btnAñadir_Click" onClientClick="return confirmarAgregar();" />
        <asp:Label ID="lbl_Agregado" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnQuitar" runat="server" OnClick="btnQuitar_Click" Text="Quitar del carrito" onClientClick="return confirmarQuitar();"/>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Nombre producto:"></asp:Label>
            <asp:Label ID="lblNombreProducto" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Descripcion:"></asp:Label>
            <asp:Label ID="lblDescripcionProducto" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            Precio: $<asp:Label ID="lbl_precio" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Cantidad en el carrito: "></asp:Label>
            <asp:Label ID="lblCantidadActual" runat="server" Text="0"></asp:Label>
        </p>
        <p>
            Subtotal: $<asp:Label ID="lbl_SubTotal" runat="server"></asp:Label>
        </p>

        </div>
     </div>
    </form>
</body>
</html>
