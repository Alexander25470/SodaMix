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
            if (tbxUser.Text.Trim().Length == 0 || tbxPass.Text.Trim().Length == 0)
            {
                lblUsuario.Text = "No se aceptan campos vacios";
            }
            else
            {
                NegocioUsuario negocioUsuario = new NegocioUsuario();
                String username = tbxUser.Text;
                String pass = tbxPass.Text;
                Usuario user = negocioUsuario.login(username, pass);
                if(user == null)
                {
                    Response.Write("<script language=javascript>alert('Credenciales invalidas.')</script>");
                }
                else
                {
                    Session["usuario"] = user;
                    Response.Redirect("Productos.aspx");
                }
            }
        }

        protected void btn_Registrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("CargarCliente.aspx");
        }
    }
}