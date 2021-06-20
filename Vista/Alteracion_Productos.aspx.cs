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
            Entidades.Producto prod = new Entidades.Producto();
            
            prod.Nombre = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Nombre")).Text;
            prod.Descripcion = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Descripcion")).Text;
            prod.Tipo_Producto = Convert.ToInt32(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_TipoProducto")).Text);
            prod.Stock = Convert.ToInt32(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Stock")).Text);
            prod.Precio_Compra = Convert.ToDouble(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_PrecioCompra")).Text);
            prod.Precio_Venta = Convert.ToDouble(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_PrecioVenta")).Text);
            prod.Img_URL = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_imgURL")).Text;
            prod.Estado = Convert.ToInt32(((CheckBox)gvProductos.Rows[e.RowIndex].FindControl("chk_Estado")).Checked);
            prod.ID_Producto = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_IdProducto")).Text);

            neg.ActualizarProducto(prod);

            gvProductos.EditIndex = -1;

            cargarGridView();

        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Entidades.Producto prod = new Entidades.Producto();
            prod.ID_Producto = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_IdProducto")).Text);

            neg.EliminarProducto(prod);

            gvProductos.EditIndex = -1;

            cargarGridView();
        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_aceptar_Click(object sender, EventArgs e)
        {
            Entidades.Producto prod = new Entidades.Producto();

            prod.Nombre = txtNombre.Text;
            prod.Descripcion = txtDesc.Text;
            prod.Tipo_Producto = Convert.ToInt32(Ddl_TipoProd.SelectedValue);
            prod.Stock = Convert.ToInt32(txtStock.Text);
            prod.Precio_Compra = Convert.ToDouble(txtPrecioCompra.Text);
            prod.Precio_Venta = Convert.ToDouble(txtPrecioVenta.Text);
            prod.Img_URL = txtImgURL.Text;
            prod.Estado = 1;

            neg.AgregarProducto(prod);

            cargarGridView();

        }
    }
}