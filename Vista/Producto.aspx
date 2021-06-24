<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Vista.Producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblTitulo" runat="server" Text="Nombre producto"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
            <asp:Button ID="btn_Inicio" runat="server" OnClick="btn_Inicio_Click" Text="Inicio" />
        </div>
        <asp:Image ID="imgProducto" runat="server" Height="200px" />
        <p>
            <asp:Button ID="btn_Restar" runat="server" Text="-" OnClick="btn_Restar_Click" />
            <asp:Label ID="lbl_Cantidad" runat="server" Text="1"></asp:Label>
            <asp:Button ID="btn_Sumar" runat="server" Text="+" OnClick="btn_Sumar_Click" />
            <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
        </p>
        <asp:Button ID="Button1" runat="server" Text="Añadir" />
        <p>
            <asp:Label ID="Label2" runat="server" Text="Nombre producto:"></asp:Label>
            <asp:Label ID="lblNombreProducto" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Descripcion:"></asp:Label>
            <asp:Label ID="lblDescripcionProducto" runat="server" Text="Label"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
