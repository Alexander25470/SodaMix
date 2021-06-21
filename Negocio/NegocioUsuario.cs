using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;
using System.Data.SqlClient;

namespace Negocio
{
    public class NegocioUsuario
    {
        DaoUsuario dao = new DaoUsuario();
        public void registrarUsuario(Usuario user)
        {
            user.Estado = "1";
            user.TipoUsuario = "1";
            dao.agregarUsuario(user);

        }

        
        public Usuario login(String userName, String pass)
        {
            return dao.obtenerUsuario(userName, pass);
        }

        public DataTable obtenerTablaUsuario()
        {
            return dao.obtenerTablaUsuarios();

        }

        public DataTable obtenerTablaUsuarioBusqueda(string id)
        {
            return dao.obtenerTablaUsuarios(id);

        }

        public bool actualizarUsuario(Usuario usuario)
        {
            return dao.ActualizarUsuario(usuario);

        }
    }
}
