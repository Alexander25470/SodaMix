using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vista
{
    public partial class AdministrarClientes : System.Web.UI.Page
    {
        NegocioUsuario neg = new NegocioUsuario();
        protected void cargarGridViewUsuarios()
        {
            GVClientes.DataSource = neg.obtenerTablaUsuario();
            GVClientes.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                if (usuario == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else if (usuario.TipoUsuario != "0")
                {
                    Session.Remove("usuario");
                    Response.Redirect("Login.aspx");
                }

                lblNombreUsuario.Text = usuario.Nombre;
                cargarGridViewUsuarios();

            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            GVClientes.DataSource = neg.obtenerTablaUsuarioBusqueda(tbx_busqueda.Text);
            GVClientes.DataBind();
        }

        protected void GVClientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Usuario usu = new Usuario();

            usu.Id= ((Label)GVClientes.Rows[e.RowIndex].FindControl("lbl_IDUsuario")).Text;
            usu.TipoUsuario = ((Label)GVClientes.Rows[e.RowIndex].FindControl("lbl_idTipoUsuario")).Text;
            usu.Nombre = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxNombre")).Text;
            usu.Apellido = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxApellido")).Text;
            usu.Dni = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxDNI")).Text;
            usu.Telefono = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxTelefono")).Text;
            usu.FechaNacimiento = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxFechaNacimiento")).Text;
            usu.Email = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxEmail")).Text;
            usu.UserName = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxUsername")).Text;
            usu.Pass = ((TextBox)GVClientes.Rows[e.RowIndex].FindControl("tbxpassword")).Text;
            usu.Estado = Convert.ToString(((CheckBox)GVClientes.Rows[e.RowIndex].FindControl("cbxEditarEstado")).Checked);

            neg.actualizarUsuario(usu);

            GVClientes.EditIndex = -1;

            cargarGridViewUsuarios();

        }

        protected void GVClientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVClientes.EditIndex = e.NewEditIndex;

            cargarGridViewUsuarios();
        }

        protected void GVClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVClientes.EditIndex = -1;

            cargarGridViewUsuarios();
        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alteracion_Productos.aspx");
        }
        protected void btn_Estadisticas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Estadisticas.aspx");
        }
        protected void btn_Ventas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }

        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Comprar.aspx");
        }
    }
}