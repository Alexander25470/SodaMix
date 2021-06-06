<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Vista.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblSearch" runat="server" Text="Buarcar producto:"></asp:Label>
        <asp:TextBox ID="tbxSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Buscar" />
        <div>
        </div>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Producto" DataSourceID="SqlDataSource1" GroupItemCount="3" style="margin-bottom: 0px">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="100px" ImageUrl='<%# Eval("URL_Imagen_Producto") %>' Width="100px" />
                    <br />NombreProducto:
                    <asp:Label ID="NombreProductoLabel" runat="server" Text='<%# Eval("NombreProducto") %>' />
                    <br />DescripcionProducto:
                    <asp:Label ID="DescripcionProductoLabel" runat="server" Text='<%# Eval("DescripcionProducto") %>' />
                    <br />
                    URL_Imagen_Producto:
                    <asp:Label ID="URL_Imagen_ProductoLabel" runat="server" Text='<%# Eval("URL_Imagen_Producto") %>' />
                    <br />
                    <asp:Button ID="btnSeleccion" runat="server" CommandName="eventButton" CssClass="auto-style2" style="margin-left: 93px" Text="Seleccionar" CommandArgument='<%# Eval("ID_Producto")+","+Eval("NombreProducto")+","+Eval("DescripcionProducto") %>' OnCommand="btnSeleccionar_Command" />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">Id_Producto:
                    <asp:Label ID="Id_ProductoLabel1" runat="server" Text='<%# Eval("Id_Producto") %>' />
                    <br />NombreProducto:
                    <asp:TextBox ID="NombreProductoTextBox" runat="server" Text='<%# Bind("NombreProducto") %>' />
                    <br />
                    DescripcionProducto:
                    <asp:TextBox ID="DescripcionProductoTextBox" runat="server" Text='<%# Bind("DescripcionProducto") %>' />
                    <br />
                    Id_HorarioProducto:
                    <asp:TextBox ID="Id_HorarioProductoTextBox" runat="server" Text='<%# Bind("Id_HorarioProducto") %>' />
                    <br />
                    Id_ProvinciaProducto:
                    <asp:TextBox ID="Id_ProvinciaProductoTextBox" runat="server" Text='<%# Bind("Id_ProvinciaProducto") %>' />
                    <br />
                    DireccionProducto:
                    <asp:TextBox ID="DireccionProductoTextBox" runat="server" Text='<%# Bind("DireccionProducto") %>' />
                    <br />
                    URL_Imagen_Producto:
                    <asp:TextBox ID="URL_Imagen_ProductoTextBox" runat="server" Text='<%# Bind("URL_Imagen_Producto") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No se han devuelto datos.</td>
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
                <td runat="server" style="">NombreProducto:
                    <asp:TextBox ID="NombreProductoTextBox" runat="server" Text='<%# Bind("NombreProducto") %>' />
                    <br />
                    DescripcionProducto:
                    <asp:TextBox ID="DescripcionProductoTextBox" runat="server" Text='<%# Bind("DescripcionProducto") %>' />
                    <br />
                    Id_HorarioProducto:
                    <asp:TextBox ID="Id_HorarioProductoTextBox" runat="server" Text='<%# Bind("Id_HorarioProducto") %>' />
                    <br />
                    Id_ProvinciaProducto:
                    <asp:TextBox ID="Id_ProvinciaProductoTextBox" runat="server" Text='<%# Bind("Id_ProvinciaProducto") %>' />
                    <br />
                    DireccionProducto:
                    <asp:TextBox ID="DireccionProductoTextBox" runat="server" Text='<%# Bind("DireccionProducto") %>' />
                    <br />
                    URL_Imagen_Producto:
                    <asp:TextBox ID="URL_Imagen_ProductoTextBox" runat="server" Text='<%# Bind("URL_Imagen_Producto") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="100px" ImageUrl='<%# Eval("URL_Imagen_Producto") %>' Width="100px" />
                    <br />NombreProducto:
                    <asp:Label ID="NombreProductoLabel" runat="server" Text='<%# Eval("NombreProducto") %>' />
                    <br />DescripcionProducto:
                    <asp:Label ID="DescripcionProductoLabel" runat="server" Text='<%# Eval("DescripcionProducto") %>' />
                    <br />
                    URL_Imagen_Producto:
                    <asp:Label ID="URL_Imagen_ProductoLabel" runat="server" Text='<%# Eval("URL_Imagen_Producto") %>' />
                    <br />
                    <asp:Button ID="btnSeleccionar" runat="server" CommandArgument='<%# Eval("ID_Producto")+","+Eval("NombreProducto")+","+Eval("DescripcionProducto") %>' CommandName="eventButton" CssClass="auto-style1" Height="26px" OnCommand="btnSeleccionar_Command" style="margin-left: 92px" Text="Seleccionar" />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Id_Producto:
                    <asp:Label ID="Id_ProductoLabel" runat="server" Text='<%# Eval("Id_Producto") %>' />
                    <br />NombreProducto:
                    <asp:Label ID="NombreProductoLabel" runat="server" Text='<%# Eval("NombreProducto") %>' />
                    <br />DescripcionProducto:
                    <asp:Label ID="DescripcionProductoLabel" runat="server" Text='<%# Eval("DescripcionProducto") %>' />
                    <br />
                    Id_HorarioProducto:
                    <asp:Label ID="Id_HorarioProductoLabel" runat="server" Text='<%# Eval("Id_HorarioProducto") %>' />
                    <br />
                    Id_ProvinciaProducto:
                    <asp:Label ID="Id_ProvinciaProductoLabel" runat="server" Text='<%# Eval("Id_ProvinciaProducto") %>' />
                    <br />
                    DireccionProducto:
                    <asp:Label ID="DireccionProductoLabel" runat="server" Text='<%# Eval("DireccionProducto") %>' />
                    <br />
                    URL_Imagen_Producto:
                    <asp:Label ID="URL_Imagen_ProductoLabel" runat="server" Text='<%# Eval("URL_Imagen_Producto") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
