using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Direccion
    {
        string _idDireccion;
        string _ID_Usuario;
        string _ID_Ciudad;
        string _Direccion;
        string _Piso;

        public string IdDireccion { get => _idDireccion; set => _idDireccion = value; }
        public string ID_Usuario { get => _ID_Usuario; set => _ID_Usuario = value; }
        public string ID_Ciudad { get => _ID_Ciudad; set => _ID_Ciudad = value; }
        public string direccion { get => _Direccion; set => _Direccion = value; }
        public string Piso { get => _Piso; set => _Piso = value; }
    }
}
