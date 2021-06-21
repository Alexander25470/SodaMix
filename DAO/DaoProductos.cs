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
        public DataTable obtenerTablaProductos(string id = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "Select p.*, tp.nombre as nombreTipoProducto from PRODUCTO p inner join tipo_producto tp on p.tipo_producto = tp.id_tipoproducto "+ (id == null ?"":$" where p.Nombre = '{id}' ");
            return ad.ObtenerTabla(query, "PRODUCTO", con);
        }

        public bool ActualizarProducto(Producto prod)
        {
            string query = "UPDATE PRODUCTO SET Nombre = '" + prod.Nombre + "', Descripcion = '" + prod.Descripcion + "',Tipo_Producto = " + prod.Tipo_Producto + ", Stock = " + prod.Stock + ", Precio_Compra =" + prod.Precio_Compra + ", Precio_Venta = " + prod.Precio_Venta + ", Img_URL = '" + prod.Img_URL + "',Estado = " + prod.Estado + " WHERE Id_Producto = " + prod.ID_Producto;
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
            string query = $@"INSERT INTO PRODUCTO(Nombre,Descripcion,Tipo_Producto,Stock,Precio_Compra,Precio_Venta,Img_URL)VALUES('{prod.Nombre}','{prod.Descripcion }','{prod.Tipo_Producto}','{prod.Stock}','{prod.Precio_Compra}','{prod.Precio_Venta}','{prod.Img_URL}')";
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }



    }
}
