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
    public class DaoDirecciones
    {
        AccesoDatos ad = new AccesoDatos();

        public DataTable obtenerTablaProvincias()
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "Select * from PROVINCIA";
            return ad.ObtenerTabla(query, "PROVINCIA", con);
        }

        public DataTable obtenerTablaCiudades(string id)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = $"Select * from CIUDADES where ID_Provincia like '{id}'";
            return ad.ObtenerTabla(query, "CIUDADES", con);
        }

        public bool AgregarDireccion(Direccion dir)
        {
            string query = $@"INSERT INTO DIRECCIONES VALUES('{dir.ID_Usuario}','{dir.ID_Ciudad }','{dir.direccion}','{dir.Piso}')";
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }

        public DataTable obtenerTablaDirecciones(string id)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = $"Select * from DIRECCIONES where ID_Usuario like '{id}'";
            return ad.ObtenerTabla(query, "DIRECCIONES", con);
        }

    }
}
