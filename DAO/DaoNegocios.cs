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
    public class DaoNegocios
    {
        AccesoDatos ad = new AccesoDatos();
        public DataTable obtenerTabla(string consulta, string tabla)
        {
            SqlConnection con = ad.ObtenerConexion();
            return ad.ObtenerTabla(consulta, tabla, con);
        }

        public bool ActualizarProducto(string query)
        {
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public bool EliminarProducto(string query)
        {
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }
}
