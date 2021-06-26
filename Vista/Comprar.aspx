<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="Vista.Comprar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="./scriptConfirmaciones.js" language="javascript" type="text/javascript"></script>
    <title>Carrito</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
            <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" />
            <br />
            <asp:Label ID="lbl_productosElegidos" runat="server"></asp:Label>
            <asp:GridView ID="gvCompra" runat="server" >
            </asp:GridView>
        </div>
        <asp:Label ID="lblPrecioTotalTexto" runat="server" Text="Precio total:"></asp:Label>
        <asp:Label ID="lblPrecioTotal" runat="server"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Enviar a"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" Text="Cargar otra direccion" />
        <p>
            <asp:Button ID="Button1" runat="server" Text="Comprar" onClientClick="return confirmarCompra();"/>
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
