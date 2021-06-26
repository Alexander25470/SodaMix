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

        public DataTable obtenerTablaVenta(string ID = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "select v.*,U.DNI as DNIUsuario, D.Direccion as Direccion, M.Descripcion as MetodoPago from Venta v inner join USUARIO U on U.ID_Usuario = v.ID_Usuario inner join DIRECCIONES D on D.ID_Direccion = v.ID_Direccion inner join METODO_PAGO M on M.ID_Metodo_Pago = v.ID_Metodo_Pago" + (ID == null ? "" : $" where ID_Venta Like '%{ ID }%'");
            return ad.ObtenerTabla(query, "Venta", con);
        }

        public DataTable obtenerTablaFactura(string ID = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "select * from DETALLE_VENTA" + (ID == null ? "" : $" where ID_Venta =${ID}");
            return ad.ObtenerTabla(query, "Venta", con);
        }

        public int agregarVenta(Carrito carrito, string idusuario)
        {
            int idVenta = -1;
            SqlConnection conexion = ad.ObtenerConexion();
            SqlCommand cmd = new SqlCommand("SP_AGREGAR_VENTA", conexion);
            double total = 0;
            foreach (ItemCarrito i in carrito._articulos)
            {
                total += i.Cant * i.Producto.Precio_Venta;
            }
            cmd.Parameters.Add("@IDMETODOPAGO", SqlDbType.Int).Value = 0;
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
    }
}