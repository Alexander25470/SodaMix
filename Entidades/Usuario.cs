using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private String _id;
        private String _nombre;
        private String _apellido;
        private String _userName;
        private String _email;
        private String _dni;
        private String _tipoUsuario;
        private String _telefono;
        private String _fechaNacimiento;
        private String _pass;
        private String _estado;

        public Usuario()
        {
        }

        public string Id { get => _id; set => _id = value; }
        public string Nombre { get => _nombre; set => _nombre = value; }
        public string Apellido { get => _apellido; set => _apellido = value; }
        public string UserName { get => _userName; set => _userName = value; }
        public string Email { get => _email; set => _email = value; }
        public string Dni { get => _dni; set => _dni = value; }
        public string TipoUsuario { get => _tipoUsuario; set => _tipoUsuario = value; }
        public string Telefono { get => _telefono; set => _telefono = value; }
        public string FechaNacimiento { get => _fechaNacimiento; set => _fechaNacimiento = value; }
        public string Pass { get => _pass; set => _pass = value; }
        public string Estado { get => _estado; set => _estado = value; }
    }
}
