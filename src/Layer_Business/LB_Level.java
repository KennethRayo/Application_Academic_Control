/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Level;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_Level extends LB_Career {
    private String _ID_Level;
    private String _OpenningDate;
    private String _AcademicGrade;
    private String _Description;
    private String _Enphatic;
    private int _Credits;
    private String _ID_BranchOffice;
    private int _MinimumNote;
    private String _State;
    
    public LB_Level(String ID_Level, String ID_Career, 
            String OpenningDate, String AcademicGrade,
            String Description,
            String Enphatic, int Credits, String ID_BranchOffice, int MinimumNote, 
            String State)
    {
        super(ID_Career, null, null, null, null);
        
        this._ID_Level = ID_Level;
        this._OpenningDate = OpenningDate;
        this._AcademicGrade = AcademicGrade;
        this._Description = Description;
        this._Enphatic = Enphatic;
        this._Credits = Credits;
        this._ID_BranchOffice = ID_BranchOffice;
        this._MinimumNote = MinimumNote;
        this._State = State;
    }
    
    LD_Level LD = new LD_Level();
    public LB_Level(){}

    public String getID_Level() {
        return _ID_Level;
    }

    public void setID_Level(String _ID_Level) {
        this._ID_Level = _ID_Level;
    }

    public String getOpenningDate() {
        return _OpenningDate;
    }

    public void setOpenningDate(String _OpenningDate) {
        this._OpenningDate = _OpenningDate;
    }

    public String getAcademicGrade() {
        return _AcademicGrade;
    }

    public void setAcademicGrade(String _AcademicGrade) {
        this._AcademicGrade = _AcademicGrade;
    }

    public String getDescription() {
        return _Description;
    }

    public void setDescription(String _Description) {
        this._Description = _Description;
    }

    public String getEnphatic() {
        return _Enphatic;
    }

    public void setEnphatic(String _Enphatic) {
        this._Enphatic = _Enphatic;
    }

    public int getCredits() {
        return _Credits;
    }

    public void setCredits(int _Credits) {
        this._Credits = _Credits;
    }
    
    public String getID_BranchOffice() {
        return _ID_BranchOffice;
    }

    public void setID_BranchOffice(String _ID_BranchOffice) {
        this._ID_BranchOffice = _ID_BranchOffice;
    }

    public int getMinimumNote() {
        return _MinimumNote;
    }

    public void setMinimumNote(int _MinimumNote) {
        this._MinimumNote = _MinimumNote;
    }

    public String getState() {
        return _State;
    }

    public void setState(String _State) {
        this._State = _State;
    }
    
    public String toString() {
        return _Description;
    }
    
    
     public void ListLevel(JComboBox ComboBox)
    {
        LD.ListLevel(ComboBox);
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
        modeloT.addColumn("Carrera");
        modeloT.addColumn("Fecha Apertura");
        modeloT.addColumn("Grado Académico");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Director");
        modeloT.addColumn("Énfasis");
        modeloT.addColumn("Creditos");
        modeloT.addColumn("Nota Mínima");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[10];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_Level();
            columna[1] = LD.List().get(i).getDescription_Career();
            columna[2] = LD.List().get(i).getOpenningDate();
            columna[3] = LD.List().get(i).getAcademicGrade();
            columna[4] = LD.List().get(i).getDescription();
            columna[5] = LD.List().get(i).getName_Person();/*DIRECTOR*/
            columna[6] = LD.List().get(i).getEnphatic();
            columna[7] = LD.List().get(i).getCredits();
            columna[8] = LD.List().get(i).getMinimumNote();
            columna[9] = LD.List().get(i).getState();
            
                       
            modeloT.addRow(columna);
        }
    }
    
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Level(), getID_Career(), getOpenningDate(), 
                getAcademicGrade(), getDescription(), getEnphatic(), getCredits(), 
                getID_BranchOffice(), getMinimumNote(), getState());
        
//                JOptionPane.showMessageDialog(null, getID_Level() + "\n" + getID_Career()+ "\n" + 
//                    getOpenningDate()+ "\n" + getAcademicGrade()+ "\n" + 
//                    getDescription() + "\n" + getEnphatic()+ "\n" + 
//                    getCredits()+ "\n" + getMinimumNote()+ "\n" + 
//                    getState()
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return rptaRegistro;
        
    }
    
    
    public String Update()
    {
        Response = LD.Update(getID_Level(), getID_Career(), getOpenningDate(), 
                getAcademicGrade(), getDescription(), getEnphatic(), getCredits(), 
                getID_BranchOffice(), getMinimumNote(), getState());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Level());
        return numFA;
    }
    
    
    public void Search(JTable tableG, String Parameters)
    {
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableG.setModel(modeloT);

        //Agregar al modelo las 20 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Carrera");
        modeloT.addColumn("Fecha Apertura");
        modeloT.addColumn("Grado Académico");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Director");
        modeloT.addColumn("Énfasis");
        modeloT.addColumn("Creditos");
        modeloT.addColumn("Nota Mínima");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[10];

        //numero de registros recuperado desde la db
        int numRegistros = LD.Seacrh(Parameters).size();

        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.Seacrh(Parameters).get(i).getID_Level();
            columna[1] = LD.Seacrh(Parameters).get(i).getDescription_Career();
            columna[2] = LD.Seacrh(Parameters).get(i).getOpenningDate();
            columna[3] = LD.Seacrh(Parameters).get(i).getAcademicGrade();
            columna[4] = LD.Seacrh(Parameters).get(i).getDescription();
            columna[5] = LD.Seacrh(Parameters).get(i).getName_Person();/*DIRECTOR*/
            columna[6] = LD.Seacrh(Parameters).get(i).getEnphatic();
            columna[7] = LD.Seacrh(Parameters).get(i).getCredits();
            columna[8] = LD.Seacrh(Parameters).get(i).getMinimumNote();
            columna[9] = LD.Seacrh(Parameters).get(i).getState();
            
            modeloT.addRow(columna);
        }
    }
    
    public int GetLevelCredits(String ID_Level)
    {
        int value = LD.GetLevelCredits(ID_Level);
        return value;
    }

    
}
