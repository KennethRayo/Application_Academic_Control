/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_BranchOffice;
import javax.swing.JComboBox;

/**
 *
 * @author KGR
 */
public class LB_BranchOffice {
    private String _ID_BranchOffice;
    private String _Description_BranchOffice;
    private String _Country_BranchOffice;
    private String _Province_BranchOffice;
    private String _District_BranchOffice;
    private String _Canton_BranchOffice;
    private String _Status_BranchOffice;

    public LB_BranchOffice(String _ID_BranchOffice, String _Description_BranchOffice, 
            String _Country_BranchOffice, String _Province_BranchOffice, 
            String _District_BranchOffice, String _Canton_BranchOffice, 
            String _Status_BranchOffice) {
        this._ID_BranchOffice = _ID_BranchOffice;
        this._Description_BranchOffice = _Description_BranchOffice;
        this._Country_BranchOffice = _Country_BranchOffice;
        this._Province_BranchOffice = _Province_BranchOffice;
        this._District_BranchOffice = _District_BranchOffice;
        this._Canton_BranchOffice = _Canton_BranchOffice;
        this._Status_BranchOffice = _Status_BranchOffice;
    }

    LD_BranchOffice LD = new LD_BranchOffice();
    public String getID_BranchOffice() {
        return _ID_BranchOffice;
    }

    public void setID_BranchOffice(String _ID_BranchOffice) {
        this._ID_BranchOffice = _ID_BranchOffice;
    }

    public String getDescription_BranchOffice() {
        return _Description_BranchOffice;
    }

    public void setDescription_BranchOffice(String _Description_BranchOffice) {
        this._Description_BranchOffice = _Description_BranchOffice;
    }

    public String getCountry_BranchOffice() {
        return _Country_BranchOffice;
    }

    public void setCountry_BranchOffice(String _Country_BranchOffice) {
        this._Country_BranchOffice = _Country_BranchOffice;
    }

    public String getProvince_BranchOffice() {
        return _Province_BranchOffice;
    }

    public void setProvince_BranchOffice(String _Province_BranchOffice) {
        this._Province_BranchOffice = _Province_BranchOffice;
    }

    public String getDistrict_BranchOffice() {
        return _District_BranchOffice;
    }

    public void setDistrict_BranchOffice(String _District_BranchOffice) {
        this._District_BranchOffice = _District_BranchOffice;
    }

    public String getCanton_BranchOffice() {
        return _Canton_BranchOffice;
    }

    public void setCanton_BranchOffice(String _Canton_BranchOffice) {
        this._Canton_BranchOffice = _Canton_BranchOffice;
    }

    public String getStatus_BranchOffice() {
        return _Status_BranchOffice;
    }

    public void setStatus_BranchOffice(String _Status_BranchOffice) {
        this._Status_BranchOffice = _Status_BranchOffice;
    }
    
    public String toString() {
        return _Description_BranchOffice;
    }

    public LB_BranchOffice() {}
    
    public void ListBranchOfficeCBO(JComboBox cmbCombo)
    {
        LD.ListBranchOfficeCBO(cmbCombo);
    }
}
