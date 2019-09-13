/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Canton;
import javax.swing.JComboBox;

/**
 *
 * @author KGR
 */
public class LB_Canton extends LB_District {
    private String _ID_Canton;
    private String _Description_Canton;

    public LB_Canton(String _ID_Canton, String _Description_Canton, String ID_District) {
        super (ID_District, null, null);
        this._ID_Canton = _ID_Canton;
        this._Description_Canton = _Description_Canton;
    }

    public String getID_Canton() {
        return _ID_Canton;
    }

    public void setID_Canton(String _ID_Canton) {
        this._ID_Canton = _ID_Canton;
    }

    public String getDescription_Canton() {
        return _Description_Canton;
    }

    public void setDescription_Canton(String _Description_Canton) {
        this._Description_Canton = _Description_Canton;
    }
    
    public String toString() {
        return _Description_Canton;
    }
    
    LD_Canton LD = new LD_Canton();
    public LB_Canton() {}
    
    public void ListCanton(JComboBox ComboBox)
    {
        LD.ListCanton(ComboBox, getID_District());
    }
    
    public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Canton(), getDescription_Canton(), getID_District());
//                JOptionPane.showMessageDialog(null, getID_Career() + "\n" + getDescription_Career()+ "\n" + 
//                    getID_Person()+ "\n" + getOpeningDate_Career()+ "\n" + 
//                    getState_Career()
//                , "I&S Application - Product", JOptionPane.WARNING_MESSAGE);
        return rptaRegistro;
        
    }
    
    public String Update()
    {
        Response = LD.Update(getID_Canton(), getDescription_Canton(), getID_District());
        eye = LD.eye;
        return Response;
    }
    
    public int Delete()
    {
        int numFA = 0;
        numFA = LD.Delete(getID_Canton());
        return numFA;
    }
    
    public void SearchCanton(JComboBox ComboBox, String Parameters) //Localized in LD_Person
    {
        LD.SearchCanton(ComboBox, Parameters, getID_District());
    }
    
    
}
