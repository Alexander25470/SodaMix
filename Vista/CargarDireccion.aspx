<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargarDireccion.aspx.cs" Inherits="Vista.CargarDireccion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="./bootstrap-5.0.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap-5.0.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row d-flex justify-content-between navbar-light" style="background-color: #e3f2fd;">
            <div class="col-auto">
                Usuario: <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
            </div>
            <div class="col-auto">
                <div class="btn-group" role="group" aria-label="Basic outlined example">
                    <asp:Button class="btn btn-outline-primary" ID="btnAdminProductos" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
                    <asp:Button class="btn btn-outline-primary" ID="btnAdminUsuarios" runat="server" OnClick="btnAdminUsuarios_Click" Text="Administrar Usuarios" />
                    <asp:Button class="btn btn-outline-primary" ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
                    <asp:Button class="btn btn-outline-primary" ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" Width="85px" />
                    <asp:Button class="btn btn-outline-primary" ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio"/>
                </div>
            </div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Calle"></asp:Label>
        <asp:TextBox ID="tbx_Calle" runat="server"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbx_Calle" ErrorMessage="Ingrese una calle" ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Numero"></asp:Label>
            <asp:TextBox ID="tbx_Numero" runat="server"></asp:TextBox>
        </p>
        
                        <asp:RegularExpressionValidator ID="rg_numeros" runat="server" ControlToValidate="tbx_Numero" ErrorMessage="Numero de direccion no valido" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
        
        
            <asp:RequiredFieldValidator ID="RFV_NumeroCalle" runat="server" ControlToValidate="tbx_Numero" ErrorMessage="Ingrese un Numero de Calle." ValidationGroup="grupo2"></asp:RequiredFieldValidator>
        
        <p>
            <asp:Label ID="Label3" runat="server" Text="Piso"></asp:Label>
            <asp:TextBox ID="tbx_Piso" runat="server"></asp:TextBox>
        </p>
        
                        <asp:RegularExpressionValidator ID="rg_numeros0" runat="server" ControlToValidate="tbx_Piso" ErrorMessage="Numero de piso no valido" ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
        
        <p>
            <asp:Label ID="Label5" runat="server" Text="Provincia"></asp:Label>
            <asp:DropDownList ID="ddlProvincias" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincias_SelectedIndexChanged">
            </asp:DropDownList>
        </p>
        <asp:Label ID="Label6" runat="server" Text="Ciudad"></asp:Label>
        <asp:DropDownList ID="ddlCiudades" runat="server">
        </asp:DropDownList>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Cargar" OnClick="Button1_Click" ValidationGroup="grupo2" />
        </p>
    </form>
</body>
</html>
