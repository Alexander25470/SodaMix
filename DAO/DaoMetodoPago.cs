using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class DaoMetodoPago
    {
        AccesoDatos ad = new AccesoDatos();
        public DataTable obtenerTablaMediosDePago()
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "Select * from METODO_PAGO";
            return ad.ObtenerTabla(query, "PRODUCTO", con);
        }
    }
}
