using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
    public class NegocioProductos
    {
        DaoNegocios dao = new DaoNegocios();
        public bool ActualizarProducto(producto prod)
        {

            string query = "UPDATE PRODUCTO SET Nombre = '" + prod.Nombre1 + "', Descripcion = '" + prod.Descripcion1 + "',Tipo_Producto = " + prod.Tipo_Producto1 + ", Stock = " + prod.Stock1 + ", Precio_Compra =" + prod.Precio_Compra1 + ", Precio_Venta = " + prod.Precio_Venta1 + ", Img_URL = '" + prod.Img_URL1 + "',Estado = " + prod.Estado1 + " WHERE Id_Producto = " + prod.ID_Producto1;

            return dao.ActualizarProducto(query);
        }

        public bool EliminarProducto(producto prod)
        {

            string query = "Delete from PRODUCTO WHERE Id_Producto = " + prod.ID_Producto1;

            return dao.EliminarProducto(query);
        }

        public DataTable obtenerTablaProductos()
        {
            return dao.obtenerTabla("Select * from PRODUCTO", "PRODUCTO");
        }
    }
}
