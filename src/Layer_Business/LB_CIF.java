/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_CIF;
import Layer_Data.LD_Person;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_CIF extends LB_Person  {

    private String _PaymentMethod_CIF;
    private String _Denomination_CIF;
    private String _DateOfAdmission_CIF;
    private String _TypeOfCurrency_CIF;
    private String _ID_CIF_CIFType;
    private String _ID_CIFType;
    private String _Description_CIFType;
    private String _Classification_CIF;
    
    
    public LB_CIF(String _PaymentMethod_CIF, String _Denomination_CIF, 
            String _DateOfAdmission_CIF,  String _TypeOfCurrency_CIF, String _ID_CIF_CIFType,
            String _ID_CIFType, 
            String _Description_CIFType, String _Classification_CIF, String _ID_Person, 
            String _Name_Person, String _Surname_Person, String _Lastname_Person, 
            String _IdentificationType_Person, String _Identification_Person, 
            String _Gender_Peron, String _Birthday_Person, String _PlaceOfBirth_Person, 
            String _Country_Person, String _Province_Person, String _District_Person, 
            String _Canton_Person, String _BranchOffice_Person, String _CivilStatus_Person, 
            String _HomePhone_Person, String _CellPhone_Person, String _PostalMail, 
            String _Email_Person, String _HomeAddress_Person, String _State_Person) 
    {
        super(_ID_Person, _Name_Person, _Surname_Person, _Lastname_Person, 
                _IdentificationType_Person, _Identification_Person,
                _Gender_Peron, _Birthday_Person,_Country_Person, _Province_Person,
                _District_Person, _Canton_Person, _BranchOffice_Person,  _CivilStatus_Person, 
                _CellPhone_Person, _Email_Person, _HomeAddress_Person, _State_Person);
        this._PaymentMethod_CIF = _PaymentMethod_CIF;
        this._Denomination_CIF = _Denomination_CIF;
        this._DateOfAdmission_CIF = _DateOfAdmission_CIF;
        this._TypeOfCurrency_CIF = _TypeOfCurrency_CIF;
        this._ID_CIFType = _ID_CIFType;
        this._Description_CIFType = _Description_CIFType;
        this._Classification_CIF = _Classification_CIF;
        
    }
    
    LD_CIF LD = new LD_CIF();
    LD_Person LDP = new LD_Person();
    public LB_CIF() {}

    public String getPaymentMethod_CIF() {
        return _PaymentMethod_CIF;
    }

    public void setPaymentMethod_CIF(String _PaymentMethod_CIF) {
        this._PaymentMethod_CIF = _PaymentMethod_CIF;
    }

    public String getDenomination_CIF() {
        return _Denomination_CIF;
    }

    public void setDenomination_CIF(String _Denomination_CIF) {
        this._Denomination_CIF = _Denomination_CIF;
    }

    public String getDateOfAdmission_CIF() {
        return _DateOfAdmission_CIF;
    }

    public void setDateOfAdmission_CIF(String _DateOfAdmission_CIF) {
        this._DateOfAdmission_CIF = _DateOfAdmission_CIF;
    }

    public String getTypeOfCurrency_CIF() {
        return _TypeOfCurrency_CIF;
    }

    public void setTypeOfCurrency_CIF(String _TypeOfCurrency_CIF) {
        this._TypeOfCurrency_CIF = _TypeOfCurrency_CIF;
    }
    
    public String toString() {
        return _Description_CIFType;
    }

    public String getDescription_CIFType() {
        return _Description_CIFType;
    }

    public void setDescription_CIFType(String _Description_CIFType) {
        this._Description_CIFType = _Description_CIFType;
    }

    public String getClassification() {
        return _Classification_CIF;
    }

    public void setClassification(String _Classification) {
        this._Classification_CIF = _Classification;
    }
    
    public String getID_CIFType() {
        return _ID_CIFType;
    }

    public void setID_CIFType(String _CIFType) {
        this._ID_CIFType = _CIFType;
    }
    
    public String getID_CIF_CIFType() {
        return _ID_CIF_CIFType;
    }

    public void setID_CIF_CIFType(String _ID_CIF_CIFType) {
        this._ID_CIF_CIFType = _ID_CIF_CIFType;
    }
    
     public void ListCIFType(JComboBox ComboBox)
    {
        LD.ListCIFType(ComboBox);
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
        modeloT.addColumn("Nombre");
        modeloT.addColumn("MPago");
        modeloT.addColumn("Denominación");
        modeloT.addColumn("Admisión");
        modeloT.addColumn("Clasificación");
        modeloT.addColumn("Moneda");
       
        Object[] columna = new Object[7];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_Person();
            columna[1] = LD.List().get(i).getName_Person();
            columna[2] = LD.List().get(i).getPaymentMethod_CIF();
            columna[3] = LD.List().get(i).getDenomination_CIF();
            columna[4] = LD.List().get(i).getDateOfAdmission_CIF();
            columna[5] = LD.List().get(i).getClassification();
            columna[6] = LD.List().get(i).getTypeOfCurrency_CIF();
                       
            modeloT.addRow(columna);
        }
    }
    
     
    
    public String Insert(String _IDCIFType, String _IDCIF_CIFType)
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Person(), getPaymentMethod_CIF(), 
                     getDenomination_CIF(), getDateOfAdmission_CIF(), 
                     getClassification(), getTypeOfCurrency_CIF(), _IDCIFType, 
                     _IDCIF_CIFType);
