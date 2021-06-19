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
        public DataTable obtenerTablaProductos()
        {
            SqlConnection con = ad.ObtenerConexion();
            return ad.ObtenerTabla("Select * from PRODUCTO", "PRODUCTO", con);
        }

        public bool ActualizarProducto(Producto prod)
        {
            string query = "UPDATE PRODUCTO SET Nombre = '" + prod.Nombre1 + "', Descripcion = '" + prod.Descripcion1 + "',Tipo_Producto = " + prod.Tipo_Producto1 + ", Stock = " + prod.Stock1 + ", Precio_Compra =" + prod.Precio_Compra1 + ", Precio_Venta = " + prod.Precio_Venta1 + ", Img_URL = '" + prod.Img_URL1 + "',Estado = " + prod.Estado1 + " WHERE Id_Producto = " + prod.ID_Producto1;
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public bool EliminarProducto(Producto prod)
        {
            string query = "Delete from PRODUCTO WHERE Id_Producto = " + prod.ID_Producto1;
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
        public bool AgregarProducto(Producto prod)
        {
            string query = $@"
                INSERT INTO[dbo].[PRODUCTO]
            ([Nombre]
          ,[Descripcion]
          ,[Tipo_Producto]
          ,[Stock]
          ,[Precio_Compra]
          ,[Precio_Venta]
          ,[Img_URL]
    VALUES
          (< {prod.Nombre1}, varchar(100),>
           ,< {prod.Descripcion1 }, varchar(400),>
           ,< {prod.Tipo_Producto1}, int,>
           ,< {prod.Stock1}, int,>
           ,< {prod.Precio_Compra1}, money,>
           ,< {prod.Precio_Venta1}, money,>
           ,< {prod.Img_URL1}, varchar(400),>
                ";
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }



    }
}
