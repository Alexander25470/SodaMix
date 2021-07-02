using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vista
{
    public partial class Ventas : System.Web.UI.Page
    {
        NegocioVentas neg = new NegocioVentas();
       
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

                gvVentas.DataSource = neg.obtenerTablaVentas();
                gvVentas.DataBind();
                
            }

        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alteracion_Productos.aspx");
        }

        protected void btnAdminUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministrarClientes.aspx");
        }


        protected void btn_Carrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Comprar.aspx");
        }
        protected void btnEstadisticas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Estadisticas.aspx");
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            gvVentas.DataSource = neg.obtenerTablaVentas(tbx_buscarProducto.Text);
            gvVentas.DataBind();
        }

        protected void btnVerDetalle_Command(object sender, CommandEventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("Factura.aspx?id=" + id);
        }

        protected void btn_Estadisticas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Estadisticas.aspx");
        }
    }
}