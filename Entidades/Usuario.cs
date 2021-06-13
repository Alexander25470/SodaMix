using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private String _nombre;
        private String _apellido;
        private String _user;
        private String _mail;
        private String _dni;
        private String _tipoUsuario;
        private String _telefono;
        private String _fechaNacimiento;
        public Usuario()
        {
        }

        public string Nombre { get => _nombre; set => _nombre = value; }
        public string Apellido { get => _apellido; set => _apellido = value; }
        public string User { get => _user; set => _user = value; }
        public string Mail { get => _mail; set => _mail = value; }
        public string Dni { get => _dni; set => _dni = value; }
        public string TipoUsuario { get => _tipoUsuario; set => _tipoUsuario = value; }
        public string Telefono { get => _telefono; set => _telefono = value; }
        public string FechaNacimiento { get => _fechaNacimiento; set => _fechaNacimiento = value; }
    }
    

}
