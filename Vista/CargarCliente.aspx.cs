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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Aceptar_Click(object sender, EventArgs e)
        {
            
            NegocioUsuario negocio = new NegocioUsuario();
            Usuario user = new Usuario();
            if (tbx_Pass.Text == tbx_PassRepetida.Text)
            {
                user.Nombre = tbx_Nombre.Text;
                user.Apellido = tbx_Apellido.Text;
                user.Dni = tbx_Dni.Text;
                user.FechaNacimiento = tbx_FechaNacimiento.Text;
                user.Email = tbx_Mail.Text;
                user.UserName = tbx_Usuario.Text;
                user.Telefono = tbx_Telefono.Text;
                user.Pass = tbx_Pass.Text;
                negocio.registrarUsuario(user);
                Response.Write("<script language=javascript>alert('Te has registrado con exito.')</script>");
            }
            else
            {
                lbl_PassNoCoincide.Text = "Las password no coinciden.";
            }
            

        }

        protected void btn_Inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}