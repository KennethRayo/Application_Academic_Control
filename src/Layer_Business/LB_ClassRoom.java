/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_ClassRoom;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_ClassRoom {
    
    private String _ID_ClassRom;
    private String _Description_ClassRoom;
    private String _Location_ClassRoom;
    private int _Capacity_ClassRoom;
    private String _ID_BranchOffice;
    private String _State_ClassRoom;
    public String Response;
    public int eye;
    
    public LB_ClassRoom(String _ID_ClassRom, String _Description_ClassRoom,
            String _Location_ClassRoom, int _Capacity_ClassRoom, String _ID_BranchOffice,
            String _State_ClassRoom)
    {
        this._ID_ClassRom = _ID_ClassRom;
        this._Description_ClassRoom = _Description_ClassRoom;
        this._Location_ClassRoom = _Location_ClassRoom;
        this._Capacity_ClassRoom = _Capacity_ClassRoom;
        this._ID_BranchOffice = _ID_BranchOffice;
        this._State_ClassRoom = _State_ClassRoom;
    }
    
    LD_ClassRoom LD = new LD_ClassRoom();
    public LB_ClassRoom() {}

    public String getID_ClassRom() {
        return _ID_ClassRom;
    }

    public void setID_ClassRom(String _ID_ClassRom) {
        this._ID_ClassRom = _ID_ClassRom;
    }

    public String getDescription_ClassRoom() {
        return _Description_ClassRoom;
    }

    public void setDescription_ClassRoom(String _Description_ClassRoom) {
        this._Description_ClassRoom = _Description_ClassRoom;
    }

    public String getLocation_ClassRoom() {
        return _Location_ClassRoom;
    }

    public void setLocation_ClassRoom(String _Location_ClassRoom) {
        this._Location_ClassRoom = _Location_ClassRoom;
    }

    public int getCapacity_ClassRoom() {
        return _Capacity_ClassRoom;
    }

    public void setCapacity_ClassRoom(int _Capacity_ClassRoom) {
        this._Capacity_ClassRoom = _Capacity_ClassRoom;
    }

    public String getState_ClassRoom() {
        return _State_ClassRoom;
    }

    public void setState_ClassRoom(String _State_ClassRoom) {
        this._State_ClassRoom = _State_ClassRoom;
    }
    
    public String getID_BranchOffice() {
        return _ID_BranchOffice;
    }

    public void setID_BranchOffice(String _ID_BranchOffice) {
        this._ID_BranchOffice = _ID_BranchOffice;
    }
    
    public String toString() {
        return _Description_ClassRoom;
    }
    
     public void ListClassRoom(JComboBox ComboBox)
    {
        LD.ListClassRoom(ComboBox);
    }
     
     public void SearchClassRoom(JComboBox ComboBox, String Parameters) //Localized in LD_Person
    {
        LD.SearchClassRoom(ComboBox, Parameters);
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
        modeloT.addColumn("Ubicación");
        modeloT.addColumn("Capacidad");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[5];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_ClassRom();
            columna[1] = LD.List().get(i).getDescription_ClassRoom();
            columna[2] = LD.List().get(i).getLocation_ClassRoom();
            columna[3] = LD.List().get(i).getCapacity_ClassRoom();
            columna[4] = LD.List().get(i).getState_ClassRoom();
                       
            modeloT.addRow(columna);
        }
    }
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_ClassRom(), getDescription_ClassRoom(), 
                     getLocation_ClassRoom(), getCapacity_ClassRoom(), 
                     getID_BranchOffice(), getState_ClassRoom());
        return rptaRegistro;
    }
    
    public String Update()
    {
        Response = LD.Update(getID_ClassRom(), getDescription_ClassRoom(), 
                     getLocation_ClassRoom(), getCapacity_ClassRoom(), 
                     getID_BranchOffice(), getState_ClassRoom());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_ClassRom());
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
        modeloT.addColumn("Ubicación");
        modeloT.addColumn("Capacidad");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[5];

        //numero de registros recuperado desde la db
        int numRegistros = LD.Seacrh(Parameters).size();

        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.Seacrh(Parameters).get(i).getID_ClassRom();
            columna[1] = LD.Seacrh(Parameters).get(i).getDescription_ClassRoom();
            columna[2] = LD.Seacrh(Parameters).get(i).getLocation_ClassRoom();
            columna[3] = LD.Seacrh(Parameters).get(i).getCapacity_ClassRoom();
            columna[4] = LD.Seacrh(Parameters).get(i).getState_ClassRoom();
            
            modeloT.addRow(columna);
        }
    }

    

}
