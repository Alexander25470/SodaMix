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
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblSearch" runat="server" Text="Buscar producto:"></asp:Label>
        <asp:TextBox ID="tbxSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Buscar" OnClick="btnSearch_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
        <asp:Button ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
        <div>
        </div>
        <asp:ListView ID="lvProductos" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3" DataKeyNames="ID_Producto">
            <AlternatingItemTemplate>
                <td runat="server" style="">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Img_URL") %>' />
                    <br />
                    Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Precio_Venta:&nbsp;<asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("ID_Producto") %>' CommandName="id" OnCommand="Button1_Command" Text="Button" />
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
                    Precio_Venta:&nbsp;<asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("ID_Producto") %>' CommandName="id" OnCommand="Button1_Command" Text="Button" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SODAMIXConnectionString %>" SelectCommand="SELECT [ID_Producto], [Nombre], [Precio_Venta], [Img_URL] FROM [PRODUCTO]"></asp:SqlDataSource>
        <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
