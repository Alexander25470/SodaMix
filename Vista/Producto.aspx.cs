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
        int posInCarrito;
        protected void Page_Load(object sender, EventArgs e)
        {

            Usuario usuario = (Usuario)Session["usuario"];
            if (usuario == null)
            {
                Response.Redirect("Login.aspx");
            }
            lblNombreUsuario.Text = usuario.Nombre;

            Entidades.Producto prod = new Entidades.Producto();
            idProducto = Request.QueryString["id"];
            if(idProducto != "" && idProducto != null) { 
                prod=neg.obtenerProducto(Convert.ToInt32(idProducto));
                imgProducto.ImageUrl = prod.Img_URL;
                lblTitulo.Text= prod.Nombre;
                lblDescripcionProducto.Text = prod.Nombre;
                lblNombreProducto.Text = prod.Descripcion;
            }

            if (Session["carrito"] == null)
            {
                Session["carrito"] = new Carrito();
            }
            else
            {
                Carrito car = (Carrito)Session["carrito"];
                if(car._articulos.Count==0)
                {
                    car._articulos.Add(new ItemCarrito(idProducto));
                }
                else
                {
                    posInCarrito = car._articulos.FindIndex((ItemCarrito it) =>  it.Id == idProducto);
                    if (posInCarrito == -1)
                    {
                        car._articulos.Add(new ItemCarrito(idProducto));
                        posInCarrito = car._articulos.FindIndex((ItemCarrito it) => it.Id == idProducto);
                    }
                    lblTest.Text = car._articulos.FindIndex((ItemCarrito it) => it.Id == idProducto).ToString();
                }

                
                lbl_Cantidad.Text = car._articulos[posInCarrito].Cant.ToString();
            }
        }

        protected void btn_Inicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }

        protected void btn_Sumar_Click(object sender, EventArgs e)
        {
            Carrito car = (Carrito)Session["carrito"];
            car._articulos[posInCarrito].Cant += 1;
            lbl_Cantidad.Text = car._articulos[posInCarrito].Cant.ToString();
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

        protected void btn_Restar_Click(object sender, EventArgs e)
        {
            Carrito car = (Carrito)Session["carrito"];
            if(car._articulos[posInCarrito].Cant > 0)
            {
                car._articulos[posInCarrito].Cant -= 1;
                lbl_Cantidad.Text = car._articulos[posInCarrito].Cant.ToString();
            }
            
        }
    }
}