using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Dao
{
   public class DaoVentas
    {
        AccesoDatos ad = new AccesoDatos();

        public Venta obtenerVentas()
        {
           Venta venta = new Venta();
            DataTable dt = new DataTable();
            String tabla = "Venta";
            String consulta = $"select * from {tabla}";
            SqlConnection conexion = ad.ObtenerConexion();
            try
            {
                DataRow tblUsuarios = ad.ObtenerTabla(consulta, tabla, conexion).Rows[0];
                venta.IdVenta = tblUsuarios["id_venta"].ToString();
                venta.MetodoPago = tblUsuarios["id_metodo_pago"].ToString();
                venta.PrecioTotal = tblUsuarios["Precio_total"].ToString();
                venta.FechaVenta = tblUsuarios["Fecha_venta"].ToString();
                venta.IdUsuario = tblUsuarios["id_usuario"].ToString();
                venta.IdDirecion = tblUsuarios["id_direcion"].ToString();
                
                return venta;
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public DataTable obtenerTablaUsuarios()
        {
            throw new NotImplementedException();
        }

        public DataTable obtenerTablaVenta()
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "select * from Venta";
            return ad.ObtenerTabla(query, "Venta", con);

        }
    }
}
