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
        string _id;

        public ItemCarrito(string id)
        {
            _id = id;
            _cant = 0;
        }

        public int Cant { get => _cant; set => _cant = value; }
        public string Id { get => _id; set => _id = value; }
    }
}
