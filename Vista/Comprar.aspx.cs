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
            NegocioMetodoPago negMP = new NegocioMetodoPago();
            NegocioDirecciones negD = new NegocioDirecciones();
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
                    btn_Estadisticas.Style.Add("display", "none");
                }
                //lvProductos.DataSource = neg.obtenerTablaProductos();
                //lvProductos.DataBind();
            }

            DataTable table = new DataTable();
            table.Columns.Add("producto");
            table.Columns.Add("cantidad");
            table.Columns.Add("precio");
            table.Columns.Add("subtotal");

            if (carrito._articulos.Count > 0)
            {
                int Items = 0;
                double total = 0;
                foreach(ItemCarrito ic in carrito._articulos)
                {
                    if (ic.Cant > 0)
                    {
                        Items++;
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
                }
                lblPrecioTotal.Text = total.ToString();
                if (Items > 0)
                {
                    lbl_productosElegidos.Text = "Productos Elegidos.";
                }
                else
                {
                    lbl_productosElegidos.Text = "Aun no has agregado productos.";
                    btnComprar.Enabled = false;
                    btnVaciarCarrito.Enabled = false;

                }
            }
            else
            {
                lbl_productosElegidos.Text = "Aun no has agregado productos.";
            }
            

            if (!IsPostBack)
            {
                gvCompra.DataSource = table;
                gvCompra.DataBind();
                ddlMetodoPago.DataSource = negMP.obtenerTablaMediosDePago();
                ddlMetodoPago.DataTextField = "Descripcion";
                ddlMetodoPago.DataValueField = "ID_Metodo_Pago";
                ddlMetodoPago.DataBind();

                ddlDirecciones.DataSource = negD.obtenerTablaDirecciones(usuario.Id);
                ddlDirecciones.DataTextField = "Direccion";
                ddlDirecciones.DataValueField = "ID_Direccion";
                ddlDirecciones.DataBind();

            }
            

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
        protected void btn_Estadisticas_Click(object sender, EventArgs e)
        {
            Response.Redirect("Estadisticas.aspx");
        }
        protected void btnComprar_Click(object sender, EventArgs e)
        {
            int cant = 0;
            foreach (ItemCarrito ic in carrito._articulos)
            {
                if (ic.Cant > 0)
                {
                    cant++;
                }
            }
            if (cant == 0)
            {
                Response.Write("<script language=javascript>alert('No hay articulos!')</script>");
            }
            else
            {
                NegocioVentas venta = new NegocioVentas();
                Usuario user = (Usuario)Session["usuario"];
                Session["carrito"] = new Carrito();
                venta.cargarVenta(carrito, user.Id, ddlMetodoPago.SelectedValue.ToString());
                Response.Write(@"<script language=javascript>(()=>{alert('¡Gracias por tu compra!.\nRecibiras tus productos en los proximos 3 dias.');window.location.href = 'Productos.aspx';})()</script>");
            }
        }

        protected void btnVaciarCarrito_Click(object sender, EventArgs e)
        {
            Session["carrito"] = new Carrito();
            Response.Redirect("Comprar.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CargarDireccion.aspx");
        }
    }
}