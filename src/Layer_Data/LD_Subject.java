/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import Layer_Business.LB_Subject;
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
public class LD_Subject {
    
    public int eye;
    public String Response;
    public boolean dbrows = false;
    public int TotalCredits;
    LD_Connection ConnectionSQLSERVER;
    
    public LD_Subject() 
    {
        ConnectionSQLSERVER = new LD_Connection();
    }
    
    public ArrayList<LB_Subject> List()
    {
        ArrayList listSJ = new ArrayList();
        /*Importar
        -click derecho
        -Fix imports (Ctrl+Shift+l)*/
            LB_Subject Subject;//objeto (clase) de tipo persona
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListSubject()}");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            //Mientras hayan registros por leer
            while(rs.next())
            {
                //instanciar al objeto de tipo persona
                Subject = new LB_Subject();
                //llenar los atributos con el objeto
                Subject.setID_Subject(rs.getString(1));
                Subject.setDescription(rs.getString(2));
                Subject.setCredits(rs.getInt(3));
                Subject.setOpenningDate_Subject(rs.getString(4));
                Subject.setDescription_Subject(rs.getString(5));
                Subject.setPeriod(rs.getString(6));
                Subject.setMinimunNote_Subject(rs.getInt(7));
                Subject.setHoursDuration(rs.getInt(8));
                Subject.setExtraordinayMinimunNote(rs.getInt(9));
                Subject.setMinimunQuote(rs.getInt(10));
                Subject.setTypeOfCurrency_Subject(rs.getString(11));
                Subject.setStatus_Subject(rs.getString(12));
                
                //Agregar a  la lista el objeto
                listSJ.add(Subject);
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
        return listSJ;
    }
    
    public void ListSubject(JComboBox cmbCombo)
    {
        DefaultComboBoxModel value;
        LB_Subject Subject;//objeto (clase) de tipo persona
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListSubjectEnabled()}");
            //Devolver los registros
            ResultSet rs = cs.executeQuery();  
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                Subject = new LB_Subject();
                //llenar los atributos con el objeto
                Subject.setID_Subject(rs.getString(1));
                Subject.setDescription(rs.getString(2));
                Subject.setCredits(rs.getInt(3));
                Subject.setOpenningDate_Subject(rs.getString(4));
                Subject.setDescription_Subject(rs.getString(5));
                Subject.setPeriod(rs.getString(6));
                Subject.setMinimunNote_Subject(rs.getInt(7));
                Subject.setHoursDuration(rs.getInt(8));
                Subject.setExtraordinayMinimunNote(rs.getInt(9));
                Subject.setMinimunQuote(rs.getInt(10));
                Subject.setTypeOfCurrency_Subject(rs.getString(11));
                Subject.setStatus_Subject(rs.getString(12));
                
                value.addElement(Subject);
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
    
    public String Insert(String _ID_Subject, String _OpenningDate_Subject, String _Status_Subject, 
            String _Description_Subject, int _Credits, int _MinimunNote_Subject, 
            int _MinimunQuote, String _TypeOfCurrency_Subject, String _Period, 
            int _ReprobingAbsence, int _HoursDuration, 
            int _ExtraordinayMinimunNote, int _ApplyScholarshipDiscounts, 
            int _DegreeTest, int _ProfessionalPractice, 
            int _AppliesUVirtualRetirement, String ID_Level)
    {
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_InsertSubject(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, _ID_Subject);
            cs.setString(2, _OpenningDate_Subject);
            cs.setString(3, _Status_Subject);
            cs.setString(4, _Description_Subject);
            cs.setInt(5, _Credits);
            cs.setInt(6, _MinimunNote_Subject);
            cs.setInt(7, _MinimunQuote);
            cs.setString(8, _TypeOfCurrency_Subject);
            cs.setString(9, _Period);
            cs.setInt(10, _ReprobingAbsence);
            cs.setInt(11, _HoursDuration);
            cs.setInt(12, _ExtraordinayMinimunNote);
            cs.setInt(13, _ApplyScholarshipDiscounts);
            cs.setInt(14, _DegreeTest);
            cs.setInt(15, _ProfessionalPractice);
            cs.setInt(16, _AppliesUVirtualRetirement);
            cs.setString(17, ID_Level);
            
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
            cs.close();
            acceDB.close();
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return Response;
    }
    
    public String Update(String _ID_Subject, String _OpenningDate_Subject, String _Status_Subject, 
            String _Description_Subject, int _Credits, int _MinimunNote_Subject, 
            int _MinimunQuote, String _TypeOfCurrency_Subject, String _Period, 
            int _ReprobingAbsence, int _HoursDuration, 
            int _ExtraordinayMinimunNote, int _ApplyScholarshipDiscounts, 
            int _DegreeTest, int _ProfessionalPractice, 
            int _AppliesUVirtualRetirement, String ID_Level)
    {
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_UpdateSubject(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, _ID_Subject);
            cs.setString(2, _OpenningDate_Subject);
            cs.setString(3, _Status_Subject);
            cs.setString(4, _Description_Subject);
            cs.setInt(5, _Credits);
            cs.setInt(6, _MinimunNote_Subject);
            cs.setInt(7, _MinimunQuote);
            cs.setString(8, _TypeOfCurrency_Subject);
            cs.setString(9, _Period);
            cs.setInt(10, _ReprobingAbsence);
            cs.setInt(11, _HoursDuration);
            cs.setInt(12, _ExtraordinayMinimunNote);
            cs.setInt(13, _ApplyScholarshipDiscounts);
            cs.setInt(14, _DegreeTest);
            cs.setInt(15, _ProfessionalPractice);
            cs.setInt(16, _AppliesUVirtualRetirement);
            cs.setString(17, ID_Level);
            
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
            cs.close();
            acceDB.close();
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return Response;
    }
    
    
    public int Delete(String ID_Subject)
    {
        int numFA = 0;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_DeleteSubject(?)}");
            cs.setString(1, ID_Subject);
            
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
            cs.close();
            acceDB.close();
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return numFA;
    }
    
    
    public ArrayList<LB_Subject> Seacrh(String parameters)
    {
        ArrayList<LB_Subject> list = new ArrayList();
        LB_Subject Subject;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_SeachSubject(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                Subject = new LB_Subject();
                Subject.setID_Subject(rs.getString(1));
                Subject.setDescription(rs.getString(2));
                Subject.setCredits(rs.getInt(3));
                Subject.setOpenningDate_Subject(rs.getString(4));
                Subject.setDescription_Subject(rs.getString(5));
                Subject.setPeriod(rs.getString(6));
                Subject.setMinimunNote_Subject(rs.getInt(7));
                Subject.setHoursDuration(rs.getInt(8));
                Subject.setExtraordinayMinimunNote(rs.getInt(9));
                Subject.setMinimunQuote(rs.getInt(10));
                Subject.setTypeOfCurrency_Subject(rs.getString(11));
                Subject.setStatus_Subject(rs.getString(12));
                //Agregar a  la lista el objeto
                list.add(Subject);
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
    
    public int GetSubjectCredits(String ID_Level)
    {
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_GetSubjectCredits(?)}");
            cs.setString(1, ID_Level);
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            while (rs.next()) 
            {
                //Obtener datos de usuario
                TotalCredits = rs.getInt("CreditsSubject");
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