//        JOptionPane.showMessageDialog(null, getID_Person() + "\n" + getPaymentMethod_CIF()+ "\n" + getDenomination_CIF()+ "\n" + 
//                    getDateOfAdmission_CIF()+ "\n" + getClassification()+ "\n" + 
//                    getTypeOfCurrency_CIF()+ "\n" + _IDCIFType+ "\n" + _IDCIF_CIFType
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return rptaRegistro;
    }
    
    public String InsertCIF_CIFType(String _IDCIFType, String _ID_Person, String _IDCIF_CIFType)
    {
        String rptaRegistro = null;
        rptaRegistro = LD.InsertCIF_CIFType(_IDCIFType, _ID_Person, 
                     _IDCIF_CIFType);
//        System.out.println(_IDCIFType);
//        System.out.println("\n");
//        System.out.println(_ID_Person);
//        System.out.println("\n");
//        System.out.println(_IDCIF_CIFType);

        return rptaRegistro;
    }
    
    public String UpdateCIF(String _IDCIFType)
    {
        Response = LD.UpdateCIF(getID_Person(), getPaymentMethod_CIF(), 
                     getDenomination_CIF(), getDateOfAdmission_CIF(), 
                     getClassification(), getTypeOfCurrency_CIF(), _IDCIFType);
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Person());
        return numFA;
    }
    
    public int DeleteCif_CifType()
    {
       int numFA = 0;
       numFA = LD.DeleteCif_CifType(getID_CIF_CIFType());
       return numFA;
    }
    
    public void Search(JTable tableG, String Parameters)
    {
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableG.setModel(modeloT);

        //Agregar al modelo las 20 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Nombre");
        modeloT.addColumn("MPago");
        modeloT.addColumn("Denominación");
        modeloT.addColumn("Admisión");
        modeloT.addColumn("Clasificación");
        modeloT.addColumn("Moneda");
       
        Object[] columna = new Object[7];

        //numero de registros recuperado desde la db
        int numRegistros = LD.Seacrh(Parameters).size();

        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.Seacrh(Parameters).get(i).getID_Person();
            columna[1] = LD.Seacrh(Parameters).get(i).getName_Person();
            columna[2] = LD.Seacrh(Parameters).get(i).getPaymentMethod_CIF();
            columna[3] = LD.Seacrh(Parameters).get(i).getDenomination_CIF();
            columna[4] = LD.Seacrh(Parameters).get(i).getDateOfAdmission_CIF();
            columna[5] = LD.Seacrh(Parameters).get(i).getClassification();
            columna[6] = LD.Seacrh(Parameters).get(i).getTypeOfCurrency_CIF();

            modeloT.addRow(columna);
        }
    }
    
    public void ListCIF_CIFType(JTable tableD, String Parameter)
    {
        //LD_Category LD = new LD_Category();
        DefaultTableModel modeloT3 = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableD.setModel(modeloT3);
        
        //Agregar al modelo las 20 columnas
        modeloT3.addColumn("ID");
        modeloT3.addColumn("Tipo_CIF");
       
        Object[] columna = new Object[2];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.ListCIF_CIFType(Parameter).size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.ListCIF_CIFType(Parameter).get(i).getID_CIF_CIFType();
            columna[1] = LD.ListCIF_CIFType(Parameter).get(i).getDescription_CIFType();
                       
            modeloT3.addRow(columna);
        }
    }
    
    public DefaultTableModel Statistics_PersonDirector_CIF()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_PersonDirector_CIF();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_PaymentMethod_CIF()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_PaymentMethod_CIF();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_Classification_CIF()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_Classification_CIF();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_Denomination_CIF()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_Denomination_CIF();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_TypeOfCurrency_CIF()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_TypeOfCurrency_CIF();
        return MyModel;
    }
    
    
    
    public DefaultTableModel Statistics_PersonDirector_BO_CIF(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_PersonDirector_BO_CIF(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_PaymentMethod_BO_CIF(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_PaymentMethod_BO_CIF(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_Classification_BO_CIF(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_Classification_BO_CIF(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_Denomination_BO_CIF(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_Denomination_BO_CIF(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_TypeOfCurrency_BO_CIF(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_TypeOfCurrency_BO_CIF(ID_BranchOffice);
        return MyModel;
    }
}
