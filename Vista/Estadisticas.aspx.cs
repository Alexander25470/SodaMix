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
    public partial class Estadisticas : System.Web.UI.Page
    {
        NegocioVentas neg = new NegocioVentas();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

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

                gv_Estadisticas.DataSource = neg.obtenerEstadisticaVenta();
                gv_Estadisticas.DataBind();
                lbl_GananciaTotal.Text = Convert.ToString(neg.obtenerGananciasTotales());
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

        protected void btn_Mostrar_Click(object sender, EventArgs e)
        {
            gv_Estadisticas.DataSource = neg.obtenerEstadisticaFechas(tbx_FechaInicio.Text, tbx_FechaFin.Text);
            gv_Estadisticas.DataBind();
            lbl_GananciaTotal.Text = Convert.ToString(neg.obtenerGanancias(tbx_FechaInicio.Text, tbx_FechaFin.Text));
        }

        protected void btn_VaciarFecha_Click(object sender, EventArgs e)
        {
            tbx_FechaInicio.Text = "";
            tbx_FechaFin.Text = "";

            Response.Redirect("Estadisticas.aspx");
        }
    }
}