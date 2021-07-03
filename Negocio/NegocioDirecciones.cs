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
    public class NegocioDirecciones
    {
        DaoDirecciones Dao = new Dao.DaoDirecciones();

        public DataTable obtenerTablaProvincia()
        {
            return Dao.obtenerTablaProvincias();
        }

        public DataTable obtenerTablaCiudades(string id)
        {
            return Dao.obtenerTablaCiudades(id);
        }

        public bool AgregarDireccion(Direccion dir)
        {
            return Dao.AgregarDireccion(dir);
        }

        public DataTable obtenerTablaDirecciones(string id)
        {
            return Dao.obtenerTablaDirecciones(id);
        }

    }
}
