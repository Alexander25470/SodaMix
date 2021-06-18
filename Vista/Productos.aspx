<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Vista.Productos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblSearch" runat="server" Text="Buscar producto:"></asp:Label>
        <asp:TextBox ID="tbxSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Buscar" OnClick="btnSearch_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <div>
        </div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    <br />
                    Precio_Venta:
                    <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">Nombre:
                    <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                    <br />
                    Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    Precio_Venta:
                    <asp:TextBox ID="Precio_VentaTextBox" runat="server" Text='<%# Bind("Precio_Venta") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br />
                </td>
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
                <td runat="server" style="">Nombre:
                    <asp:TextBox ID="NombreTextBox" runat="server" Text='<%# Bind("Nombre") %>' />
                    <br />
                    Descripcion:
                    <asp:TextBox ID="DescripcionTextBox" runat="server" Text='<%# Bind("Descripcion") %>' />
                    <br />
                    Precio_Venta:
                    <asp:TextBox ID="Precio_VentaTextBox" runat="server" Text='<%# Bind("Precio_Venta") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br />
                </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    <br />
                    Precio_Venta:
                    <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Nombre:
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    <br />
                    Descripcion:
                    <asp:Label ID="DescripcionLabel" runat="server" Text='<%# Eval("Descripcion") %>' />
                    <br />
                    Precio_Venta:
                    <asp:Label ID="Precio_VentaLabel" runat="server" Text='<%# Eval("Precio_Venta") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SODAMIXConnectionString %>" SelectCommand="SELECT [Nombre], [Descripcion], [Precio_Venta] FROM [PRODUCTO]"></asp:SqlDataSource>
    </form>
</body>
</html>
