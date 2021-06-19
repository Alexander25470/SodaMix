using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Producto
    {
		int ID_Producto;
		String Nombre;
		String Descripcion;
		int Tipo_Producto;
		int Stock;
		double Precio_Compra;
		double Precio_Venta;
		String Img_URL;
		int Estado;

        public int ID_Producto1 { get => ID_Producto; set => ID_Producto = value; }
        public string Nombre1 { get => Nombre; set => Nombre = value; }
        public string Descripcion1 { get => Descripcion; set => Descripcion = value; }
        public int Tipo_Producto1 { get => Tipo_Producto; set => Tipo_Producto = value; }
        public int Stock1 { get => Stock; set => Stock = value; }
        public double Precio_Compra1 { get => Precio_Compra; set => Precio_Compra = value; }
        public double Precio_Venta1 { get => Precio_Venta; set => Precio_Venta = value; }
        public string Img_URL1 { get => Img_URL; set => Img_URL = value; }
        public int Estado1 { get => Estado; set => Estado = value; }
    }
}
