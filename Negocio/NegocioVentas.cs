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
        public DataTable obtenerTablaVentas()
        {
            return dao.obtenerTablaVenta();

        }

    }
}
