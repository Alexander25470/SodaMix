<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Vista.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Producto</title>
    <link href="./bootstrap-5.0.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap-5.0.2/js/bootstrap.min.js" ></script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="row d-flex justify-content-between navbar-light" style="background-color: #e3f2fd;">
            <div class="col-auto">
                Usuario: <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
            </div>
            <div class="col-auto">
                <asp:Label ID="lblSearch" runat="server" Text="Buscar producto:"></asp:Label>
                <asp:TextBox ID="tbxSearch" runat="server"></asp:TextBox>
                <asp:Button class="btn btn-outline-success" ID="btnSearch" runat="server" Text="Buscar" OnClick="btnSearch_Click" />
            </div>
            <div class="col-auto">
                <div class="btn-group" role="group" aria-label="Basic outlined example">
                    <asp:Button class="btn btn-outline-primary" ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
                    <asp:Button class="btn btn-outline-primary" ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
                    <asp:Button class="btn btn-outline-primary" ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
                    <asp:Button class="btn btn-outline-primary" ID="btnEstadisticas" runat="server" OnClick="btnEstadisticas_Click" Text="Estadisticas" />
                    <asp:Button class="btn btn-outline-primary" ID="btnCarrito" runat="server" OnClick="btnCarrito_Click" Text="Ver carrito" />
                    <asp:Button class="btn btn-outline-primary" ID="btn_CerrarSesion" runat="server" OnClick="btn_CerrarSesion_Click" Text="Cerrar Sesion" />
                </div>
            </div>
        </div>
        <div class="container d-flex justify-content-center">
        <asp:ListView ID="lvProductos" runat="server" GroupItemCount="3" DataKeyNames="ID_Producto" OnPagePropertiesChanging="lvProductos_PagePropertiesChanging">
            <AlternatingItemTemplate>
                <td runat="server" style="">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Img_URL") %>' Width="200" Height="200" />
                    <br />
                    Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Precio_Venta: $
                    <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("ID_Producto") %>' CommandName="id" OnCommand="Button1_Command" Text="Seleccionar" />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                 <td runat="server" style="">ID_Producto:
                    <asp:Label ID="ID_ProductoLabel1" runat="server" Text='<%# Eval("ID_Producto") %>' />
                    <br />
                    Nombre:
                    <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                    <br />
                    Precio_Venta: $
                    <asp:TextBox ID="Precio_VentaTextBox" runat="server" Text='<%# Bind("Precio_Venta") %>' />
                    <br />
                    Img_URL:
                    <asp:TextBox ID="Img_URLTextBox" runat="server" Text='<%# Bind("Img_URL") %>' Width="200" Height="200" />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">Nombre:
                    <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                    <br />
                    Precio_Venta: $
                    <asp:TextBox ID="Precio_VentaTextBox" runat="server" Text='<%# Bind("Precio_Venta") %>' />
                    <br />
                    Img_URL:
                    <asp:TextBox ID="Img_URLTextBox" runat="server" Text='<%# Bind("Img_URL") %>' Width="200" Height="200" />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" class="auto-style2">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Img_URL") %>' Width="200" Height="200" />
                    <br />
                    Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Precio_Venta: $
                    <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                    <asp:Button ID="btn_Seleccionar" runat="server" CommandArgument='<%# Eval("ID_Producto") %>' CommandName="id" OnCommand="Button1_Command" Text="Seleccionar" />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            <div class="text-center mt-2">
                            <asp:DataPager ID="lvProductosDataPager" runat="server" PageSize="6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>

                            </div>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="">ID_Producto:
                    <asp:Label ID="ID_ProductoLabel" runat="server" Text='<%# Eval("ID_Producto") %>' />
                    <br />
                    Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Precio_Venta: $
                    <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                    Img_URL:
                    <asp:Label ID="Img_URLLabel" runat="server" Text='<%# Eval("Img_URL") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>

        </asp:ListView>

        </div>
    </form>
</body>
</html>
