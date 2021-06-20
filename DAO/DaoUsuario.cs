using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;
using System.Data.SqlClient;


namespace Dao
{
    public class DaoUsuario
    {
        AccesoDatos ad = new AccesoDatos();
        public void agregarUsuario(Usuario user)
        {
           string agregarSucursal = $@"INSERT INTO USUARIO (ID_TIPO, Nombre, Apellido, DNI, Telefono, FechaNacimiento, Email, Username, Pass, Estado)VALUES('{1}', '{user.Nombre}', '{user.Apellido}', '{user.Dni}', '{user.Telefono}', '{user.FechaNacimiento}', '{user.Email}', '{user.UserName}', '{user.Pass}', '{user.Estado}')";
            SqlConnection conexion = ad.ObtenerConexion();
            ad.ejecutarConsulta(agregarSucursal, conexion);
        }

        

        public Usuario obtenerUsuario(String userName, String constraseña)
        {
            Usuario user = new Usuario();
            DataTable dt = new DataTable();
            String tabla = "USUARIO";
            String consulta = $"select * from {tabla} where Username='{userName}' and Pass='{constraseña}' and Estado='True' ";
            SqlConnection conexion = ad.ObtenerConexion();
            try
            { 
                DataRow tblUsuarios = ad.ObtenerTabla(consulta, tabla, conexion).Rows[0];
                user.Nombre = tblUsuarios["Nombre"].ToString();
                user.Apellido = tblUsuarios["Apellido"].ToString();
                user.UserName = tblUsuarios["Username"].ToString();
                user.Email = tblUsuarios["Email"].ToString();
                user.Dni = tblUsuarios["DNI"].ToString();
                user.TipoUsuario = tblUsuarios["ID_TIPO"].ToString();
                user.Telefono = tblUsuarios["Telefono"].ToString();
                user.FechaNacimiento = tblUsuarios["FechaNacimiento"].ToString();
                user.Pass = tblUsuarios["Pass"].ToString();
                user.Estado = tblUsuarios["Estado"].ToString();
                return user;
            }
            catch (Exception e)
            {
                return null;
            }
           
           
        }
    }
}
