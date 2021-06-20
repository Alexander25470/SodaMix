using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
		int _ID_Producto;
		String _Nombre;
		String _Descripcion;
		int _Tipo_Producto;
		int _Stock;
		double _Precio_Compra;
		double _Precio_Venta;
		String _Img_URL;
		int _Estado;

        public int ID_Producto { get => _ID_Producto; set => _ID_Producto = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Descripcion { get => _Descripcion; set => _Descripcion = value; }
        public int Tipo_Producto { get => _Tipo_Producto; set => _Tipo_Producto = value; }
        public int Stock { get => _Stock; set => _Stock = value; }
        public double Precio_Compra { get => _Precio_Compra; set => _Precio_Compra = value; }
        public double Precio_Venta { get => _Precio_Venta; set => _Precio_Venta = value; }
        public string Img_URL { get => _Img_URL; set => _Img_URL = value; }
        public int Estado { get => _Estado; set => _Estado = value; }
    }
}
