<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="Vista.Ventas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style8 {
            margin-left: 16px;
        }
        .auto-style9 {
            margin-left: 34px;
        }
        .auto-style10 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Buscar por numero de venta o dni:<asp:TextBox ID="tbx_buscarProducto" runat="server" CssClass="auto-style8"></asp:TextBox>
            <asp:Button ID="btn_buscar" runat="server" CssClass="auto-style9" Text="Buscar" Width="74px" OnClick="btn_buscar_Click" ValidationGroup="grupo2" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Usuario:
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Carrito" runat="server" OnClick="btn_Carrito_Click" Text="Ver carrito" />
        <asp:Button ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" Width="85px" />
            <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" CssClass="auto-style10" />
            <br />
                        <asp:RegularExpressionValidator ID="rg_numeros" runat="server" ControlToValidate="tbx_buscarProducto" ErrorMessage="El DNI o numero de venta debe ser numerico." ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
            <br />
            <asp:GridView ID="gvVentas" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Numero venta">
                        <ItemTemplate>
                            <asp:Label ID="lbl_venta" runat="server" Text='<%# Bind("ID_Venta") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Metodo_Pago">
                        <ItemTemplate>
                            <asp:Label ID="lbl_metodoPago" runat="server" Text='<%# Bind("MetodoPago") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio_Total">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PrecioTotal" runat="server" Text='<%# Bind("Precio_Total") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha_Venta">
                        <ItemTemplate>
                            <asp:Label ID="lbl_FechaVenta" runat="server" Text='<%# Bind("Fecha_Venta") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI_Usuario">
                        <ItemTemplate>
                            <asp:Label ID="lbl_usuario" runat="server" Text='<%# Bind("DNIUsuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DetalleVenta">
                        <ItemTemplate>
                            <asp:Button ID="btnVerDetalle" runat="server" CommandArgument='<%# Bind("id_venta") %>' OnCommand="btnVerDetalle_Command" Text="Ver Detalle" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
