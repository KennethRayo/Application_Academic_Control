/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import Layer_Business.LB_Level;
import java.sql.CallableStatement;
import java.sql.Connection;
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
public class LD_Level {
    public int eye;
    public String Response;
    public boolean dbrows = false;
    public int TotalCredits;
    LD_Connection ConnectionSQLSERVER;
    
    public LD_Level() 
    {
        ConnectionSQLSERVER = new LD_Connection();
    }
    
    public ArrayList<LB_Level> List()
    {
        ArrayList listLV = new ArrayList();
        /*Importar
        -click derecho
        -Fix imports (Ctrl+Shift+l)*/
            LB_Level Lavel;//objeto (clase) de tipo persona
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListLevel()}");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            //Mientras hayan registros por leer
            while(rs.next())
            {
                //instanciar al objeto de tipo persona
                Lavel = new LB_Level();
                //llenar los atributos con el objeto
                Lavel.setID_Level(rs.getString(1));
                Lavel.setDescription_Career(rs.getString(2));
                Lavel.setOpenningDate(rs.getString(3));
                Lavel.setAcademicGrade(rs.getString(4));
                Lavel.setDescription(rs.getString(5));
                Lavel.setName_Person(rs.getString(6));
                Lavel.setEnphatic(rs.getString(7));
                Lavel.setCredits(rs.getInt(8));
                Lavel.setMinimumNote(rs.getInt(9));
                Lavel.setState(rs.getString(10));
                
                //Agregar a  la lista el objeto
                listLV.add(Lavel);
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
        return listLV;
    }
    
    
    public void ListLevel(JComboBox cmbCombo)
    {
        DefaultComboBoxModel value;
        LB_Level level;//objeto (clase) de tipo persona
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListLevelEnabed()}");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                level = new LB_Level();
                level.setID_Level(rs.getString(1));
                level.setDescription(rs.getString(2));
                value.addElement(level);
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
    
    public String Insert(String ID_Level, String ID_Career, 
            String OpenningDate, String AcademicGrade,
            String Description,
            String Enphatic, int Credits, String ID_BranchOffice, int MinimumNote,
            String State)
    {
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_InsertLevel(?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, ID_Level);
            cs.setString(2, OpenningDate);
            cs.setString(3, AcademicGrade);
            cs.setString(4, Description);
            cs.setString(5, Enphatic);
            cs.setInt(6, Credits);
            cs.setString(7, ID_Career);
            cs.setString(8, ID_BranchOffice);
            cs.setInt(9, MinimumNote);
            cs.setString(10, State);
            
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
    
    public String Update(String ID_Level, String ID_Career, 
            String OpenningDate, String AcademicGrade,
            String Description,
            String Enphatic, int Credits, String ID_BranchOffice, int MinimumNote,
            String State)
    {
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_UpdateLevel(?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, ID_Level);
            cs.setString(2, OpenningDate);
            cs.setString(3, AcademicGrade);
            cs.setString(4, Description);
            cs.setString(5, Enphatic);
            cs.setInt(6, Credits);
            cs.setString(7, ID_Career);
            cs.setString(8, ID_BranchOffice);
            cs.setInt(9, MinimumNote);
            cs.setString(10, State);
            
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
    
    
    public int Delete(String ID_Level)
    {
        int numFA = 0;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_DeleteLevel(?)}");
            cs.setString(1, ID_Level);
            
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
    
    
    public ArrayList<LB_Level> Seacrh(String parameters)
    {
        ArrayList<LB_Level> list = new ArrayList();
        LB_Level Lavel;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_SeachLevel(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                Lavel = new LB_Level();
                Lavel.setID_Level(rs.getString(1));
                Lavel.setDescription_Career(rs.getString(2));
                Lavel.setOpenningDate(rs.getString(3));
                Lavel.setAcademicGrade(rs.getString(4));
                Lavel.setDescription(rs.getString(5));
                Lavel.setName_Person(rs.getString(6));
                Lavel.setEnphatic(rs.getString(7));
                Lavel.setCredits(rs.getInt(8));
                Lavel.setMinimumNote(rs.getInt(9));
                Lavel.setState(rs.getString(10));
                //Agregar a  la lista el objeto
                list.add(Lavel);
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
    
    public int GetLevelCredits(String ID_Level)
    {
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_GetLevelCredits(?)}");
            cs.setString(1, ID_Level);
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            while (rs.next()) 
            {
                //Obtener datos de usuario
                TotalCredits = rs.getInt("Credits");
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
        return TotalCredits;
    }
}
