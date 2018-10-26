/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Claudio-PC
 */
public class Conexion {
    
    
    private static Connection cnx = null;

    public static Connection obtener() throws ClassNotFoundException, SQLException {
        if (cnx == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");//(Services-Nueva conexion-Mysql Driver)click derecho en la conexion de mysql-> propiedades -> Driver class
                cnx = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/epe1", "root", "root"); //si sale error, agregar (Connection)

            } catch (SQLException ex) {
                throw new SQLException(ex);
            } catch (ClassNotFoundException ex) {
                throw new ClassCastException(ex.getMessage());
            }
        }

        return cnx;
    }
    
     public static void cerrar() throws SQLException {

        if (cnx != null) {
            cnx.close();
        }
    }
     
     
     public void nuevoUsuario(String usuario, String password, String nombres, String apellidos, String sexo, String direccion, String email) throws ClassNotFoundException, SQLException{
        String query="INSERT INTO Usuario(usuario,password,nombres,apellidos,sexo,direccion,email) values('"+usuario+"','"+password+"','"+nombres+"','"+apellidos+"','"+sexo+"','"+direccion+"','"+email+"')";
        Statement st= obtener().createStatement(); //agregar los throws y java.Statement //Abre conexion
        st.executeUpdate(query); //Ejecuta la query sin retorno
        cerrar(); //cierra conexion
        cnx=null;// limpia la conexion
    }
    
    public ArrayList<Usuarios> VerificarUsuarioPassword() throws ClassNotFoundException, SQLException{
        ArrayList<Usuarios> user = new ArrayList<>(); //se crea el arraylist
        
        String query="SELECT * FROM Usuario";
        Statement st= obtener().createStatement();
        ResultSet rs= st.executeQuery(query); //ejecuta query con retorno
        while(rs.next()){ //pasa linea por linea que encuentra resultado
            Usuarios u = new Usuarios(); 
            u.setUsuario(rs.getString("usuario"));
            u.setPassword(rs.getString("password"));
            user.add(u); //se agrega a la lista
        }
        cerrar();
        cnx=null;
        return user;
    }
    
    public ArrayList<Usuarios> VerificarUsuariosEmail() throws ClassNotFoundException, SQLException{
        ArrayList<Usuarios> user = new ArrayList<>(); //se crea el arraylist
        
        String query="SELECT * FROM Usuario";
        Statement st= obtener().createStatement();
        ResultSet rs= st.executeQuery(query); //ejecuta query con retorno
        while(rs.next()){ //pasa linea por linea que encuentra resultado
            Usuarios u = new Usuarios(); 
            u.setUsuario(rs.getString("usuario"));
            u.setEmail(rs.getString("email"));
            user.add(u); //se agrega a la lista
        }
        cerrar();
        cnx=null;
        return user;
    }

  public ArrayList<Usuarios> verUsuarios() throws ClassNotFoundException, SQLException{
        ArrayList<Usuarios> user = new ArrayList<>(); //se crea el arraylist
        
        String query="SELECT * FROM Usuario";
        Statement st= obtener().createStatement();
        ResultSet rs= st.executeQuery(query); //ejecuta query con retorno
        while(rs.next()){ //pasa linea por linea que encuentra resultado
            Usuarios u = new Usuarios(); 
            
            u.setUsuario(rs.getString("usuario"));
            u.setPassword(rs.getString("password"));
            u.setNombres(rs.getString("nombres"));
            u.setApellidos(rs.getString("apellidos"));
            u.setSexo(rs.getString("sexo"));
            u.setDireccion(rs.getString("direccion"));
            u.setEmail(rs.getString("email"));
            u.setId(rs.getInt("idUsuario"));
            
            user.add(u); //se agrega a la lista
        }
        cerrar();
        cnx=null;
        return user;
    }  
    
   public void editarUsuario(String id,String usuario, String password, String nombres, String apellidos, String sexo, String direccion, String email) throws ClassNotFoundException, SQLException{
        String query="UPDATE Usuario SET usuario='"+usuario+"', password='"+password+"',nombres='"+nombres+"',apellidos='"+apellidos+"',sexo='"+sexo+"',direccion='"+direccion+"', email='"+email+"' WHERE idUsuario="+id+"";
        Statement st= obtener().createStatement(); //agregar los throws y java.Statement //Abre conexion
        st.executeUpdate(query); //Ejecuta la query sin retorno
        cerrar(); //cierra conexion
        cnx=null;// limpia la conexion
    }
   
   
   public ArrayList<Usuarios> verUsuarioById(String id) throws ClassNotFoundException, SQLException{
        ArrayList<Usuarios> user = new ArrayList<>(); //se crea el arraylist
        
        String query="SELECT * FROM Usuario WHERE idUsuario="+id+"";
        Statement st= obtener().createStatement();
        ResultSet rs= st.executeQuery(query); //ejecuta query con retorno
        while(rs.next()){ //pasa linea por linea que encuentra resultado
            Usuarios u = new Usuarios(); 
            u.setUsuario(rs.getString("usuario"));
            u.setPassword(rs.getString("password"));
            u.setNombres(rs.getString("nombres"));
            u.setApellidos(rs.getString("apellidos"));
            u.setSexo(rs.getString("sexo"));
            u.setDireccion(rs.getString("direccion"));
            u.setEmail(rs.getString("email"));
            u.setId(rs.getInt("idUsuario"));
            user.add(u); //se agrega a la lista
        }
        cerrar();
        cnx=null;
        return user;
    }
      
   
}
