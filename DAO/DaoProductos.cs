using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class DaoProductos
    {
        AccesoDatos ad = new AccesoDatos();
        public DataTable obtenerTablaProductos(string nombreProducto = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "Select p.*, tp.nombre as nombreTipoProducto from PRODUCTO p inner join tipo_producto tp on p.tipo_producto = tp.id_tipoproducto "+ (nombreProducto == null ?"":$" where p.Nombre Like '%{nombreProducto}%' or tp.Nombre Like '%{nombreProducto}%'");
            return ad.ObtenerTabla(query, "PRODUCTO", con);
        }
        public DataTable obtenerTablaProductosInicio(string nombreProducto = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "Select p.*, tp.nombre as nombreTipoProducto from PRODUCTO p inner join tipo_producto tp on p.tipo_producto = tp.id_tipoproducto where p.Estado = 1" + (nombreProducto == null ? "" : $" and (p.Nombre Like '%{nombreProducto}%' or tp.Nombre Like '%{nombreProducto}%')");
            return ad.ObtenerTabla(query, "PRODUCTO", con);
        }

        public bool ActualizarProducto(Producto prod)
        {
            string precioCompra = prod.Precio_Compra.ToString().Replace(',', '.');
            string precioVenta = prod.Precio_Venta.ToString().Replace(',', '.');
            string query = "UPDATE PRODUCTO SET Nombre = '" + prod.Nombre + "', Descripcion = '" + prod.Descripcion + "',Tipo_Producto = " + prod.Tipo_Producto + ", Stock = " + prod.Stock + ", Precio_Compra =" + precioCompra + ", Precio_Venta = " + precioVenta + ", Img_URL = '" + prod.Img_URL + "',Estado = " + prod.Estado + " WHERE Id_Producto = " + prod.ID_Producto;
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public bool EliminarProducto(Producto prod)
        {
            string query = "Delete from PRODUCTO WHERE Id_Producto = " + prod.ID_Producto;
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
        public bool AgregarProducto(Producto prod)
        {
            string precioCompra = prod.Precio_Compra.ToString().Replace(',', '.');
            string precioVenta = prod.Precio_Venta.ToString().Replace(',', '.');
            string query = $@"INSERT INTO PRODUCTO(Nombre,Descripcion,Tipo_Producto,Stock,Precio_Compra,Precio_Venta,Img_URL)VALUES('{prod.Nombre}','{prod.Descripcion }','{prod.Tipo_Producto}','{prod.Stock}','{precioCompra}','{precioVenta}','{prod.Img_URL}')";
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
        public Producto obtenerProducto(int id)
        {
            Usuario user = new Usuario();
            Producto prod = new Producto();
            String tabla = "PRODUCTO";
            String consulta = $"select * from {tabla} where ID_Producto='{id}' and Estado='True' ";
            SqlConnection conexion = ad.ObtenerConexion();
            try
            {
                DataRow tblUsuarios = ad.ObtenerTabla(consulta, tabla, conexion).Rows[0];
                prod.ID_Producto= Convert.ToInt32(tblUsuarios["ID_Producto"]);
                prod.Nombre = tblUsuarios["Nombre"].ToString();
                prod.Descripcion = tblUsuarios["Descripcion"].ToString();
                prod.Tipo_Producto = Convert.ToInt32(tblUsuarios["Tipo_Producto"]);
                prod.Stock = Convert.ToInt32(tblUsuarios["Stock"]);
                prod.Precio_Compra = Convert.ToDouble(tblUsuarios["Precio_Compra"]);
                prod.Precio_Venta = Convert.ToDouble(tblUsuarios["Precio_venta"]);
                prod.Img_URL = tblUsuarios["Img_URL"].ToString();
                prod.Estado = Convert.ToInt32(tblUsuarios["Estado"]);
                return prod;
            }
            catch (Exception e)
            {
                return null;
            }
        }
    }
}
