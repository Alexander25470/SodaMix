<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="Vista.Comprar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="./scriptConfirmaciones.js" language="javascript" type="text/javascript"></script>
    <title>Carrito</title>
     <link href="./bootstrap-5.0.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap-5.0.2/js/bootstrap.min.js"></script>
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
                    <asp:Button class="btn btn-outline-primary" ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
                    <asp:Button class="btn btn-outline-primary" ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" />
                    <asp:Button class="btn btn-outline-primary" ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio"/>
                </div>
            </div>
        </div>
            <asp:Label ID="lbl_productosElegidos" runat="server"></asp:Label>
            <asp:GridView ID="gvCompra" runat="server" >
            </asp:GridView>
            <asp:Label ID="lblPrecioTotalTexto" runat="server" Text="Precio total:"></asp:Label>
            <asp:Label ID="lblPrecioTotal" runat="server"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Enviar a"></asp:Label>
            <asp:DropDownList ID="ddlDirecciones" runat="server">
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" Text="Cargar otra direccion" OnClick="Button2_Click" />
            <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlDirecciones" ErrorMessage="Elija una direccion a la que enviar sus productos." ValidationGroup="grupo2"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Metodo de pago"></asp:Label>
            <asp:DropDownList ID="ddlMetodoPago" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnVaciarCarrito" runat="server" OnClick="btnVaciarCarrito_Click" Text="Vaciar Carrito" onClientClick="return confirmarVaciarCarrito();"/>
            <p>
                <asp:Button ID="btnComprar" runat="server" Text="Comprar" onClientClick="if(Page_ClientValidate('grupo2'))return confirmarCompra();" OnClick="btnComprar_Click" ValidationGroup="grupo2"/>
            </p>
    </form>
</body>
</html>
