/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Country;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_Country {
    private String _ID_Country;
    private String _Description_Country;
    public String Response;
    public int eye;

    public LB_Country(String _ID_Country, String _Description_Country) {
        this._ID_Country = _ID_Country;
        this._Description_Country = _Description_Country;
    }

    public String getID_Country() {
        return _ID_Country;
    }

    public void setID_Country(String _ID_Country) {
        this._ID_Country = _ID_Country;
    }

    public String getDescription_Country() {
        return _Description_Country;
    }

    public void setDescription_Country(String _Description_Country) {
        this._Description_Country = _Description_Country;
    }
    
    public String toString() {
        return _Description_Country;
    }
    
    LD_Country LD = new LD_Country();
    public LB_Country() {}
    
    public void ListCountry(JComboBox ComboBox)
    {
        LD.ListCountry(ComboBox);
    }
    
    public void List(JTable tableD)
    {
        //LD_Category LD = new LD_Category();
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableD.setModel(modeloT);
        
        //Agregar al modelo las 20 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Descripción");
       
        Object[] columna = new Object[2];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_Country();
            columna[1] = LD.List().get(i).getDescription_Country();
                       
            modeloT.addRow(columna);
        }
    }
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Country(), getDescription_Country());
//                JOptionPane.showMessageDialog(null, getID_Career() + "\n" + getDescription_Career()+ "\n" + 
//                    getID_Person()+ "\n" + getOpeningDate_Career()+ "\n" + 
//                    getState_Career()
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return rptaRegistro;
        
    }
    
    public String Update()
    {
        Response = LD.Update(getID_Country(), getDescription_Country());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Country());
        return numFA;
    }
}
