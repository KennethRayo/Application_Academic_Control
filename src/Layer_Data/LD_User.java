/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import Layer_Business.LB_User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.util.ArrayList;
import javax.swing.JOptionPane;


/**
 *
 * @author KGR
 */
public class LD_User
{
    public int eye;
    public String Response;
    public boolean dbrows = false;
    public String NamePerson;
    public String NameProfile;
    public String IDPerson;
    //LD_Connection ConnectionMySQL;
    LD_Connection ConnectionSQLSERVER;
    
    public LD_User() 
    {
        //ConnectionMySQL = new LD_Connection();
        ConnectionSQLSERVER = new LD_Connection();
    }
    
    public String CheckUser()
    { 
        try 
        {         
            //Connection acceDB = ConnectionMySQL.getConexion();
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            PreparedStatement ps = acceDB.prepareStatement("SELECT ID_Person FROM AAC_User");
            //Devolver los registros
            ResultSet rs = ps.executeQuery();  
            while (rs.next()) 
            {  
                if(rs.getRow() > 0)
                {
                    dbrows = true;
                }
                else
                {
                    Response = "User not found ! ";
                }
            }
            
            SQLWarning warning = rs.getWarnings();
            //Capture SQLWarning
            while (warning != null) 
            {                
                JOptionPane.showMessageDialog(null, 
                        "Warning Message: " + warning.getMessage()+ "\n\n" +
                        "SQLStade: " + warning.getSQLState()+ "\n\n" +
                        "Vendor Error Code: " + warning.getErrorCode() + "\n\n", "AA Control - Warning", JOptionPane.WARNING_MESSAGE);
            }
            rs.close();
            ps.close();
            acceDB.close();
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return Response;
    }
    
    public String LogIn(String email, String password)
    {
        eye = 0;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_Login(?,?)}");
            cs.setString(1, email);
            cs.setString(2, password);
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            if (rs.next()) 
            {
                eye = 100;
                //Obtener datos de usuario
                NamePerson = rs.getString("NamePerson");
                NameProfile = rs.getString("NameProfile");
                IDPerson = rs.getString("ID");
                                
                //vistaLOGIN.setDefaultCloseOperation(0);
            }
            else
            {
                Response = "Account is not Available !";  
            }
            
            SQLWarning warning = rs.getWarnings();
            //Capture SQLWarning
            while (warning != null) 
            {                
                JOptionPane.showMessageDialog(null, 
                        "Warning Message: " + warning.getMessage()+ "\n\n" +
                        "SQLStade: " + warning.getSQLState()+ "\n\n" +
                        "Vendor Error Code: " + warning.getErrorCode() + "\n\n", "AA Control - Warning", JOptionPane.WARNING_MESSAGE);
            }
            //Close
            rs.close();
            cs.close();
            acceDB.close();
            
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return Response;
    }
    
    public ArrayList<LB_User> List()
    {
        ArrayList listaProduct = new ArrayList();
        /*Importar
        -click derecho
        -Fix imports (Ctrl+Shift+l)*/
        LB_User user;//objeto (clase) de tipo persona
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListUser()}");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            //Mientras hayan registros por leer
            while(rs.next())
            {
                //instanciar al objeto de tipo persona
                user = new LB_User();
                //llenar los atributos con el objeto
                user.setID_Person(rs.getString(1));
                user.setPassword_User(rs.getString(2));
                user.setEmail_Person(rs.getString(3));
                user.setName_Person(rs.getString(4));
                user.setID_Profile(rs.getString(5));
                user.setState_Person(rs.getString(6));
                
                //Agregar a  la lista el objeto
                listaProduct.add(user);
            }
            
