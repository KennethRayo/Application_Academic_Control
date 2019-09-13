/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Person;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_Person 
{
    private String _ID_Person;
    private String _Name_Person;
    private String _Surname_Person;
    private String _Lastname_Person;
    private String _IdentificationType_Person;
    private String _Identification_Person;
    private String _Gender_Person;
    private String _Birthday_Person;
    private String _Country_Person;
    private String _Province_Person;
    private String _District_Person;
    private String _Canton_Person;
    private String _BranchOffice_Person;
    private String _CivilStatus_Person;
    private String _CellPhone_Person;
    private String _Email_Person;
    private String _HomeAddress_Person;
    private String _Status_Person;
    public String Response;
    public int eye;

    public LB_Person(String _ID_Person, String _Name_Person, String _Surname_Person,
            String _Lastname_Person, String _IdentificationType_Person, 
            String _Identification_Person, String _Gender_Person, String _Birthday_Person,
            String _Country_Person, String _Province_Person, String _District_Person, 
            String _Canton_Person, String _BranchOffice_Person, String _CivilStatus_Person, String _CellPhone_Person, 
            String _Email_Person, String _HomeAddress_Person, String _Status_Person) 
    {
        this._ID_Person = _ID_Person;
        this._Name_Person = _Name_Person;
        this._Surname_Person = _Surname_Person;
        this._Lastname_Person = _Lastname_Person;
        this._IdentificationType_Person = _IdentificationType_Person;
        this._Identification_Person = _Identification_Person;
        this._Gender_Person = _Gender_Person;
        this._Birthday_Person = _Birthday_Person;
        this._Country_Person = _Country_Person;
        this._Province_Person = _Province_Person;
        this._District_Person = _District_Person;
        this._Canton_Person = _Canton_Person;
        this._BranchOffice_Person = _BranchOffice_Person;
        this._CivilStatus_Person = _CivilStatus_Person;
        this._CellPhone_Person = _CellPhone_Person;
        this._Email_Person = _Email_Person;
        this._HomeAddress_Person = _HomeAddress_Person;
        this._Status_Person = _Status_Person;
    }
    
    LD_Person LD = new LD_Person();
    public LB_Person() {}

    public String getID_Person() {
        return _ID_Person;
    }

    public void setID_Person(String _ID_Person) {
        this._ID_Person = _ID_Person;
    }

    public String getName_Person() {
        return _Name_Person;
    }

    public void setName_Person(String _Name_Person) {
        this._Name_Person = _Name_Person;
    }

    public String getSurname_Person() {
        return _Surname_Person;
    }

    public void setSurname_Person(String _Surname_Person) {
        this._Surname_Person = _Surname_Person;
    }

    public String getLastname_Person() {
        return _Lastname_Person;
    }

    public void setLastname_Person(String _Lastname_Person) {
        this._Lastname_Person = _Lastname_Person;
    }
    
    public String getIdentificationType_Person() {
        return _IdentificationType_Person;
    }

    public void setIdentificationType_Person(String _IdentificationType_Person) {
        this._IdentificationType_Person = _IdentificationType_Person;
    }

    public String getIdentification_Person() {
        return _Identification_Person;
    }

    public void setIdentification_Person(String _Identification_Person) {
        this._Identification_Person = _Identification_Person;
    }

    public String getGender_Person() {
        return _Gender_Person;
    }

    public void setGender_Peron(String _Gender_Peron) {
        this._Gender_Person = _Gender_Peron;
    }

    public String getBirthday_Person() {
        return _Birthday_Person;
    }

    public void setBirthday_Person(String _Birthday_Person) {
        this._Birthday_Person = _Birthday_Person;
    }

    public String getCountry_Person() {
        return _Country_Person;
    }

    public void setCountry_Person(String _Country_Person) {
        this._Country_Person = _Country_Person;
    }

    public String getProvince_Person() {
        return _Province_Person;
    }

    public void setProvince_Person(String _Province_Person) {
        this._Province_Person = _Province_Person;
    }

    public String getCanton_Person() {
        return _Canton_Person;
    }

    public void setCanton_Person(String _Canton_Peron) {
        this._Canton_Person = _Canton_Peron;
    }

    public String getDistrict_Person() {
        return _District_Person;
    }

    public void setDistrict_Person(String _District_Person) {
        this._District_Person = _District_Person;
    }

    public String getCivilStatus_Person() {
        return _CivilStatus_Person;
    }

    public void setCivilStatus_Person(String _CivilStatus_Person) {
        this._CivilStatus_Person = _CivilStatus_Person;
    }

    public String getCellPhone_Person() {
        return _CellPhone_Person;
    }

    public void setCellPhone_Person(String _CellPhone_Person) {
        this._CellPhone_Person = _CellPhone_Person;
    }

    public String getEmail_Person() {
        return _Email_Person;
    }

    public void setEmail_Person(String _Email_Person) {
        this._Email_Person = _Email_Person;
    }

    public String getHomeAddress_Person() {
        return _HomeAddress_Person;
    }

    public void setHomeAddress_Person(String _HomeAddress_Person) {
        this._HomeAddress_Person = _HomeAddress_Person;
    }

    public String getState_Person() {
        return _Status_Person;
    }

    public void setState_Person(String _Status_Person) {
        this._Status_Person = _Status_Person;
    }
    
    public String getBranchOffice_Person() {
        return _BranchOffice_Person;
    }

    public void setBranchOffice_Person(String _BranchOffice_Person) {
        this._BranchOffice_Person = _BranchOffice_Person;
    }
    
    public String toString() {
        return _Name_Person + " (" + _ID_Person + ")";
    }
    
     //Llenar tabla
    public void List(JTable tableD)
    {
        //LD_Category LD = new LD_Category();
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableD.setModel(modeloT);
        
        //Agregar al modelo las 17 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Nombre");
        modeloT.addColumn("PApellido");
        modeloT.addColumn("SApellido");
        /*modeloT.addColumn("TIdentificación");*/
        modeloT.addColumn("Identificación");
        /*modeloT.addColumn("Género");*/
        modeloT.addColumn("Cumpleaño");
        modeloT.addColumn("Pais");
        modeloT.addColumn("Provincia");
        modeloT.addColumn("Distrito");
        modeloT.addColumn("Canton");
        modeloT.addColumn("Sede");
        /*modeloT.addColumn("ECivil");*/
        modeloT.addColumn("TeléfonoM");
        modeloT.addColumn("Email");
        modeloT.addColumn("DirecciónC");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[15];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_Person();
            columna[1] = LD.List().get(i).getName_Person();
            columna[2] = LD.List().get(i).getSurname_Person();
            columna[3] = LD.List().get(i).getLastname_Person();
            /*columna[4] = LD.List().get(i).getIdentificationType_Person();*/
            columna[4] = LD.List().get(i).getIdentification_Person();
            /*columna[6] = LD.List().get(i).getGender_Person();*/
            columna[5] = LD.List().get(i).getBirthday_Person();
            columna[6] = LD.List().get(i).getCountry_Person();
            columna[7] = LD.List().get(i).getProvince_Person();
            columna[8] = LD.List().get(i).getDistrict_Person();
            columna[9] = LD.List().get(i).getCanton_Person();
            columna[10] = LD.List().get(i).getBranchOffice_Person();
            /*columna[13] = LD.List().get(i).getCivilStatus_Person();*/
            columna[11] = LD.List().get(i).getCellPhone_Person();
            columna[12] = LD.List().get(i).getEmail_Person();
            columna[13] = LD.List().get(i).getHomeAddress_Person();
            columna[14] = LD.List().get(i).getState_Person();
            
            modeloT.addRow(columna);
        }
    }
    
     public void ListPerson(JComboBox cmbCombo)
    {
        LD.ListPerson(cmbCombo);
    }
     
    public void SearchPersonEnabled(JComboBox cmbCombo, String parameters)
    {
        LD.SearchPersonEnabled(cmbCombo, parameters);
    }
     
     public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Person(), getName_Person(), getSurname_Person(), 
                    getLastname_Person(), getIdentificationType_Person(), 
                    getIdentification_Person(), getGender_Person(), getBirthday_Person(), 
                    getCountry_Person(), getProvince_Person(), getDistrict_Person(), 
                    getCanton_Person(), getBranchOffice_Person(), getCivilStatus_Person(), getCellPhone_Person(), 
                    getEmail_Person(), getHomeAddress_Person(), getState_Person());
        return rptaRegistro;
    }
     
    public String Update()
    {
        Response = LD.Update(getID_Person(), getName_Person(), getSurname_Person(), 
                    getLastname_Person(), getIdentificationType_Person(), 
                    getIdentification_Person(), getGender_Person(), getBirthday_Person(), 
                    getCountry_Person(), getProvince_Person(), getDistrict_Person(), 
                    getCanton_Person(), getBranchOffice_Person(), getCivilStatus_Person(), getCellPhone_Person(), 
                    getEmail_Person(), getHomeAddress_Person(), getState_Person());
        eye = LD.eye;
//        JOptionPane.showMessageDialog(null, getID_Person() + "\n" + getName_Person()+ "\n" + getSurname_Person()+ "\n" + 
//                    getLastname_Person()+ "\n" + getIdentificationType_Person()+ "\n" + 
//                    getIdentification_Person()+ "\n" + getGender_Person()+ "\n" + getBirthday_Person()+ "\n" + 
//                    getPlaceOfBirth_Person()+ "\n" + getCountry_Person()+ "\n" + getProvince_Person()+ "\n" +
//                    getCanton_Person()+ "\n" + getDistrict_Person()+ "\n" + getCivilStatus_Person()+ "\n" +
//                    getHomePhone_Person()+ "\n" + getCellPhone_Person()+ "\n" + getPostalMail()+ "\n" +
//                    getEmail_Person()+ "\n" + getHomeAddress_Person()+ "\n" + getState_Person() + "\n" 
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Person());
        Response = LD.Response;
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
        modeloT.addColumn("PApellido");
        modeloT.addColumn("SApellido");
        /*modeloT.addColumn("TIdentificación");*/
        modeloT.addColumn("Identificación");
        /*modeloT.addColumn("Género");*/
        modeloT.addColumn("Cumpleaño");
        modeloT.addColumn("Pais");
        modeloT.addColumn("Provincia");
        modeloT.addColumn("Distrito");
        modeloT.addColumn("Canton");
        modeloT.addColumn("Sede");
        /*modeloT.addColumn("ECivil");*/
        modeloT.addColumn("TeléfonoM");
        modeloT.addColumn("Email");
        modeloT.addColumn("DirecciónC");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[15];

        //numero de registros recuperado desde la db
        int numRegistros = LD.Seacrh(Parameters).size();

        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.Seacrh(Parameters).get(i).getID_Person();
            columna[1] = LD.Seacrh(Parameters).get(i).getName_Person();
            columna[2] = LD.Seacrh(Parameters).get(i).getSurname_Person();
            columna[3] = LD.Seacrh(Parameters).get(i).getLastname_Person();
            /*columna[4] = LD.Seacrh(Parameters).get(i).getIdentificationType_Person();*/
            columna[4] = LD.Seacrh(Parameters).get(i).getIdentification_Person();
            /*columna[6] = LD.Seacrh(Parameters).get(i).getGender_Person();*/
            columna[5] = LD.Seacrh(Parameters).get(i).getBirthday_Person();
            columna[6] = LD.Seacrh(Parameters).get(i).getCountry_Person();
            columna[7] = LD.Seacrh(Parameters).get(i).getProvince_Person();
            columna[8] = LD.Seacrh(Parameters).get(i).getDistrict_Person();
            columna[9] = LD.Seacrh(Parameters).get(i).getCanton_Person();
            columna[10] = LD.Seacrh(Parameters).get(i).getBranchOffice_Person();
            /*columna[13] = LD.Seacrh(Parameters).get(i).getCivilStatus_Person();*/
            columna[11] = LD.Seacrh(Parameters).get(i).getCellPhone_Person();
            columna[12] = LD.Seacrh(Parameters).get(i).getEmail_Person();
            columna[13] = LD.Seacrh(Parameters).get(i).getHomeAddress_Person();
            columna[14] = LD.Seacrh(Parameters).get(i).getState_Person();

            modeloT.addRow(columna);
        }
    }
    
