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
    public partial class Productos : System.Web.UI.Page
    {
        NegocioProductos neg = new NegocioProductos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carrito"] == null)
            {
                Session["carrito"] = new Carrito();
            }

            Usuario usuario=(Usuario)Session["usuario"];
            if (usuario == null)
            {
                Response.Redirect("Login.aspx");
            }
            lblNombreUsuario.Text = usuario.Nombre;
            if (!IsPostBack)
            {
                if (usuario.TipoUsuario != "0")
                {
                    btnAdminProductos.Style.Add("display", "none");
                    btnAdminUsuarios.Style.Add("display", "none");
                    btn_Ventas.Style.Add("display", "none");
                }
                //lvProductos.DataSource = neg.obtenerTablaProductos();
                //lvProductos.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Alteracion_Productos.aspx");
        }

        protected void btnAdminUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministrarClientes.aspx");
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            string id = ((Button)sender).CommandArgument;
            Response.Redirect("Producto.aspx?id=" + id);
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