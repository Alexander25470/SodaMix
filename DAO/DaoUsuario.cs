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

        public DataTable obtenerTablaUsuarios(string dni = null)
        {
            SqlConnection con = ad.ObtenerConexion();
            string query = "select * from Usuario" + (dni == null ? "" : $" where DNI Like '%{ dni }%'");
            return ad.ObtenerTabla(query, "Usuario", con);
        }

        public bool ActualizarUsuario(Usuario usuario)
        {
            string query = $"UPDATE [USUARIO] SET [ID_TIPO] = '{usuario.TipoUsuario}',[Nombre] = '{usuario.Nombre}',[Apellido] = '{usuario.Apellido}',[DNI] = '{usuario.Dni}',[Telefono] = '{usuario.Telefono}',[FechaNacimiento] = '{usuario.FechaNacimiento}',[Email] = '{usuario.Email}',[Username] = '{usuario.UserName}',[Pass] = '{usuario.Pass}',[Estado] = '{usuario.Estado}' WHERE ID_Usuario = '{usuario.Id}'";
            SqlConnection con = ad.ObtenerConexion();
            int FilasInsertadas = ad.ejecutarConsulta(query, con);
            if (FilasInsertadas == 1)
                return true;
            else
                return false;
        }
    }

}