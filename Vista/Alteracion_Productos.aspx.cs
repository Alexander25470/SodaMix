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
        
        protected void cargarGridViewProductos()
        {
            gvProductos.DataSource = neg.obtenerTablaProductos();
            gvProductos.DataBind();
        }

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

                cargarGridViewProductos();
            }
        }

        protected void gvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
          

            gvProductos.PageIndex = e.NewPageIndex;

            cargarGridViewProductos();
        }

        protected void gvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
           

            gvProductos.EditIndex = e.NewEditIndex;

            cargarGridViewProductos();
        }

        protected void gvProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            
            gvProductos.EditIndex = -1;

            cargarGridViewProductos();
        }

        protected void gvProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Entidades.Producto prod = new Entidades.Producto();
            
            prod.Nombre = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Nombre")).Text;
            prod.Descripcion = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Descripcion")).Text;
            prod.Tipo_Producto = Convert.ToInt32(((DropDownList)gvProductos.Rows[e.RowIndex].FindControl("Ddl_EditTipoProd")).SelectedValue);
            prod.Stock = Convert.ToInt32(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_Stock")).Text);
            prod.Precio_Compra = Convert.ToDouble(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_PrecioCompra")).Text);
            prod.Precio_Venta = Convert.ToDouble(((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_PrecioVenta")).Text);
            prod.Img_URL = ((TextBox)gvProductos.Rows[e.RowIndex].FindControl("txt_imgURL")).Text;
            prod.Estado = Convert.ToInt32(((CheckBox)gvProductos.Rows[e.RowIndex].FindControl("chk_Estado")).Checked);
            prod.ID_Producto = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_IdProducto")).Text);

            neg.ActualizarProducto(prod);

            gvProductos.EditIndex = -1;

            cargarGridViewProductos();

        }

        protected void gvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Entidades.Producto prod = new Entidades.Producto();
            prod.ID_Producto = Convert.ToInt32(((Label)gvProductos.Rows[e.RowIndex].FindControl("lbl_IdProducto")).Text);

            neg.EliminarProducto(prod);

            gvProductos.EditIndex = -1;

            cargarGridViewProductos();
        }

        protected void btn_aceptar_Click(object sender, EventArgs e)
        {
            Entidades.Producto prod = new Entidades.Producto();
            if(txtNombre.Text =="" ||
                txtDesc.Text == "" ||
                txtStock.Text == "" ||
                txtPrecioCompra.Text == "" ||
                txtPrecioVenta.Text == "" ||
                txtImgURL.Text == ""
                ){
                lblErrorAgregarProducto.Text = "Campos vacios";
                return;
            }

            try
            {
                prod.Tipo_Producto = Convert.ToInt32(Ddl_TipoProd.SelectedValue);
                prod.Stock = Convert.ToInt32(txtStock.Text);
                prod.Precio_Compra = Convert.ToDouble(txtPrecioCompra.Text);
                prod.Precio_Venta = Convert.ToDouble(txtPrecioVenta.Text);
            }
            catch
            {
                lblErrorAgregarProducto.Text = "Algun campo numerico tiene letras";
                return;
            }
            prod.Nombre = txtNombre.Text;
            prod.Descripcion = txtDesc.Text;
            
            prod.Img_URL = txtImgURL.Text;
            prod.Estado = 1;

            neg.AgregarProducto(prod);

            cargarGridViewProductos();

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            gvProductos.DataSource = neg.obtenerTablaProductos(tbx_buscarProducto.Text);
            gvProductos.DataBind();
        }

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministrarClientes.aspx");
        }

        protected void btnInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }
    }
}