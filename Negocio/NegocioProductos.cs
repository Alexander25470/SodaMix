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
        DaoProductos dao = new DaoProductos();
        public bool ActualizarProducto(Producto prod)
        {
            return dao.ActualizarProducto(prod);
        }

        public bool EliminarProducto(Producto prod)
        {
            return dao.EliminarProducto(prod);
        }

        public DataTable obtenerTablaProductos(string idProducto = null)
        {
            return dao.obtenerTablaProductos(idProducto);
        }

        public bool AgregarProducto(Producto prod)
        {
            return dao.AgregarProducto(prod);
        }

    }
}
