/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import Layer_Business.LB_ClassRoom;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

/**
 *
 * @author KGR
 */
public class LD_ClassRoom {
    
    public int eye;
    public String Response;
    public boolean dbrows = false;
    LD_Connection ConnectionSQLSERVER;
    
    public LD_ClassRoom() 
    {
        ConnectionSQLSERVER = new LD_Connection();
    }
    
    public void ListClassRoom(JComboBox cmbCombo)
    {
        DefaultComboBoxModel value;
        LB_ClassRoom ClassRoom;//objeto (clase) de tipo persona
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            PreparedStatement ps = acceDB.prepareStatement("SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, \n" +
            "Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,\n" +
            "State_ClassRoom AS State FROM AAC_ClassRoom WHERE State_ClassRoom = 'Habilitado'");
            //Devolver los registros
            ResultSet rs = ps.executeQuery();  
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                ClassRoom = new LB_ClassRoom();
                ClassRoom.setID_ClassRom(rs.getString("ID"));
                ClassRoom.setDescription_ClassRoom(rs.getString("Description"));
                ClassRoom.setLocation_ClassRoom(rs.getString("Location"));
                ClassRoom.setCapacity_ClassRoom(rs.getInt("Capacity"));
                ClassRoom.setState_ClassRoom(rs.getString("State"));
                value.addElement(ClassRoom);
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
    }
    
    public ArrayList<LB_ClassRoom> List()
    {
        ArrayList listCR = new ArrayList();
        /*Importar
        -click derecho
        -Fix imports (Ctrl+Shift+l)*/
        LB_ClassRoom ClassRoom;//objeto (clase) de tipo persona
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            PreparedStatement ps = acceDB.prepareStatement("SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, \n" +
            "Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,\n" +
            "State_ClassRoom AS State FROM AAC_ClassRoom");
            
            //Devolver los registros
            ResultSet rs = ps.executeQuery();
            //Mientras hayan registros por leer
            while(rs.next())
            {
                //instanciar al objeto de tipo persona
                ClassRoom = new LB_ClassRoom();
                //llenar los atributos con el objeto
                ClassRoom.setID_ClassRom(rs.getString(1));
                ClassRoom.setDescription_ClassRoom(rs.getString(2));
                ClassRoom.setLocation_ClassRoom(rs.getString(3));
                ClassRoom.setCapacity_ClassRoom(rs.getInt(4));
                ClassRoom.setState_ClassRoom(rs.getString(5));
                
                //Agregar a  la lista el objeto
                listCR.add(ClassRoom);
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
        return listCR;
    }
    
    public String Insert(String _ID_ClassRom, String _Description_ClassRoom,
            String _Location_ClassRoom, int _Capacity_ClassRoom, 
            String _ID_BranchOffice, String _State_ClassRoom)
    {
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_InsertClassRoom(?,?,?,?,?,?)}");
            cs.setString(1, _ID_ClassRom);
            cs.setString(2, _Description_ClassRoom);
            cs.setString(3, _Location_ClassRoom);
            cs.setInt(4, _Capacity_ClassRoom);
            cs.setString(5, _ID_BranchOffice);
            cs.setString(6, _State_ClassRoom);
            
            int numFacectas = cs.executeUpdate();
            
            if (numFacectas > 0) 
            {
                Response = "Saved Successfully !";
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
        return Response;
    }
    
    public String Update(String _ID_ClassRom, String _Description_ClassRoom,
            String _Location_ClassRoom, int _Capacity_ClassRoom, 
            String _ID_BranchOffice, String _State_ClassRoom)
    {
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_UpdateClassRoom(?,?,?,?,?,?)}");
            cs.setString(1, _ID_ClassRom);
            cs.setString(2, _Description_ClassRoom);
            cs.setString(3, _Location_ClassRoom);
            cs.setInt(4, _Capacity_ClassRoom);
            cs.setString(5, _ID_BranchOffice);
            cs.setString(6, _State_ClassRoom);
            
            int numFacectas = cs.executeUpdate();
            
            if (numFacectas > 0) 
            {
                eye = 100;
                Response = "Updated Successfully !";
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
        return Response;
    }
    
    public int Delete(String _ID_ClassRom)
    {
        int numFA = 0;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_DeleteClassRoom(?)}");
            cs.setString(1, _ID_ClassRom);
            
            numFA = cs.executeUpdate();
            
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
        return numFA;
    }
    
    public void SearchClassRoom(JComboBox cmbCombo, String parameters)
    {
        DefaultComboBoxModel value;
        LB_ClassRoom CR;//Object (Class) The type ClassRoom
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_SearchClassRoomEnabled(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                CR = new LB_ClassRoom();
                CR.setID_ClassRom(rs.getString(1));
                CR.setDescription_ClassRoom(rs.getString(2));
                CR.setLocation_ClassRoom(rs.getString(3));
                CR.setCapacity_ClassRoom(rs.getInt(4));
                CR.setState_ClassRoom(rs.getString(5));
                value.addElement(CR);
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
    }
    
    public ArrayList<LB_ClassRoom> Seacrh(String parameters)
    {
        ArrayList<LB_ClassRoom> list = new ArrayList();
        LB_ClassRoom ClassRoom;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_SearchClassRoom(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                ClassRoom = new LB_ClassRoom();
                ClassRoom.setID_ClassRom(rs.getString(1));
                ClassRoom.setDescription_ClassRoom(rs.getString(2));
                ClassRoom.setLocation_ClassRoom(rs.getString(3));
                ClassRoom.setCapacity_ClassRoom(rs.getInt(4));
                ClassRoom.setState_ClassRoom(rs.getString(5));
                //Agregar a  la lista el objeto
                list.add(ClassRoom);
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
