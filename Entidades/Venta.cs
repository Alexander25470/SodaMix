using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        string    _idVenta;
        string    _metodoPago;
        string    _precioTotal;
        string    _fechaVenta;
        string    _idUsuario ;
        string    _idDirecion;

        public string IdVenta { get => _idVenta; set => _idVenta = value; }
        public string MetodoPago { get => _metodoPago; set => _metodoPago = value; }
        public string PrecioTotal { get => _precioTotal; set => _precioTotal = value; }
        public string FechaVenta { get => _fechaVenta; set => _fechaVenta = value; }
        public string IdUsuario { get => _idUsuario; set => _idUsuario = value; }
        public string IdDirecion { get => _idDirecion; set => _idDirecion = value; }
    }
}
