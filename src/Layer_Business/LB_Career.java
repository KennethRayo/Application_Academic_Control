/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Career;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_Career extends LB_Person {
    
    private String _ID_Career;
    private String _Description_Career;
    private String _OpeningDate_Career;
    private String _State_Career;
    
    public LB_Career(String _ID_Career, String _Description_Career,
            String _ID_Person, String _OpeningDate_Career, 
            String _State_Career)
    {
        super (_ID_Person, null, null, null, null, null, null, null, null, null, null, null, 
                null, null, null, null, null, null);
        this._ID_Career = _ID_Career;
        this._Description_Career = _Description_Career;
        this._OpeningDate_Career = _OpeningDate_Career;
        this._State_Career = _State_Career;
    }
    
    LD_Career LD = new LD_Career();
    public LB_Career() {}

    public String getID_Career() {
        return _ID_Career;
    }

    public void setID_Career(String _ID_Career) {
        this._ID_Career = _ID_Career;
    }

    public String getDescription_Career() {
        return _Description_Career;
    }

    public void setDescription_Career(String _Description_Career) {
        this._Description_Career = _Description_Career;
    }

    public String getOpeningDate_Career() {
        return _OpeningDate_Career;
    }

    public void setOpeningDate_Career(String _OpeningDate_Career) {
        this._OpeningDate_Career = _OpeningDate_Career;
    }

    public String getState_Career() {
        return _State_Career;
    }

    public void setState_Career(String _State_Career) {
        this._State_Career = _State_Career;
    }
    
    public String toString() {
        return _Description_Career;
    }
    
     public void ListCareer(JComboBox ComboBox)
    {
        LD.ListCareer(ComboBox);
    }
     
     public void SearchClassRoom(JComboBox ComboBox, String Parameters) //Localized in LD_Person
    {
        LD.SearchCareer(ComboBox, Parameters);
    }
     
     //Llenar tabla
    public void List(JTable tableD)
    {
        //LD_Category LD = new LD_Category();
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableD.setModel(modeloT);
        
        //Agregar al modelo las 20 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Director");
        modeloT.addColumn("Apertura");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[5];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_Career();
            columna[1] = LD.List().get(i).getDescription_Career();
            columna[2] = LD.List().get(i).getID_Person();
            columna[3] = LD.List().get(i).getOpeningDate_Career();
            columna[4] = LD.List().get(i).getState_Career();
                       
            modeloT.addRow(columna);
        }
    }
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Career(), getDescription_Career(), 
                     getID_Person(), getOpeningDate_Career(), 
                     getState_Career());
//                JOptionPane.showMessageDialog(null, getID_Career() + "\n" + getDescription_Career()+ "\n" + 
//                    getID_Person()+ "\n" + getOpeningDate_Career()+ "\n" + 
//                    getState_Career()
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return rptaRegistro;
        
    }
    
    public String Update()
    {
        Response = LD.Update(getID_Career(), getDescription_Career(), 
                     getID_Person(), getState_Career());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Career());
        return numFA;
    }
    
    public void Search(JTable tableG, String Parameters)
    {
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableG.setModel(modeloT);

        //Agregar al modelo las 20 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Director");
        modeloT.addColumn("Apertura");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[5];

        //numero de registros recuperado desde la db
        int numRegistros = LD.Seacrh(Parameters).size();

        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.Seacrh(Parameters).get(i).getID_Career();
            columna[1] = LD.Seacrh(Parameters).get(i).getDescription_Career();
            columna[2] = LD.Seacrh(Parameters).get(i).getID_Person();
            columna[3] = LD.Seacrh(Parameters).get(i).getOpeningDate_Career();
            columna[4] = LD.Seacrh(Parameters).get(i).getState_Career();
            
            modeloT.addRow(columna);
        }
    }
}
