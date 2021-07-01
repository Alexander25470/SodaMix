using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;

namespace Negocio
{
   public class NegocioVentas
    {

        DaoVentas dao = new DaoVentas();
        public DataTable obtenerTablaVentas(string id = null)
        {
            return dao.obtenerTablaVenta(id);

        }
        public int cargarVenta(Carrito carrito, string idusuario, string idMetodoPago)
        {
            return dao.agregarVenta(carrito, idusuario, idMetodoPago);

        }

        public DataTable obtenerTablaFactura(string ID = null)
        {
            return dao.obtenerTablaFactura(ID);
        }
    }
}
