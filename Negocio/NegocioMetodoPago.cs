using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;

namespace Negocio
{
    public class NegocioMetodoPago
    {
        DaoMetodoPago dao = new DaoMetodoPago();
        public DataTable obtenerTablaMediosDePago()
        {
            return dao.obtenerTablaMediosDePago();
        }
    }
}
