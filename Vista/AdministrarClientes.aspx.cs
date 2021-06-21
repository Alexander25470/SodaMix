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

                cargarGridViewUsuarios();

            }
        }
    }
}