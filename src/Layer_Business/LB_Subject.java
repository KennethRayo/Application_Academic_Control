/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Subject;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_Subject extends LB_Level {
    private String _ID_Subject;
    private String _OpenningDate_Subject;
    private String _Status_Subject;
    private String _Description_Subject;
    private int _Credits;
    private int _MinimunNote_Subject;
    private int _MinimunQuote;//cupo min
    private String _TypeOfCurrency_Subject;
    private String _Period;
    private int _ReprobingAbsence;//reprobar ausencia
    private int _HoursDuration;
    private int _ExtraordinayMinimunNote;
    private int _ApplyScholarshipDiscounts;
    private int _DegreeTest;//prueba de grado
    private int _ProfessionalPractice;
    private int _AppliesUVirtualRetirement;

    public LB_Subject(String _ID_Subject, String ID_Level, String _OpenningDate_Subject, String _Status_Subject, 
            String _Description_Subject, int _Credits, int _MinimunNote_Subject, 
            int _MinimunQuote, String _TypeOfCurrency_Subject, String _Period, 
            int _ReprobingAbsence, int _HoursDuration, 
            int _ExtraordinayMinimunNote, int _ApplyScholarshipDiscounts, 
            int _DegreeTest, int _ProfessionalPractice, 
            int _AppliesUVirtualRetirement) 
    {
        super(ID_Level,null,null,null,null,null,0,null,0,null);
        
        this._ID_Subject = _ID_Subject;
        this._OpenningDate_Subject = _OpenningDate_Subject;
        this._Status_Subject = _Status_Subject;
        this._Description_Subject = _Description_Subject;
        this._Credits = _Credits;
        this._MinimunNote_Subject = _MinimunNote_Subject;
        this._MinimunQuote = _MinimunQuote;
        this._TypeOfCurrency_Subject = _TypeOfCurrency_Subject;
        this._Period = _Period;
        this._ReprobingAbsence = _ReprobingAbsence;
        this._HoursDuration = _HoursDuration;
        this._ExtraordinayMinimunNote = _ExtraordinayMinimunNote;
        this._ApplyScholarshipDiscounts = _ApplyScholarshipDiscounts;
        this._DegreeTest = _DegreeTest;
        this._ProfessionalPractice = _ProfessionalPractice;
        this._AppliesUVirtualRetirement = _AppliesUVirtualRetirement;
    }
    
    LD_Subject LD = new LD_Subject();
    public LB_Subject(){}

    public String getID_Subject() {
        return _ID_Subject;
    }

    public void setID_Subject(String _ID_Subject) {
        this._ID_Subject = _ID_Subject;
    }

    public String getOpenningDate_Subject() {
        return _OpenningDate_Subject;
    }

    public void setOpenningDate_Subject(String _OpenningDate_Subject) {
        this._OpenningDate_Subject = _OpenningDate_Subject;
    }

    public String getStatus_Subject() {
        return _Status_Subject;
    }

    public void setStatus_Subject(String _Status_Subject) {
        this._Status_Subject = _Status_Subject;
    }

    public String getDescription_Subject() {
        return _Description_Subject;
    }

    public void setDescription_Subject(String _Description_Subject) {
        this._Description_Subject = _Description_Subject;
    }

    public int getCredits() {
        return _Credits;
    }

    public void setCredits(int _Credits) {
        this._Credits = _Credits;
    }

    public int getMinimunNote_Subject() {
        return _MinimunNote_Subject;
    }

    public void setMinimunNote_Subject(int _MinimunNote_Subject) {
        this._MinimunNote_Subject = _MinimunNote_Subject;
    }

    public int getMinimunQuote() {
        return _MinimunQuote;
    }

    public void setMinimunQuote(int _MinimunQuote) {
        this._MinimunQuote = _MinimunQuote;
    }

    public String getTypeOfCurrency_Subject() {
        return _TypeOfCurrency_Subject;
    }

    public void setTypeOfCurrency_Subject(String _TypeOfCurrency_Subject) {
        this._TypeOfCurrency_Subject = _TypeOfCurrency_Subject;
    }

    public String getPeriod() {
        return _Period;
    }

    public void setPeriod(String _Period) {
        this._Period = _Period;
    }

    public int getReprobingAbsence() {
        return _ReprobingAbsence;
    }

    public void setReprobingAbsence(int _ReprobingAbsence) {
        this._ReprobingAbsence = _ReprobingAbsence;
    }

    public int getHoursDuration() {
        return _HoursDuration;
    }

    public void setHoursDuration(int _HoursDuration) {
        this._HoursDuration = _HoursDuration;
    }

    public int getExtraordinayMinimunNote() {
        return _ExtraordinayMinimunNote;
    }

    public void setExtraordinayMinimunNote(int _ExtraordinayMinimunNote) {
        this._ExtraordinayMinimunNote = _ExtraordinayMinimunNote;
    }

    public int getApplyScholarshipDiscounts() {
        return _ApplyScholarshipDiscounts;
    }

    public void setApplyScholarshipDiscounts(int _ApplyScholarshipDiscounts) {
        this._ApplyScholarshipDiscounts = _ApplyScholarshipDiscounts;
    }

    public int getDegreeTest() {
        return _DegreeTest;
    }

    public void setDegreeTest(int _DegreeTest) {
        this._DegreeTest = _DegreeTest;
    }

    public int getProfessionalPractice() {
        return _ProfessionalPractice;
    }

    public void setProfessionalPractice(int _ProfessionalPractice) {
        this._ProfessionalPractice = _ProfessionalPractice;
    }

    public int getAppliesUVirtualRetirement() {
        return _AppliesUVirtualRetirement;
    }

    public void setAppliesUVirtualRetirement(int _AppliesUVirtualRetirement) {
        this._AppliesUVirtualRetirement = _AppliesUVirtualRetirement;
    }
    
    public String toString() {
        return _Description_Subject;
    }
    
    public void ListLevel(JComboBox ComboBox)
    {
        LD.ListSubject(ComboBox);
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
        modeloT.addColumn("Nivel");
        modeloT.addColumn("Creditos");
        modeloT.addColumn("Apertura");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Periodo");
        modeloT.addColumn("Nota Mínima");
        modeloT.addColumn("Hrs Duración");
        modeloT.addColumn("Nota Mín. Extraor");
        modeloT.addColumn("Cupo Mínimo");
        modeloT.addColumn("Tipo Cambio");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[12];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_Subject();
            columna[1] = LD.List().get(i).getDescription();
            columna[2] = LD.List().get(i).getCredits();
            columna[3] = LD.List().get(i).getOpenningDate_Subject();
            columna[4] = LD.List().get(i).getDescription_Subject();
            columna[5] = LD.List().get(i).getPeriod();
            columna[6] = LD.List().get(i).getMinimunNote_Subject();
            columna[7] = LD.List().get(i).getHoursDuration();
            columna[8] = LD.List().get(i).getExtraordinayMinimunNote();
            columna[9] = LD.List().get(i).getMinimunQuote();
            columna[10] = LD.List().get(i).getTypeOfCurrency_Subject();
            columna[11] = LD.List().get(i).getStatus_Subject();
             
            modeloT.addRow(columna);
        }
    }
    
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Subject(), getOpenningDate_Subject(), getStatus_Subject(), 
                getDescription_Subject(), getCredits(), getMinimunNote_Subject(), getMinimunQuote(), 
                getTypeOfCurrency_Subject(), getPeriod(), getReprobingAbsence(), getHoursDuration(), 
                getExtraordinayMinimunNote(), getApplyScholarshipDiscounts(), getDegreeTest(), 
                getProfessionalPractice(), getAppliesUVirtualRetirement(), getID_Level());
        
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
        Response = LD.Update(getID_Subject(), getOpenningDate_Subject(), getStatus_Subject(), 
                getDescription_Subject(), getCredits(), getMinimunNote_Subject(), getMinimunQuote(), 
                getTypeOfCurrency_Subject(), getPeriod(), getReprobingAbsence(), getHoursDuration(), 
                getExtraordinayMinimunNote(), getApplyScholarshipDiscounts(), getDegreeTest(), 
                getProfessionalPractice(), getAppliesUVirtualRetirement(), getID_Level());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Subject());
        return numFA;
    }
    
    
    public void Search(JTable tableG, String Parameters)
    {
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableG.setModel(modeloT);

        //Agregar al modelo las 20 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Nivel");
        modeloT.addColumn("Creditos");
        modeloT.addColumn("Apertura");
        modeloT.addColumn("Descripción");
        modeloT.addColumn("Periodo");
        modeloT.addColumn("Nota Mínima");
        modeloT.addColumn("Hrs Duración");
        modeloT.addColumn("Nota Mín. Extraor");
        modeloT.addColumn("Cupo Mínimo");
        modeloT.addColumn("Tipo Cambio");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[12];

        //numero de registros recuperado desde la db
        int numRegistros = LD.Seacrh(Parameters).size();

        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.Seacrh(Parameters).get(i).getID_Subject();
            columna[1] = LD.Seacrh(Parameters).get(i).getDescription();
            columna[2] = LD.Seacrh(Parameters).get(i).getCredits();
            columna[3] = LD.Seacrh(Parameters).get(i).getOpenningDate_Subject();
            columna[4] = LD.Seacrh(Parameters).get(i).getDescription_Subject();
            columna[5] = LD.Seacrh(Parameters).get(i).getPeriod();
            columna[6] = LD.Seacrh(Parameters).get(i).getMinimunNote_Subject();
            columna[7] = LD.Seacrh(Parameters).get(i).getHoursDuration();
            columna[8] = LD.Seacrh(Parameters).get(i).getExtraordinayMinimunNote();
            columna[9] = LD.Seacrh(Parameters).get(i).getMinimunQuote();
            columna[10] = LD.Seacrh(Parameters).get(i).getTypeOfCurrency_Subject();
            columna[11] = LD.Seacrh(Parameters).get(i).getStatus_Subject();
            
            modeloT.addRow(columna);
        }
    }
    
    public int GetSubajectCredits(String ID_Level)
    {
        int value = LD.GetSubjectCredits(ID_Level);
        return value;
    }
}
