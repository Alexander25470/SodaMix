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
        </div>
        <asp:Image ID="imgProducto" runat="server" Height="200px" />
        <p>
            <asp:Button ID="Button3" runat="server" Text="-" />
            <asp:Label ID="Label5" runat="server" Text="50"></asp:Label>
            <asp:Button ID="Button2" runat="server" Text="+" />
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
