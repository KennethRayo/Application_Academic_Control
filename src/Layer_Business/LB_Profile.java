/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Profile;
import javax.swing.JComboBox;

/**
 *
 * @author KGR
 */
public class LB_Profile 
{
    LD_Profile LD =  new LD_Profile();
    public int eye;
    public String Response;
    public boolean dbrows = false;
    
    private String _ID_Profile;
    private String _Name_Profile;
    private String _State_Profile;

    public LB_Profile(String _ID_Profile, String _Name_Profile, String _State_Profile) 
    {
        this._ID_Profile = _ID_Profile;
        this._Name_Profile = _Name_Profile;
        this._State_Profile = _State_Profile;
    }
    
    public LB_Profile(){}
    
    public String getID_Profile() {
        return _ID_Profile;
    }

    public void setID_Profile(String _ID_Profile) {
        this._ID_Profile = _ID_Profile;
    }

    public String getName_Profile() {
        return _Name_Profile;
    }

    public void setName_Profile(String _Name_Profile) {
        this._Name_Profile = _Name_Profile;
    }

    public String getState_Profile() {
        return _State_Profile;
    }

    public void setState_Profile(String _State_Profile) {
        this._State_Profile = _State_Profile;
    }
    
    public String toString() {
        return _Name_Profile;
    }
     
     public String CheckProfile()
    {
        Response = LD.CheckProfile();
        dbrows = LD.dbrows;
        return Response;
    }
     
      public void ListProfile(JComboBox cmbCombo)
    {
        LD.ListProfile(cmbCombo);
    }
      
      public String Insert()
    {
        String rptaRegistro = null;
        rptaRegistro = LD.Insert(getID_Profile(), getName_Profile(), getState_Profile());
        return rptaRegistro;
    }
    
}
