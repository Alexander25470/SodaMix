<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comprar.aspx.cs" Inherits="Vista.Comprar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label3" runat="server" Text="Productos elegidos"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            </asp:GridView>
        </div>
        <asp:Label ID="Label2" runat="server" Text="Enviar a"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" Text="Cargar otra direccion" />
        <p>
            <asp:Button ID="Button1" runat="server" Text="Comprar" />
        </p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
