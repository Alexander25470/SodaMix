<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Alteracion_Productos.aspx.cs" Inherits="Vista.CargarProductos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvProductos" runat="server" AllowPaging="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" DataKeyNames="ID_Producto" DataSourceID="SqlDataSource1" PageSize="14" OnPageIndexChanging="gvProductos_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="ID_Producto" HeaderText="ID_Producto" InsertVisible="False" ReadOnly="True" SortExpression="ID_Producto" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Tipo_Producto" HeaderText="Tipo_Producto" SortExpression="Tipo_Producto" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                    <asp:BoundField DataField="Precio_Compra" HeaderText="Precio_Compra" SortExpression="Precio_Compra" />
                    <asp:BoundField DataField="Precio_Venta" HeaderText="Precio_Venta" SortExpression="Precio_Venta" />
                    <asp:BoundField DataField="Img_URL" HeaderText="Img_URL" SortExpression="Img_URL" />
                    <asp:CheckBoxField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
            Id_Producto : </div>
    </form>
</body>
</html>
