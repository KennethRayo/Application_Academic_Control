/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import Layer_Business.LB_CIF;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LD_CIF {

    public int eye;
    public String Response;
    public boolean dbrows = false;
    LD_Connection ConnectionSQLSERVER;
    
    public LD_CIF() 
    {
        ConnectionSQLSERVER = new LD_Connection();
    }
    
    public void ListCIFType(JComboBox cmbCombo)
    {
        DefaultComboBoxModel value;
        LB_CIF CIF;//objeto (clase) de tipo persona
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListCIFType()}");
            //Devolver los registros
            ResultSet rs = cs.executeQuery();  
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                CIF = new LB_CIF();
                CIF.setID_CIFType(rs.getString("IDCIFType"));
                CIF.setDescription_CIFType(rs.getString("Description"));
                value.addElement(CIF);
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
    
    
    
    public ArrayList<LB_CIF> List()
    {
        ArrayList listCIF = new ArrayList();
        /*Importar
        -click derecho
        -Fix imports (Ctrl+Shift+l)*/
        LB_CIF CIF;//objeto (clase) de tipo persona
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_SelectCIF()}");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            //Mientras hayan registros por leer
            while(rs.next())
            {
                //instanciar al objeto de tipo persona
                CIF = new LB_CIF();
                //llenar los atributos con el objeto
                CIF.setID_Person(rs.getString(1));
                CIF.setName_Person(rs.getString(2));
                CIF.setPaymentMethod_CIF(rs.getString(3));
                CIF.setDenomination_CIF(rs.getString(4));
                CIF.setDateOfAdmission_CIF(rs.getString(5));
                CIF.setClassification(rs.getString(6));
                CIF.setTypeOfCurrency_CIF(rs.getString(7));
                
                //Agregar a  la lista el objeto
                listCIF.add(CIF);
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
        return listCIF;
    }
    
    public String Insert(String _ID_Person, String _PaymentMethod_CIF, 
            String _Denomination_CIF, String _DateOfAdmission_CIF,
            String _Classification, String _TypeOfCurrency, String _IDCIFType, 
            String _IDCIF_CIFType)
    {
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_InsertCIF(?,?,?,?,?,?,?,?)}");
            cs.setString(1, _ID_Person);
            cs.setString(2, _PaymentMethod_CIF);
            cs.setString(3, _Denomination_CIF);
            cs.setString(4, _DateOfAdmission_CIF);
            cs.setString(5, _Classification);
            cs.setString(6, _TypeOfCurrency);
            cs.setString(7, _IDCIFType);
            cs.setString(8, _IDCIF_CIFType);
            
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
    
    public String InsertCIF_CIFType(String _IDCIFType, String _ID_Person, 
            String _IDCIF_CIFType)
    {
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_InsertCIF_CIFType(?,?,?)}");
            cs.setString(1, _IDCIFType);
            cs.setString(2, _ID_Person);
            cs.setString(3, _IDCIF_CIFType);
            
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
    
    public String UpdateCIF(String _ID_Person, String _PaymentMethod_CIF, 
            String _Denomination_CIF, String _DateOfAdmission_CIF,
            String _Classification, String _TypeOfCurrency, String _IDCIFType)
    {
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_UpdateCIF(?,?,?,?,?,?,?)}");
            cs.setString(1, _ID_Person);
            cs.setString(2, _PaymentMethod_CIF);
            cs.setString(3, _Denomination_CIF);
            cs.setString(4, _DateOfAdmission_CIF);
            cs.setString(5, _Classification);
            cs.setString(6, _TypeOfCurrency);
            cs.setString(7, _IDCIFType);
            
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
    
    public int Delete(String ID_Person)
    {
        int numFA = 0;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_DeleteCIF(?)}");
            cs.setString(1, ID_Person);
            
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
    
    public int DeleteCif_CifType(String ID_Cif_CifType)
    {
        int numFA = 0;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_DeleteCIF_CIFType(?)}");
            cs.setString(1, ID_Cif_CifType);
            
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
    
    public ArrayList<LB_CIF> Seacrh(String parameters)
    {
        ArrayList<LB_CIF> list2CIF = new ArrayList();
        LB_CIF CIF;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_SearchCIF(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                CIF = new LB_CIF();
                CIF.setID_Person(rs.getString(1));
                CIF.setName_Person(rs.getString(2));
                CIF.setPaymentMethod_CIF(rs.getString(3));
                CIF.setDenomination_CIF(rs.getString(4));
                CIF.setDateOfAdmission_CIF(rs.getString(5));
                CIF.setClassification(rs.getString(6));
                CIF.setTypeOfCurrency_CIF(rs.getString(7));
                //Agregar a  la lista el objeto
                list2CIF.add(CIF);
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
        return list2CIF;
    }
    
    public ArrayList<LB_CIF> ListCIF_CIFType(String parameter)
    {
        ArrayList<LB_CIF> list3CIF = new ArrayList();
        LB_CIF CIFT;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListCIF_CIFType(?)}");
            
            //Devolver los registros
            cs.setString(1, parameter);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                CIFT = new LB_CIF();
                CIFT.setID_CIF_CIFType(rs.getString(1));
                CIFT.setDescription_CIFType(rs.getString(2));
                //Agregar a  la lista el objeto
                list3CIF.add(CIFT);
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
        return list3CIF;
    }
    
    public DefaultTableModel Statistics_PersonDirector_CIF(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Director","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_PersonDirector_CIF()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Director");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_PaymentMethod_CIF(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"PaymentMethod","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_PaymentMethod_CIF()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("PaymentMethod");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_Classification_CIF(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Classification","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_Classification_CIF()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Classification");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_Denomination_CIF(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Denomination","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_Denomination__CIF()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Denomination");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_TypeOfCurrency_CIF(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"TypeOfCurrency","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_TypeOfCurrency__CIF()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("TypeOfCurrency");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    
    
    public DefaultTableModel Statistics_PersonDirector_BO_CIF(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Director","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_PersonDirector_BO_CIF(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Director");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_PaymentMethod_BO_CIF(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"PaymentMethod","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_PaymentMethod_BO_CIF(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("PaymentMethod");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_Classification_BO_CIF(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Classification","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_Classification_BO_CIF(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Classification");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_Denomination_BO_CIF(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Denomination","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_Denomination_BO__CIF(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Denomination");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
    public DefaultTableModel Statistics_TypeOfCurrency_BO_CIF(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"TypeOfCurrency","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_TypeOfCurrency_BO__CIF(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("TypeOfCurrency");
               dts[1] = rs.getString("Quantity");
               miModelo.addRow(dts);
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
        return miModelo;
    }
    
}
