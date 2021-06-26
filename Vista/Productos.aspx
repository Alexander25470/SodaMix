<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Vista.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 86px;
        }
        .auto-style2 {
            height: 80px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-light bg-light"">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">SODAMIX</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            Usuario: <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
                        </li>
                        <li class="nav-item">
                            <asp:Button class="btn btn-outline-success" ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
                        </li>
                        <li class="nav-item">
                            <asp:Button class="btn btn-outline-success" ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
                        </li>
                        <li class="nav-item">
                            <asp:Button class="btn btn-outline-success" ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
                        </li>
                        <li class="nav-item">
                            <asp:Button class="btn btn-outline-success" ID="btnCarrito" runat="server" OnClick="btnCarrito_Click" Text="Ver carrito" />
                        </li>
                        <li class="nav-item">
                            <asp:Button class="btn btn-outline-success" ID="btn_CerrarSesion" runat="server" OnClick="btn_CerrarSesion_Click" Text="Cerrar Sesion" />
                        </li>
                    </ul>
                    <div class="d-flex">
                        <asp:Label ID="lblSearch" runat="server" Text="Buscar producto:"></asp:Label>
                        <asp:TextBox class="form-control me-2" ID="tbxSearch" runat="server"></asp:TextBox>
                        <asp:Button class="btn btn-outline-success" ID="btnSearch" runat="server" Text="Buscar" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>
        </nav>
        <div>
        </div>
        <asp:ListView ID="lvProductos" runat="server" GroupItemCount="3" DataKeyNames="ID_Producto">
            <AlternatingItemTemplate>
                <td runat="server" style="">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Img_URL") %>' />
                    <br />
                    Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Precio_Venta:&nbsp;<asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
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
                    Precio_Venta:
                    <asp:TextBox ID="Precio_VentaTextBox" runat="server" Text='<%# Bind("Precio_Venta") %>' />
                    <br />
                    Img_URL:
                    <asp:TextBox ID="Img_URLTextBox" runat="server" Text='<%# Bind("Img_URL") %>' />
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
                    Precio_Venta:
                    <asp:TextBox ID="Precio_VentaTextBox" runat="server" Text='<%# Bind("Precio_Venta") %>' />
                    <br />
                    Img_URL:
                    <asp:TextBox ID="Img_URLTextBox" runat="server" Text='<%# Bind("Img_URL") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" class="auto-style2">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Img_URL") %>' />
                    <br />
                    Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Precio_Venta: <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                    <asp:Button ID="btn_Seleccionar" runat="server" CommandArgument='<%# Eval("ID_Producto") %>' CommandName="id" OnCommand="Button1_Command" Text="Seleccionar" />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server" class="auto-style1">
                            <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="">
                            &nbsp;</td>
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
                    Precio_Venta:
                    <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                    Img_URL:
                    <asp:Label ID="Img_URLLabel" runat="server" Text='<%# Eval("Img_URL") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
