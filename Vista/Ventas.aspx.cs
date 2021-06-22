﻿using System;
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}