<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Estadisticas.aspx.cs" Inherits="Vista.Estadisticas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">


        .auto-style8 {
            margin-left: 16px;
        }
        .auto-style9 {
            margin-left: 34px;
        }
        .auto-style10 {
            margin-left: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Buscar:<asp:TextBox ID="tbx_buscarProducto" runat="server" CssClass="auto-style8"></asp:TextBox>
            <asp:Button ID="btn_buscar" runat="server" CssClass="auto-style9" Text="Buscar" Width="74px" OnClick="btn_buscar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Usuario:
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Carrito" runat="server" OnClick="btn_Carrito_Click" Text="Ver carrito" />
            <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" />
            <br />
            <br />
            Mostrar ganancias por fechas:<br />
            <br />
            Fecha de inicio:
                        <asp:TextBox ID="tbx_FechaInicio" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_FechaIni" runat="server" ControlToValidate="tbx_FechaInicio" ErrorMessage="Debes ingresar una fecha de inicio."></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fecha de fin:
                        <asp:TextBox ID="tbx_FechaFin" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFV_FechaFin" runat="server" ControlToValidate="tbx_FechaFin" ErrorMessage="Debe ingresar una fecha de fin."></asp:RequiredFieldValidator>
                        <asp:Button ID="btn_Mostrar" runat="server" CssClass="auto-style10" OnClick="btn_Mostrar_Click" Text="Mostrar" />
            <br />
        </div>
        <asp:GridView ID="gv_Estadisticas" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField HeaderText="ID Producto">
                    <ItemTemplate>
                        <asp:Label ID="lbl_idproducto" runat="server" Text='<%# Bind("ID_Producto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre Producto">
                    <ItemTemplate>
                        <asp:Label ID="lbl_NombreProducto" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Stock">
                    <ItemTemplate>
                        <asp:Label ID="lbl_stock" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad Vendida">
                    <ItemTemplate>
                        <asp:Label ID="lvl_cantidadVendida" runat="server" Text='<%# Bind("cantidadVendida") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Ingreso">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ingreso" runat="server" Text='<%# Bind("ingreso") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gastos">
                    <ItemTemplate>
                        <asp:Label ID="lbl_gastos" runat="server" Text='<%# Bind("gastos") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <p>
            Gasto total entre las fechas seleccionadas:
            <asp:Label ID="lbl_GastoTotal" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
