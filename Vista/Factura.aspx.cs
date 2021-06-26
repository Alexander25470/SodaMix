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
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioVentas neg = new NegocioVentas();

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

                string idFactura = Request.QueryString["id"];

                gvFactura.DataSource = neg.obtenerTablaFactura(idFactura);
                gvFactura.DataBind();
            }

        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministrarClientes.aspx");
        }

        protected void btnAdminUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministrarClientes.aspx");
        }

        protected void btn_Carrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Comprar.aspx");
        }

        protected void btnVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }
    }
}