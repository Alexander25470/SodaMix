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
    public partial class CargarProductos : System.Web.UI.Page
    {
        NegocioProductos neg = new NegocioProductos();

        protected void cargarGridView()
        {
            gvProductos.DataSource = neg.obtenerTablaProductos();
            gvProductos.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarGridView();
            }
        }

        protected void gvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
          

            gvProductos.PageIndex = e.NewPageIndex;

            cargarGridView();
        }

        protected void gvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
           

            gvProductos.EditIndex = e.NewEditIndex;

            cargarGridView();
        }

        protected void gvProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            
            gvProductos.EditIndex = -1;

            cargarGridView();
        }

        protected void gvProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            producto prod = new producto();
            
            prod.Nombre1 = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Nombre")).Text;
            prod.Descripcion1 = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Descripcion")).Text;
            prod.Tipo_Producto1 = Convert.ToInt32(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_TipoProducto")).Text);
            prod.Stock1 = Convert.ToInt32(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Stock")).Text);
            prod.Precio_Compra1 = Convert.ToDouble(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_PrecioCompra")).Text);
            prod.Precio_Venta1 = Convert.ToDouble(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_PrecioVenta")).Text);
            prod.Img_URL1 = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_imgURL")).Text;
            prod.Estado1 = Convert.ToInt32(((CheckBox)gvProductos.Rows[e.RowIndex].FindControl("chk_Estado")).Checked);
            prod.ID_Producto1 = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_IdProducto")).Text);

            neg.ActualizarProducto(prod);

            gvProductos.EditIndex = -1;

            cargarGridView();

        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            producto prod = new producto();
            prod.ID_Producto1 = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_IdProducto")).Text);

            neg.EliminarProducto(prod);

            gvProductos.EditIndex = -1;

            cargarGridView();
        }

       
    }
}