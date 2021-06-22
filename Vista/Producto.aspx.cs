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
    public partial class Producto : System.Web.UI.Page
    {
        NegocioProductos neg = new NegocioProductos();
        string idProducto="";
        protected void Page_Load(object sender, EventArgs e)
        {
            Entidades.Producto prod = new Entidades.Producto();
            idProducto = Request.QueryString["id"];
            if(idProducto != "" && idProducto != null) { 
                prod=neg.obtenerProducto(Convert.ToInt32(idProducto));
                imgProducto.ImageUrl = prod.Img_URL;
                lblTitulo.Text= prod.Nombre;
                lblDescripcionProducto.Text = prod.Nombre;
                lblNombreProducto.Text = prod.Descripcion;
            }

        }
    }
}