using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vista
{
    public partial class CargarDireccion : System.Web.UI.Page
    {
        NegocioDirecciones neg = new NegocioDirecciones();
        Direccion dir = new Direccion();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            Usuario usuario = (Usuario)Session["usuario"];
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
                    btn_Estadisticas.Style.Add("display", "none");
                }
                //lvProductos.DataSource = neg.obtenerTablaProductos();
                //lvProductos.DataBind();

                
                ddlProvincias.DataSource = neg.obtenerTablaProvincia();
                ddlProvincias.DataTextField = "Nombre";
                ddlProvincias.DataValueField = "ID_Provincia";
                ddlProvincias.DataBind();

                ddlCiudades.DataSource = neg.obtenerTablaCiudades(ddlProvincias.SelectedValue);
                ddlCiudades.DataTextField = "Nombre";
                ddlCiudades.DataValueField = "ID_Ciudad";
                ddlCiudades.DataBind();
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

        protected void btn_Ventas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Ventas.aspx");
        }
        protected void btn_Estadisticas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Estadisticas.aspx");
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCiudades.DataSource = neg.obtenerTablaCiudades(ddlProvincias.SelectedValue);
            ddlCiudades.DataTextField = "Nombre";
            ddlCiudades.DataValueField = "ID_Ciudad";
            ddlCiudades.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Usuario user = (Usuario)Session["usuario"];
            dir.ID_Usuario = user.Id;
            dir.ID_Ciudad = ddlCiudades.SelectedValue;
            dir.direccion = tbx_Calle.Text + " " + tbx_Numero.Text;
            dir.Piso = tbx_Piso.Text;

            neg.AgregarDireccion(dir);

            tbx_Calle.Text = "";
            tbx_Numero.Text = "";
            tbx_Piso.Text =  "";
            Response.Redirect("Comprar.aspx");
        }
    }
}