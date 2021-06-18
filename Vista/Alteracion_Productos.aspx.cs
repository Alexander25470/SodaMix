using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vista
{
    public partial class CargarProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string query = "Select * from PRODUCTO";

            gvProductos.PageIndex = e.NewPageIndex;

            con.cargarGridView(gvProductos, query, "Producto");
        }

        protected void gvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            string query = "Select IdProducto, NombreProducto, CantidadPorUnidad, PrecioUnidad from Productos";

            gvProductos.EditIndex = e.NewEditIndex;

            con.cargarGridView(gvProductos, query, "Producto");
        }

        protected void gvProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            string query = "Select IdProducto, NombreProducto, CantidadPorUnidad, PrecioUnidad from Productos";
            gvProductos.EditIndex = -1;

            con.cargarGridView(gvProductos, query, "Producto");
        }

        protected void gvProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Producto prod = new Producto();
            prod.NombreProducto = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_NombreProducto")).Text;
            prod.CantidadPorUnidad = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_CantidadPorUnidad")).Text;
            prod.PrecioUnidad = Convert.ToDouble(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_PrecioUnidad")).Text);
            prod.IdProducto = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_idproducto")).Text);
            GestionProductos gProd = new GestionProductos();

            gProd.ActualizarProducto(prod);

            gvProductos.EditIndex = -1;
            string query = "Select IdProducto, NombreProducto, CantidadPorUnidad, PrecioUnidad from Productos";

            con.cargarGridView(gvProductos, query, "Producto");
        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Producto prod = new Producto();
            prod.IdProducto = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_idproducto")).Text);
            GestionProductos gProd = new GestionProductos();
            gProd.EliminarProducto(prod);

            gvProductos.EditIndex = -1;
            string query = "Select IdProducto, NombreProducto, CantidadPorUnidad, PrecioUnidad from Productos";

            con.cargarGridView(gvProductos, query, "Producto");
        }
    }
}