            SQLWarning warning = rs.getWarnings();
            //Capture SQLWarning
            while (warning != null) 
            {                
                JOptionPane.showMessageDialog(null, 
                        "Warning Message: " + warning.getMessage()+ "\n\n" +
                        "SQLStade: " + warning.getSQLState()+ "\n\n" +
                        "Vendor Error Code: " + warning.getErrorCode() + "\n\n", "AA Control - Warning", JOptionPane.WARNING_MESSAGE);
            }
            rs.close();
            cs.close();
            acceDB.close();
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return listaProduct;
    }
    
    public String InsertUser(String _ID_Person, String _Password_User, String _ID_Profile)
    {
        String rptaRegistro = null;
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_InsertUser(?,?,?)}");
            cs.setString(1, _ID_Person);
            cs.setString(2, _Password_User);
            cs.setString(3, _ID_Profile);
            
            int numFacectas = cs.executeUpdate();
            
            if (numFacectas > 0) 
            {
                IDPerson = _ID_Person;
                rptaRegistro = "Saved Successfully !";
            }
            
            SQLWarning warning = cs.getWarnings();
            //Capture SQLWarning
            while (warning != null) 
            {                
                JOptionPane.showMessageDialog(null, 
                        "Warning Message: " + warning.getMessage()+ "\n\n" +
                        "SQLStade: " + warning.getSQLState()+ "\n\n" +
                        "Vendor Error Code: " + warning.getErrorCode() + "\n\n", "AA Control - Warning", JOptionPane.WARNING_MESSAGE);
            }
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return rptaRegistro;
    }
    
    public String UpdateUser(String _ID_Person, String _Password_User, String _ID_Profile)
    {
        String rptaRegistro = null;
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_UpdateUser(?,?,?)}");
            cs.setString(1, _ID_Person);
            cs.setString(2, _Password_User);
            cs.setString(3, _ID_Profile);
            
            int numFacectas = cs.executeUpdate();
            
            if (numFacectas > 0) 
            {
                IDPerson = _ID_Person;
                rptaRegistro = "Updated Successfully !";
            }
            
            SQLWarning warning = cs.getWarnings();
            //Capture SQLWarning
            while (warning != null) 
            {                
                JOptionPane.showMessageDialog(null, 
                        "Warning Message: " + warning.getMessage()+ "\n\n" +
                        "SQLStade: " + warning.getSQLState()+ "\n\n" +
                        "Vendor Error Code: " + warning.getErrorCode() + "\n\n", "AA Control - Warning", JOptionPane.WARNING_MESSAGE);
            }
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return rptaRegistro;
    }
    
    public String DeleteUser(String _ID_Person)
    {
        String rptaRegistro = null;
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_DeleteUser(?)}");
            cs.setString(1, _ID_Person);
            
            int numFacectas = cs.executeUpdate();
            
            if (numFacectas > 0) 
            {
                IDPerson = _ID_Person;
                rptaRegistro = "Deleted Successfully !";
            }
            
            SQLWarning warning = cs.getWarnings();
            //Capture SQLWarning
            while (warning != null) 
            {                
                JOptionPane.showMessageDialog(null, 
                        "Warning Message: " + warning.getMessage()+ "\n\n" +
                        "SQLStade: " + warning.getSQLState()+ "\n\n" +
                        "Vendor Error Code: " + warning.getErrorCode() + "\n\n", "AA Control - Warning", JOptionPane.WARNING_MESSAGE);
            }
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return rptaRegistro;
    }
    
    public ArrayList<LB_User> SeacrhUser(String parameters)
    {
        ArrayList<LB_User> list = new ArrayList();
        LB_User User;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_SearchUser(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                User = new LB_User();
                User.setID_Person(rs.getString(1));
                User.setPassword_User(rs.getString(2));
                User.setEmail_Person(rs.getString(3));
                User.setName_Person(rs.getString(4));
                User.setID_Profile(rs.getString(5));
                User.setState_Person(rs.getString(6));
                //Agregar a  la lista el objeto
                list.add(User);
            }
            
            SQLWarning warning = rs.getWarnings();
            //Capture SQLWarning
            while (warning != null) 
            {                
                JOptionPane.showMessageDialog(null, 
                        "Warning Message: " + warning.getMessage()+ "\n\n" +
                        "SQLStade: " + warning.getSQLState()+ "\n\n" +
                        "Vendor Error Code: " + warning.getErrorCode() + "\n\n", "AA Control - Warning", JOptionPane.WARNING_MESSAGE);
            }
            rs.close();
            cs.close();
            acceDB.close();
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return list;
    }
}