//    public DefaultTableModel Statistics_UAD(String Query)
//    {
//        DefaultTableModel MyModel = null;
//        MyModel = LD.Statistics_UAD(Query);
//        return MyModel;
//    }
    
    public void ListCIFTypeDirector(JComboBox ComboBox)
    {
        LD.ListCIFTypeDirector(ComboBox);
    }
    
    public DefaultTableModel Statistics_GenderPerson_UAD()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_GenderPerson_UAD();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_CountryPerson_UAD()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_CountryPerson_UAD();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_ProvincePerson_UAD()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_ProvincePerson_UAD();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_DistrictPerson_UAD()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_DistrictPerson_UAD();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_CantonPerson_UAD()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_CantonPerson_UAD();
        return MyModel;
    }
    
    public DefaultTableModel Statistics_CivilStatusPerson_UAD()
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_CivilStatusPerson_UAD();
        return MyModel;
    }
    
    
    
    
    public DefaultTableModel Statistics_GenderPerson_BO_UAD(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_GenderPerson_BO_UAD(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_CountryPerson_BO_UAD(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_CountryPerson_BO_UAD(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_ProvincePerson_BO_UAD(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_ProvincePerson_BO_UAD(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_DistrictPerson_BO_UAD(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_DistrictPerson_BO_UAD(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_CantonPerson_BO_UAD(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_CantonPerson_BO_UAD(ID_BranchOffice);
        return MyModel;
    }
    
    public DefaultTableModel Statistics_CivilStatusPerson_BO_UAD(String ID_BranchOffice)
    {
        DefaultTableModel MyModel = null;
        MyModel = LD.Statistics_CivilStatusPerson_BO_UAD(ID_BranchOffice);
        return MyModel;
    }

}
