using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class ItemCarrito
    {
        int _cant;
        Producto _producto;
        int _CantAgregar;

        public ItemCarrito(Producto producto)
        {
            _cant = 0;
            Producto = producto;
            CantAgregar = 0;
        }

        public int Cant { get => _cant; set => _cant = value; }
        public Producto Producto { get => _producto; set => _producto = value; }
        public int CantAgregar { get => _CantAgregar; set => _CantAgregar = value; }
    }
}
