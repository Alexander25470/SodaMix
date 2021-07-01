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
            SqlConnection conexion = ad.ObtenerConexion();
            SqlCommand cmd = new SqlCommand("SP_RegistrarUsuario", conexion);
            cmd.Parameters.Add("@nombre", SqlDbType.VarChar, 255).Value = user.Nombre;
            cmd.Parameters.Add("@apellido", SqlDbType.VarChar, 255).Value = user.Apellido;
            cmd.Parameters.Add("@dni", SqlDbType.VarChar, 20).Value = user.Dni;
            cmd.Parameters.Add("@telefono", SqlDbType.VarChar, 20).Value = user.Telefono;
            cmd.Parameters.Add("@fechaNacimiento", SqlDbType.Date).Value = user.FechaNacimiento;
            cmd.Parameters.Add("@email", SqlDbType.VarChar, 30).Value = user.Email;
            cmd.Parameters.Add("@username", SqlDbType.VarChar, 30).Value = user.UserName;
            cmd.Parameters.Add("@pass", SqlDbType.VarChar, 30).Value = user.Pass;
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.ExecuteNonQuery();
            conexion.Close();
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
                user.Id= tblUsuarios["ID_Usuario"].ToString();
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
            string query = "select u.*, t.NOMBRE as TipoUsuario from Usuario u inner join TIPO_USER t on t.ID_TIPO = u.ID_TIPO" + (dni == null ? "" : $" where DNI Like '%{ dni }%'");
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