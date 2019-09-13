/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_District;
import javax.swing.JComboBox;

/**
 *
 * @author KGR
 */
public class LB_District extends LB_Province{
    private String _ID_District;
    private String _Description_District;

    public LB_District(String _ID_District, String _Description_District, String ID_Province) {
        super (ID_Province, null, null);
        this._ID_District = _ID_District;
        this._Description_District = _Description_District;
    }

    public String getID_District() {
        return _ID_District;
    }

    public void setID_District(String _ID_District) {
        this._ID_District = _ID_District;
    }

    public String getDescription_District() {
        return _Description_District;
    }

    public void setDescription_District(String _Description_District) {
        this._Description_District = _Description_District;
    }
    
    public String toString() {
        return _Description_District;
    }
    
    LD_District LD = new LD_District();
    public LB_District() {}
    
    public void ListDistrict(JComboBox ComboBox)
    {
        LD.ListDistrict(ComboBox, getID_Province());
    }
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_District(), getDescription_District(), getID_Province());
//                JOptionPane.showMessageDialog(null, getID_Career() + "\n" + getDescription_Career()+ "\n" + 
//                    getID_Person()+ "\n" + getOpeningDate_Career()+ "\n" + 
//                    getState_Career()
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return rptaRegistro;
        
    }
    
    public String Update()
    {
        Response = LD.Update(getID_District(), getDescription_District(), getID_Province());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_District());
        return numFA;
    }
    
    public void SearchDistrict(JComboBox ComboBox, String Parameters) //Localized in LD_Person
    {
        LD.SearchDistrict(ComboBox, Parameters, getID_Province());
    }
}
