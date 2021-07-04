﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alteracion_Productos.aspx.cs" Inherits="Vista.CargarProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 146px;
            font-size: x-large;
            text-align: center;
        }
        .auto-style4 {
            width: 146px;
            text-align: right;
        }
        .auto-style5 {
            width: 146px;
            height: 26px;
            text-align: right;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            margin-left: 148px;
        }
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
            Buscar producto:<asp:TextBox ID="tbx_buscarProducto" runat="server" CssClass="auto-style8"></asp:TextBox>
            <asp:Button ID="btn_buscar" runat="server" CssClass="auto-style9" OnClick="btn_buscar_Click" Text="Buscar" Width="74px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Usuario:
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
            <asp:Button ID="btnVentas" runat="server" OnClick="btnVentas_Click" Text="Ventas" />
        <asp:Button ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" Width="85px" />
        <asp:Button ID="btnAdmin" runat="server" OnClick="btnAdmin_Click" Text="Administrar Clientes" CssClass="auto-style10" />
        <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" />
            <asp:Button ID="btnCarrito" runat="server" OnClick="btnCarrito_Click" Text="Ver Carrito" />
            <asp:GridView ID="gvProductos" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_Producto" PageSize="14" OnPageIndexChanging="gvProductos_PageIndexChanging" AutoGenerateEditButton="True" OnRowCancelingEdit="gvProductos_RowCancelingEdit" OnRowDeleting="gvProductos_RowDeleting" OnRowEditing="gvProductos_RowEditing" OnRowUpdating="gvProductos_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="ID_Producto">
                        <ItemTemplate>
                            <asp:Label ID="lbl_IdProducto" runat="server" Text='<%# Bind("ID_Producto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Nombre" ErrorMessage="RequiredFieldValidator" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Nombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' Width="193px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tipo_Producto">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_EditTipoProd" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="ID_TipoProducto">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_producto" runat="server" Text='<%# Bind("nombreTipoProducto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_Stock" runat="server" Text='<%# Bind("Stock") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Stock" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio_Compra">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_PrecioCompra" runat="server" Text='<%# Bind("Precio_Compra") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_PrecioCompra" runat="server" Text='<%# Bind("Precio_Compra") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio_Venta">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_PrecioVenta" runat="server" Text='<%# Bind("Precio_Venta") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_Precio_Venta" runat="server" Text='<%# Bind("Precio_Venta") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Img_URL">
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_imgURL" runat="server" Text='<%# Bind("Img_URL") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl_imgURL" runat="server" Text='<%# Bind("Img_URL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:CheckBox ID="chk_Estado" runat="server" Checked="True" Text='<%# Bind("Estado") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Estado") %>' Enabled="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <asp:Label ID="lblIdProducto" runat="server" Text='<%# Bind("ID_Producto") %>'></asp:Label>
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:Label ID="lblErrorEditarProducto" runat="server"></asp:Label>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3"><strong>Agregar Producto</strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">Nombre:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        
        
            <asp:RequiredFieldValidator ID="RFV_Nombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un Nombre" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Descripcion:</td>
                    <td>
                        <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
        
        
            <asp:RequiredFieldValidator ID="RFV_Descripcion" runat="server" ControlToValidate="txtDesc" ErrorMessage="Ingrese una descripcion" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Tipo producto:</td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="Ddl_TipoProd" runat="server" DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="ID_TipoProducto">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SODAMIXConnectionString %>" SelectCommand="SELECT [ID_TipoProducto], [Nombre] FROM [TIPO_PRODUCTO]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Stock:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
        
        
            <asp:RequiredFieldValidator ID="RFV_Stock" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingrese stock" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        
                        <asp:RegularExpressionValidator ID="rg_Stock" runat="server" ControlToValidate="txtStock" ErrorMessage="Ingresar solo numeros" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
        
        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Precio Compra:</td>
                    <td>
                        <asp:TextBox ID="txtPrecioCompra" runat="server"></asp:TextBox>
        
        
            <asp:RequiredFieldValidator ID="RFV_PrecioCompra" runat="server" ControlToValidate="txtPrecioCompra" ErrorMessage="Ingrese precio compra" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        
                        <asp:RegularExpressionValidator ID="rg_PrecioCompra" runat="server" ControlToValidate="txtPrecioCompra" ErrorMessage="Ingresar solo numeros" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
        
        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Precio Venta:</td>
                    <td>
                        <asp:TextBox ID="txtPrecioVenta" runat="server"></asp:TextBox>
        
        
            <asp:RequiredFieldValidator ID="RFV_PrecioVenta" runat="server" ControlToValidate="txtPrecioVenta" ErrorMessage="Ingrese precio venta" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        
                        <asp:RegularExpressionValidator ID="rg_PrecioVenta" runat="server" ControlToValidate="txtPrecioVenta" ErrorMessage="Ingresar solo numeros" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
        
        
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Img URL:</td>
                    <td>
                        <asp:TextBox ID="txtImgURL" runat="server"></asp:TextBox>
        
        
            <asp:RequiredFieldValidator ID="RFV_img" runat="server" ControlToValidate="txtImgURL" ErrorMessage="Ingrese una imagen" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <asp:Button ID="btn_aceptar" runat="server" CssClass="auto-style7" OnClick="btn_aceptar_Click" Text="Agregar" Width="140px" ValidationGroup="grupo2" />
        </div>
    </form>
</body>
</html>
