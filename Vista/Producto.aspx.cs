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
        Entidades.Producto prod;
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

            if (!IsPostBack)
            {
                if (usuario.TipoUsuario != "0")
                {
                    btnAdminProductos.Style.Add("display", "none");
                    btnAdminUsuarios.Style.Add("display", "none");
                    btn_Ventas.Style.Add("display", "none");
                }
                lbl_SubTotal.Text = "0";
            }

            //Entidades.Producto prod = new Entidades.Producto();
            idProducto = Request.QueryString["id"];
            if(idProducto != "" && idProducto != null) { 
                prod=neg.obtenerProducto(Convert.ToInt32(idProducto));
                imgProducto.ImageUrl = prod.Img_URL;
                lblTitulo.Text= prod.Nombre;
                lblDescripcionProducto.Text = prod.Descripcion;
                lblNombreProducto.Text = prod.Nombre;
                lbl_precio.Text = prod.Precio_Venta.ToString();
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
                    car._articulos.Add(new ItemCarrito(prod));
                }
                else
                {
                    posInCarrito = car._articulos.FindIndex((ItemCarrito it) =>  it.Producto.ID_Producto.ToString() == idProducto);
                    if (posInCarrito == -1)
                    {
                        car._articulos.Add(new ItemCarrito(prod));
                        posInCarrito = car._articulos.FindIndex((ItemCarrito it) => it.Producto.ID_Producto.ToString() == idProducto);
                    }
                    lblTest.Text = car._articulos.FindIndex((ItemCarrito it) => it.Producto.ID_Producto.ToString() == idProducto).ToString();
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
            if (car._articulos[posInCarrito].Cant < prod.Stock)
            {
                lbl_Agregado.Text = "";
                car._articulos[posInCarrito].Cant += 1;
                lbl_Cantidad.Text = car._articulos[posInCarrito].Cant.ToString();
                lbl_Agregado.Text = "Has agregado " + car._articulos[posInCarrito].Cant.ToString() + " " + car._articulos[posInCarrito].Producto.Nombre + " al carrito";
                lbl_SubTotal.Text = Convert.ToString(car._articulos[posInCarrito].Cant * Convert.ToInt32(lbl_precio.Text));
            }
            else
            {
                lbl_Agregado.Text = "No se puede añadir mas de este producto.";
            }
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
                lbl_Agregado.Text = "Has quitado " + car._articulos[posInCarrito].Cant.ToString() + " " + car._articulos[posInCarrito].Producto.Nombre + " del carrito";
                lbl_SubTotal.Text = Convert.ToString(car._articulos[posInCarrito].Cant * Convert.ToInt32(lbl_precio.Text));
            }
            else
            {
                lbl_Agregado.Text = "Todavia no has agregado de este producto al carrito.";
            }
            
        }

        protected void btn_VerCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Comprar.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}