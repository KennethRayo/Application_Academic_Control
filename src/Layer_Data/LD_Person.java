/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import Layer_Business.LB_Person;
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
public class LD_Person 
{
    public int eye;
    public String Response;
    public boolean dbrows = false;
    LD_Connection ConnectionSQLSERVER;

    public LD_Person() 
    {
       ConnectionSQLSERVER = new LD_Connection();
    }
    
    public void ListPerson(JComboBox cmbCombo)//Listar
    {
         DefaultComboBoxModel value;
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListPersonEnabledCBO()}");
            //Devolver los registros
            ResultSet rs = cs.executeQuery();  
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {         
              value.addElement(new LB_Person(rs.getString("ID"),
                      rs.getString("Name"),rs.getString("Surname"),
                      rs.getString("Lastname"),rs.getString("IdentificationType"),
                      rs.getString("Identification"),rs.getString("Gender"),
                      rs.getString("Birthday"),rs.getString("Country"),
                      rs.getString("Province"),rs.getString("Canton"),
                      rs.getString("BranchOffice"),
                      rs.getString("District"),rs.getString("CivilStatus"),
                      rs.getString("CellPhone"),rs.getString("Email"),
                      rs.getString("HomeAddress"),rs.getString("State")));
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
    
    
    
    public void SearchPersonEnabled(JComboBox cmbCombo, String parameters)
    {
        DefaultComboBoxModel value;
        LB_Person person;//objeto (clase) de tipo persona
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_SearchPersonEnabled(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                person = new LB_Person();
                person.setID_Person(rs.getString(1));
                person.setName_Person(rs.getString(2));
                person.setSurname_Person(rs.getString(3));
                person.setLastname_Person(rs.getString(4));
                person.setIdentificationType_Person(rs.getString(5));
                person.setIdentification_Person(rs.getString(6));
                person.setGender_Peron(rs.getString(7));
                person.setBirthday_Person(rs.getString(8));
                person.setCountry_Person(rs.getString(9));
                person.setProvince_Person(rs.getString(10));
                person.setCanton_Person(rs.getString(11));
                person.setDistrict_Person(rs.getString(12));
                person.setCivilStatus_Person(rs.getString(13));
                person.setCellPhone_Person(rs.getString(14));
                person.setEmail_Person(rs.getString(15));
                person.setHomeAddress_Person(rs.getString(16));
                person.setState_Person(rs.getString(17));
                value.addElement(person);
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
    
    
    public void ListCIFTypeDirector(JComboBox cmbCombo)
    {
        DefaultComboBoxModel value;
        LB_Person person;//objeto (clase) de tipo persona
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListCIFTypeDirectorCBO()}");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                person = new LB_Person();
                person.setID_Person(rs.getString(1));
                person.setName_Person(rs.getString(2));
                value.addElement(person);
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
    
    public ArrayList<LB_Person> List()
    {
        ArrayList listaProduct = new ArrayList();
        /*Importar
        -click derecho
        -Fix imports (Ctrl+Shift+l)*/
        LB_Person person;//objeto (clase) de tipo persona
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListPerson()}");
            
            //Crear la operacion de listar
//            PreparedStatement ps = acceDB.prepareStatement("SELECT ID_Person AS ID, Name_Person AS Name, Surname_Person AS Surname,\n" +
//            "Lastname_Person AS Lastname, Gender_Person AS Gender,\n" +
//            "Birthday_Person AS Birthday, \n" +
//            "Country_Person AS Country, Province_Person AS Province, \n" +
//            "Canton_Person AS Canton, District_Person AS District, \n" +
//            "CivilStatus_Person AS CivilStatus,\n" +
//            "CellPhone_Person AS CellPhone, Email_Person AS Email,\n" +
//            "HomeAddress AS HomeAddress, State_Person AS State FROM AAC_Person");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            //Mientras hayan registros por leer
            while(rs.next())
            {
                //instanciar al objeto de tipo persona
                person = new LB_Person();
                //llenar los atributos con el objeto
                person.setID_Person(rs.getString(1));
                person.setName_Person(rs.getString(2));
                person.setSurname_Person(rs.getString(3));
                person.setLastname_Person(rs.getString(4));
                person.setIdentificationType_Person(rs.getString(5));
                person.setIdentification_Person(rs.getString(6));
                person.setGender_Peron(rs.getString(7));
                person.setBirthday_Person(rs.getString(8));
                person.setCountry_Person(rs.getString(9));
                person.setProvince_Person(rs.getString(10));
                person.setDistrict_Person(rs.getString(11));
                person.setCanton_Person(rs.getString(12));
                person.setBranchOffice_Person(rs.getString(13));
                person.setCivilStatus_Person(rs.getString(14));
                person.setCellPhone_Person(rs.getString(15));
                person.setEmail_Person(rs.getString(16));
                person.setHomeAddress_Person(rs.getString(17));
                person.setState_Person(rs.getString(18));
                //Agregar a  la lista el objeto
                listaProduct.add(person);
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
    
    public String Insert(String _ID_Person, String _Name_Person, String _Surname_Person,
            String _Lastname_Person, String _IdentificationType_Person, 
            String _Identification_Person, String _Gender_Person, String _Birthday_Person,
            String _Country_Person, String _Province_Person, String _District_Person, 
            String _Canton_Person, String _BranchOffice_Person, String _CivilStatus_Person, String _CellPhone_Person, 
            String _Email_Person, String _HomeAddress_Person, String _State_Person)
    {
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_InsertPerson(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, _ID_Person);
            cs.setString(2, _Name_Person);
            cs.setString(3, _Surname_Person);
            cs.setString(4, _Lastname_Person);
            cs.setString(5, _IdentificationType_Person);
            cs.setString(6, _Identification_Person);
            cs.setString(7, _Gender_Person);
            cs.setString(8, _Birthday_Person);
            cs.setString(9, _Country_Person);
            cs.setString(10, _Province_Person);
            cs.setString(11, _District_Person);
            cs.setString(12, _Canton_Person);
            cs.setString(13, _BranchOffice_Person);
            cs.setString(14, _CivilStatus_Person);
            cs.setString(15, _CellPhone_Person);
            cs.setString(16, _Email_Person);
            cs.setString(17, _HomeAddress_Person);
            cs.setString(18, _State_Person);
            
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
    
    public String Update(String _ID_Person, String _Name_Person, String _Surname_Person,
            String _Lastname_Person, String _IdentificationType_Person, 
            String _Identification_Person, String _Gender_Person, String _Birthday_Person,
            String _Country_Person, String _Province_Person, String _District_Person, 
            String _Canton_Person, String _BranchOffice_Person, String _CivilStatus_Person, String _CellPhone_Person, 
            String _Email_Person, String _HomeAddress_Person, String _State_Person)
    {
        try 
        {
            Connection accesoDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = accesoDB.prepareCall("{call AAC_UpdatePerson(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cs.setString(1, _ID_Person);
            cs.setString(2, _Name_Person);
            cs.setString(3, _Surname_Person);
            cs.setString(4, _Lastname_Person);
            cs.setString(5, _IdentificationType_Person);
            cs.setString(6, _Identification_Person);
            cs.setString(7, _Gender_Person);
            cs.setString(8, _Birthday_Person);
            cs.setString(9, _Country_Person);
            cs.setString(10, _Province_Person);
            cs.setString(11, _District_Person);
            cs.setString(12, _Canton_Person);
            cs.setString(13, _BranchOffice_Person);
            cs.setString(14, _CivilStatus_Person);
            cs.setString(15, _CellPhone_Person);
            cs.setString(16, _Email_Person);
            cs.setString(17, _HomeAddress_Person);
            cs.setString(18, _State_Person);
            
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
    
    public int Delete(String ID_Person)
    {
        int numFA = 0;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_DeletePerson(?)}");
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
        } 
        catch (SQLException ex) 
        {
            JOptionPane.showMessageDialog(null, ex.getErrorCode() + "\n\n" + ex.getMessage(), "AA Control - SQLException", JOptionPane.WARNING_MESSAGE);
        }
        return numFA;
    }
    
    public ArrayList<LB_Person> Seacrh(String parameters)
    {
        ArrayList<LB_Person> listProduct = new ArrayList();
        LB_Person person;
        try 
        {
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            CallableStatement cs = acceDB.prepareCall("{call AAC_SearchPerson(?)}");
            
            //Devolver los registros
            cs.setString(1, parameters);
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
                person = new LB_Person();
                person.setID_Person(rs.getString(1));
                person.setName_Person(rs.getString(2));
                person.setSurname_Person(rs.getString(3));
                person.setLastname_Person(rs.getString(4));
                person.setIdentificationType_Person(rs.getString(5));
                person.setIdentification_Person(rs.getString(6));
                person.setGender_Peron(rs.getString(7));
                person.setBirthday_Person(rs.getString(8));
                person.setCountry_Person(rs.getString(9));
                person.setProvince_Person(rs.getString(10));
                person.setDistrict_Person(rs.getString(11));
                person.setCanton_Person(rs.getString(12));
                person.setBranchOffice_Person(rs.getString(13));
                person.setCivilStatus_Person(rs.getString(14));
                person.setCellPhone_Person(rs.getString(15));
                person.setEmail_Person(rs.getString(16));
                person.setHomeAddress_Person(rs.getString(17));
                person.setState_Person(rs.getString(18));
                //Agregar a  la lista el objeto
                listProduct.add(person);
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
        return listProduct;
    }
    

    public DefaultTableModel Statistics_GenderPerson_UAD(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Gender","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_GenderPerson_UAD()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Gender");
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
    
    public DefaultTableModel Statistics_CountryPerson_UAD(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Country","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_CountryPerson_UAD()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Country");
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
    
    public DefaultTableModel Statistics_ProvincePerson_UAD(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Province","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_ProvincePerson_UAD()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Province");
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
    
    public DefaultTableModel Statistics_DistrictPerson_UAD(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"District","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_DistrictPerson_UAD()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("District");
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
    
    public DefaultTableModel Statistics_CantonPerson_UAD(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Canton","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_CantonPerson_UAD()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Canton");
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
    
    public DefaultTableModel Statistics_CivilStatusPerson_UAD(){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"CivilStatus","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_CivilStatusPerson_UAD()}");
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("CivilStatus");
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
    
    //BranchOffice
    public DefaultTableModel Statistics_GenderPerson_BO_UAD(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Gender","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_GenderPerson_BO_UAD(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Gender");
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
    
    public DefaultTableModel Statistics_CountryPerson_BO_UAD(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Country","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_CountryPerson_BO_UAD(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Country");
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
    
    public DefaultTableModel Statistics_ProvincePerson_BO_UAD(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Province","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_ProvincePerson_BO_UAD(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Province");
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
    
    public DefaultTableModel Statistics_DistrictPerson_BO_UAD(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"District","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_DistrictPerson_BO_UAD(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("District");
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
    
    public DefaultTableModel Statistics_CantonPerson_BO_UAD(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"Canton","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_CantonPerson_BO_UAD(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("Canton");
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
    
    public DefaultTableModel Statistics_CivilStatusPerson_BO_UAD(String ID_BranchOffice){
        
        DefaultTableModel miModelo = null;
        try{
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            String titulos []= {"CivilStatus","Quantity"};
            String dts [] = new String[2];
            miModelo = new DefaultTableModel(null, titulos);
            //String sql = "select Gender_Person, count(Gender_Person) AS Quantity from AAC_Person group by Gender_Person";
            //PreparedStatement pst = acceDB.prepareStatement(sql);
            CallableStatement cs = acceDB.prepareCall("{call AAC_Statistics_CivilStatusPerson_BO_UAD(?)}");
            cs.setString(1, ID_BranchOffice);
            
            ResultSet rs = cs.executeQuery();
            while(rs.next())
            {
               dts[0] = rs.getString("CivilStatus");
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
}
