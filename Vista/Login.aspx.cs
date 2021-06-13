using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using Negocio;

namespace Vista
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            NegocioUsuario negocioUsuario = new NegocioUsuario();
            String username = tbxUser.Text;
            String pass = tbxPass.Text;
            Usuario user = negocioUsuario.login(username, pass);
            labelDebug.Text = user.Email;
        }
    }
}