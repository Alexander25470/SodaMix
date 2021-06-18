using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;

namespace Vista
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario=(Usuario)Session["usuario"];
            lblNombreUsuario.Text = usuario.Nombre;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
        }
    }
}