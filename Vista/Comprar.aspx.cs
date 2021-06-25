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
    public partial class Comprar : System.Web.UI.Page
    {
        Carrito carrito;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["carrito"] == null)
            {
                Session["carrito"] = new Carrito();
            }
            else
            {
                carrito = (Carrito)Session["carrito"];
            }

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
                //lvProductos.DataSource = neg.obtenerTablaProductos();
                //lvProductos.DataBind();
            }

            DataTable table = new DataTable();
            table.Columns.Add("producto");
            table.Columns.Add("cantidad");
            table.Columns.Add("precio");
            table.Columns.Add("subtotal");

            if (carrito._articulos.Count > -1)
            {
                double total = 0;
                foreach(ItemCarrito ic in carrito._articulos)
                {
                    double subtotal = ic.Producto.Precio_Venta * ic.Cant;
                    total += subtotal;
                    DataRow row;
                    row = table.NewRow();
                    row["producto"] = ic.Producto.Nombre;
                    row["cantidad"] = ic.Cant;
                    row["precio"] = ic.Producto.Precio_Venta;
                    row["subtotal"] = subtotal;
                    table.Rows.Add(row);
                }
                lblPrecioTotal.Text = total.ToString();
            }
            gvCompra.DataSource = table;
            gvCompra.DataBind();


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
    }
}