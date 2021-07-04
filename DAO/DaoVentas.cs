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

        public DataTable obtenerTablaVenta(string DNI = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "select v.*,U.DNI as DNIUsuario, D.Direccion as Direccion, M.Descripcion as MetodoPago from Venta v inner join USUARIO U on U.ID_Usuario = v.ID_Usuario inner join DIRECCIONES D on D.ID_Direccion = v.ID_Direccion inner join METODO_PAGO M on M.ID_Metodo_Pago = v.ID_Metodo_Pago" + (DNI == null ? "" : $" where U.DNI Like '%{ DNI }%' or ID_Venta Like '%{ DNI }%'");
            return ad.ObtenerTabla(query, "Venta", con);
        }

        public DataTable obtenerTablaFactura(string ID = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "select p.Nombre as [Nombre Producto], DV.Cantidad, DV.Precio from DETALLE_VENTA as DV inner join Producto as p on p.ID_Producto = DV.ID_Producto" + (ID == null ? "" : $" where DV.ID_Venta =${ID}");
            return ad.ObtenerTabla(query, "Venta", con);
        }

        public DataTable obtenerTEstadisticaVenta(string ID = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query;
            if (ID != null && ID != "")
            {
                query = $"exec SP_EstadisticasProducto {ID}";
            }
            else
            {
                query = "select * from VW_EstadisticasProductos";
            }
           
            return ad.ObtenerTabla(query, "VW_EstadisticasProductos", con);
        }

        public DataTable obtenerTEstadisticaFechas(string FechaInicio, string FechaFin)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = $"exec SP_EstadisticasEntreFecha '{FechaInicio}', '{FechaFin}'";
            return ad.ObtenerTabla(query, "Venta", con);
        }

        public int agregarVenta(Carrito carrito, string idusuario, string idMetodoPago)
        {
            int idVenta = -1;
            SqlConnection conexion = ad.ObtenerConexion();
            SqlCommand cmd = new SqlCommand("SP_AGREGAR_VENTA", conexion);
            double total = 0;
            foreach (ItemCarrito i in carrito._articulos)
            {
                total += i.Cant * i.Producto.Precio_Venta;
            }
            cmd.Parameters.Add("@IDMETODOPAGO", SqlDbType.Int).Value = idMetodoPago;
            cmd.Parameters.Add("@PRECIOTOTAL", SqlDbType.Money).Value = total;
            cmd.Parameters.Add("@IDUSUARIO", SqlDbType.Int).Value = idusuario;
            SqlParameter parm = new SqlParameter("@IDVENTA", SqlDbType.Int);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            conexion.Close();
            idVenta = Convert.ToInt32(cmd.Parameters["@IDVENTA"].Value);
            foreach (ItemCarrito ic in carrito._articulos)
            {
                agregarDetalleVenta(ic, idVenta);
            }
            return idVenta;
        }
        public void agregarDetalleVenta(ItemCarrito item, int idVenta)
        {
            SqlConnection conexion = ad.ObtenerConexion();
            SqlCommand cmd = new SqlCommand("SP_AGREGAR_DETALLEVENTA", conexion);
            cmd.Parameters.Add("@IDPRODUCTO", SqlDbType.Int).Value = item.Producto.ID_Producto;
            cmd.Parameters.Add("@IDVENTA", SqlDbType.Money).Value = idVenta;
            cmd.Parameters.Add("@CANTIDAD", SqlDbType.Money).Value = item.Cant;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            conexion.Close();
        }

        public double obtenerGananciasVentasEntrefechas(string FechaInicio, string FechaFin)
        {
            double Ganancias = -1;
            SqlConnection conexion = ad.ObtenerConexion();
            SqlCommand cmd = new SqlCommand("SP_GANANCIA_ENTRE_FECHAS", conexion);
            cmd.Parameters.Add("@fechaInicio", SqlDbType.Date).Value = FechaInicio;
            cmd.Parameters.Add("@fechaFin", SqlDbType.Date).Value = FechaFin;
            SqlParameter parm = new SqlParameter("@ganancia", SqlDbType.Money);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            conexion.Close();
            Ganancias = Convert.ToInt32(cmd.Parameters["@ganancia"].Value);
            return Ganancias;
        }

        public double obtenerGanancias()
        {
            double Ganancias = -1;
            SqlConnection conexion = ad.ObtenerConexion();
            SqlCommand cmd = new SqlCommand("SP_GANANCIA_TOTAL", conexion);
            SqlParameter parm = new SqlParameter("@ganancia", SqlDbType.Money);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            conexion.Close();
            Ganancias = Convert.ToInt32(cmd.Parameters["@ganancia"].Value);
            return Ganancias;
        }
    }
}