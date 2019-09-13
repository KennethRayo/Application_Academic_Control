/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import Layer_Business.LB_BranchOffice;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLWarning;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;

/**
 *
 * @author KGR
 */
public class LD_BranchOffice {
    public int eye;
    public String Response;
    public boolean dbrows = false;
    LD_Connection ConnectionSQLSERVER;
    
    public LD_BranchOffice() 
    {
        ConnectionSQLSERVER = new LD_Connection();
    }
    
    public void ListBranchOfficeCBO(JComboBox cmbCombo)
    {
        DefaultComboBoxModel value;
        LB_BranchOffice Office;//objeto (clase) de tipo persona
      try 
        {         
            Connection acceDB = ConnectionSQLSERVER.getConexion();
            //Crear la operacion de listar
            CallableStatement cs = acceDB.prepareCall("{call AAC_ListBranchOfficeCBO()}");
            
            //Devolver los registros
            ResultSet rs = cs.executeQuery();
            value = new DefaultComboBoxModel();
            cmbCombo.setModel(value);
            while (rs.next()) 
            {  
                Office = new LB_BranchOffice();
                Office.setID_BranchOffice(rs.getString(1));
                Office.setDescription_BranchOffice(rs.getString(2));
                Office.setCountry_BranchOffice(rs.getString(3));
                Office.setProvince_BranchOffice(rs.getString(4));
                Office.setDistrict_BranchOffice(rs.getString(5));
                Office.setCanton_BranchOffice(rs.getString(6));
                Office.setStatus_BranchOffice(rs.getString(7));
                value.addElement(Office);
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
}
