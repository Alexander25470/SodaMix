using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    class ItemCarrito
    {
        int _cant;
        int _id;

        public ItemCarrito()
        {
            _cant = 0;
        }

        public int Cant { get => _cant; set => _cant = value; }
        public int Id { get => _id; set => _id = value; }
    }
}
