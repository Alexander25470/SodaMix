<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="Vista.Producto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Nombre producto"></asp:Label>
        </div>
        <asp:Image ID="Image1" runat="server" Height="200px" />
        <p>
            <asp:Button ID="Button3" runat="server" Text="-" />
            <asp:Label ID="Label5" runat="server" Text="50"></asp:Label>
            <asp:Button ID="Button2" runat="server" Text="+" />
        </p>
        <asp:Button ID="Button1" runat="server" Text="Añadir" />
        <p>
            <asp:Label ID="Label2" runat="server" Text="Nombre producto"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Descripcion"></asp:Label>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="info extra"></asp:Label>
        </p>
    </form>
</body>
</html>
