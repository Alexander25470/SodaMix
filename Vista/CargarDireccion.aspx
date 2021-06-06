<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarDireccion.aspx.cs" Inherits="Vista.CargarDireccion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Calle"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Numero"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Piso"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Pais"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Provincia"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
        </p>
        <asp:Label ID="Label6" runat="server" Text="Ciudad"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server">
        </asp:DropDownList>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Cargar" />
        </p>
    </form>
</body>
</html>
