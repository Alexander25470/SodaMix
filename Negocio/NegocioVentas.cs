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
        public DataTable obtenerTablaVentas(string DNI = null)
        {
            return dao.obtenerTablaVenta(DNI);

        }
        public int cargarVenta(Carrito carrito, string idusuario, string idMetodoPago)
        {
            return dao.agregarVenta(carrito, idusuario, idMetodoPago);

        }

        public DataTable obtenerTablaFactura(string ID = null)
        {
            return dao.obtenerTablaFactura(ID);
        }

        public DataTable obtenerEstadisticaVenta(string ID = null)
        {
            return dao.obtenerTEstadisticaVenta(ID);
        }

        public DataTable obtenerEstadisticaFechas(string FechaInicio, string FechaFin)
        {
            return dao.obtenerTEstadisticaFechas(FechaInicio,FechaFin);
        }

        public double obtenerGanancias(string FechaInicio, string FechaFin)
        {
            return dao.obtenerGananciasVentasEntrefechas(FechaInicio, FechaFin);
        }

        public double obtenerGananciasTotales()
        {
            return dao.obtenerGanancias();
        }
    }
}
