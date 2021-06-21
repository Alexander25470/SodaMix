<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrarClientes.aspx.cs" Inherits="Vista.AdministrarClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 26px;
        }
        .auto-style2 {
            margin-left: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Buscar Cliente:<asp:TextBox ID="tbx_busqueda" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:Button ID="btn_Buscar" runat="server" CssClass="auto-style2" OnClick="btn_Buscar_Click" Text="Buscar" Width="84px" />
            <asp:GridView ID="GVClientes" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
