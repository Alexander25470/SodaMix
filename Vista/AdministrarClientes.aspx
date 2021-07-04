<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrarClientes.aspx.cs" Inherits="Vista.AdministrarClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 26px;
        }
        .auto-style2 {
            margin-left: 24px;
        }
        .auto-style3 {
            margin-right: 0px;
        }
        .auto-style4 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Buscar Cliente por DNI:<asp:TextBox ID="tbx_busqueda" runat="server" CssClass="auto-style1"></asp:TextBox>
            <asp:Button ID="btn_Buscar" runat="server" CssClass="auto-style2" OnClick="btn_Buscar_Click" Text="Buscar" Width="84px" ValidationGroup="grupo2" />
            &nbsp;&nbsp;<asp:RegularExpressionValidator ID="rg_numeros" runat="server" ControlToValidate="tbx_busqueda" ErrorMessage="El DNI debe ser numerico." ValidationExpression="^\d+$" ValidationGroup="grupo2"></asp:RegularExpressionValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Usuario:&nbsp;
        <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label>
        <asp:Button ID="btnAdmin" runat="server" OnClick="btnAdmin_Click" Text="Editar Productos" />
        <asp:Button ID="btn_Ventas" runat="server" OnClick="btn_Ventas_Click" Text="Ventas" />
        <asp:Button ID="btn_Estadisticas" runat="server" OnClick="btn_Estadisticas_Click" Text="Estadisticas" Width="85px" />
        <asp:Button ID="btnInicio" runat="server" OnClick="btnInicio_Click" Text="Inicio" CssClass="auto-style4" />
            <asp:Button ID="btnCarrito" runat="server" OnClick="btnCarrito_Click" Text="Ver carrito" />
            <br />
        </div>
            <asp:GridView ID="GVClientes" runat="server" AutoGenerateColumns="False" CssClass="auto-style3" OnRowCancelingEdit="GVClientes_RowCancelingEdit" OnRowEditing="GVClientes_RowEditing" OnRowUpdating="GVClientes_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="ID_Usuario">
                        <ItemTemplate>
                            <asp:Label ID="lbl_IDUsuario" runat="server" Text='<%# Bind("ID_Usuario") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="TIPO_USUARIO">
                        <ItemTemplate>
                            <asp:Label ID="lbl_TipoUsuario" runat="server" Text='<%# Bind("TipoUsuario") %>'></asp:Label>
                            <asp:Label ID="lbl_idTipoUsuario" runat="server" Text='<%# Bind("ID_TIPO") %>' Visible="False"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxNombre" ErrorMessage="RequiredFieldValidator" ValidationGroup="grupo1"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellido">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxApellido" runat="server" Text='<%# Bind("Apellido") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DNI">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxDNI" runat="server" Text='<%# Bind("DNI") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxTelefono" runat="server" Text='<%# Bind("Telefono") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FechaNacimiento">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxFechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("FechaNacimiento") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre_Usuario">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxUsername" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contraseña">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxpassword" runat="server" Text='<%# Bind("Pass") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Pass") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Estado">
                        <EditItemTemplate>
                            <asp:CheckBox ID="cbxEditarEstado" runat="server" Checked='<%# Bind("Estado") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbxEstado" runat="server" Checked='<%# Bind("Estado") %>' Enabled="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="editar">
                        <EditItemTemplate>
                            <asp:Button ButtonType="Button" runat="server" CommandName="Update" Text="Editar" CausesValidation="True" ValidationGroup="grupo1" />
                            <asp:Button ButtonType="Button" runat="server" CommandName="Cancel" Text="Cancelar" CausesValidation="True" ValidationGroup="grupo1" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ButtonType="Button" runat="server" CommandName="Edit" Text="Editar" CausesValidation="False" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    </form>
</body>
</html>
