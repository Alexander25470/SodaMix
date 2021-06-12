using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;


namespace Dao
{
    class AccesoDatos
    {
        String BDSodamix = "Data Source=localhost\\sqlexpress;Initial Catalog = SODAMIX; Integrated Security = True";

        //ESTABLECE LA CONEXION CON LA BD.
        public SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(BDSodamix);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        //MODIFICA FILAS Y RETORNA LA CANTIDAD DE FILAS MODIFICADAS
        public int ejecutarConsulta(String consulta, SqlConnection conexion)
        {
            SqlCommand comando = new SqlCommand(consulta, conexion);

            int filas = comando.ExecuteNonQuery();

            conexion.Close();

            return filas;
        }

        //VERIFICA SI EXISTE UN DATO.
        public Boolean existe(String consulta)
        {
            Boolean estado = false;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, Conexion);
            SqlDataReader datos = cmd.ExecuteReader();
            if (datos.Read())
            {
                estado = true;
            }
            return estado;
        }

        //
        private SqlDataAdapter ObtenerAdaptador(string consulta, SqlConnection cn)
        {
            SqlDataAdapter adaptador;
            try
            {
                adaptador = new SqlDataAdapter(consulta, cn);
                return adaptador;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        //
        public DataTable ObtenerTabla(string consulta, string tabla, SqlConnection con)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adapt = ObtenerAdaptador(consulta, con);
            adapt.Fill(ds, tabla);
            con.Close();
            return ds.Tables[tabla];
        }

    }
}
