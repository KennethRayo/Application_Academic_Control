/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Province;
import javax.swing.JComboBox;

/**
 *
 * @author KGR
 */
public class LB_Province extends LB_Country{
    private String _ID_Province;
    private String _Description_Province;

    public LB_Province(String _ID_Province, String _Description_Province, String ID_Country) {
        super (ID_Country, null);
        this._ID_Province = _ID_Province;
        this._Description_Province = _Description_Province;
    }

    public String getID_Province() {
        return _ID_Province;
    }

    public void setID_Province(String _ID_Province) {
        this._ID_Province = _ID_Province;
    }

    public String getDescription_Province() {
        return _Description_Province;
    }

    public void setDescription_Province(String _Description_Province) {
        this._Description_Province = _Description_Province;
    }
    
    public String toString() {
        return _Description_Province;
    }
    
    LD_Province LD = new LD_Province();
    public LB_Province() {}
    
    public void ListProvince(JComboBox ComboBox)
    {
        LD.ListProvince(ComboBox, getID_Country());
    }
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Province(), getDescription_Province(), getID_Country());
//                JOptionPane.showMessageDialog(null, getID_Career() + "\n" + getDescription_Career()+ "\n" + 
//                    getID_Person()+ "\n" + getOpeningDate_Career()+ "\n" + 
//                    getState_Career()
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return rptaRegistro;
        
    }
    
    public String Update()
    {
        Response = LD.Update(getID_Province(), getDescription_Province(), getID_Country());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Province());
        return numFA;
    }
    
    public void SearchProvince(JComboBox ComboBox, String Parameters) //Localized in LD_Person
    {
        LD.SearchProvince(ComboBox, Parameters, getID_Country());
    }
    
}
