/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Person;
import Layer_Data.LD_User;
import javax.swing.JComboBox;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author KGR
 */
public class LB_User extends LB_Person 
{
    LD_User LD =  new LD_User();
    LD_Person LDP =  new LD_Person();
    public int eye;
    public String Response;
    public String NamePerson;
    public String NameProfile;
    public String IDPerson;
    public boolean dbrows = false;
    
    private String _Password_User;
    private String _ID_Profile;
    //public LB_User(){}
    
    public LB_User(String _ID_Person, String _Password_User, String _ID_Profile) 
    {
        super( _ID_Person, null, null, null,
             null, null, 
             null, null, null,
             null, null, null, 
             null, null, null, 
             null, null, null);
        this._Password_User = _Password_User;
    }
    
    public LB_User(){}
 
    public String getPassword_User() {
        return _Password_User;
    }

    public void setPassword_User(String _Password_User) {
        this._Password_User = _Password_User;
    }
    
    public String toString() {
        return _Password_User;
    }
    
    public String getID_Profile() {
        return _ID_Profile;
    }

    public void setID_Profile(String _ID_Profile) {
        this._ID_Profile = _ID_Profile;
    }
     
    public String CheckUser()
    {
        Response = LD.CheckUser();
        dbrows = LD.dbrows;
        return Response;
    }
     
    public String LogIn()
    {
        eye = 0; 
        String INI = LD.LogIn(getEmail_Person(), getPassword_User());
       if (LD.eye > 0)
       {
            eye = 100;
            NamePerson = LD.NamePerson; 
            NameProfile = LD.NameProfile;
            IDPerson = LD.IDPerson;
       }
        else
       {
            Response = LD.Response;   
       }
        return INI;
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
        modeloT.addColumn("Contraseña");
        modeloT.addColumn("Email");
        modeloT.addColumn("Nombre");
        modeloT.addColumn("Perfil");
        modeloT.addColumn("Estado");
        
       
        Object[] columna = new Object[6];
        
        //numero de registros recuperado desde la db
        int numRegistros = LD.List().size();
        
        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.List().get(i).getID_Person();
            columna[1] = LD.List().get(i).getPassword_User();
            columna[2] = LD.List().get(i).getEmail_Person();
            columna[3] = LD.List().get(i).getName_Person();
            columna[4] = LD.List().get(i).getID_Profile();
            columna[5] = LD.List().get(i).getState_Person();
            
            modeloT.addRow(columna);
        }
    }
    
    public void SearchUser(JTable tableG, String Parameters)
    {
        DefaultTableModel modeloT = new DefaultTableModel();
        //agreagar el modelo a la tablaD
        tableG.setModel(modeloT);

        //Agregar al modelo las 20 columnas
        modeloT.addColumn("ID");
        modeloT.addColumn("Contraseña");
        modeloT.addColumn("Email");
        modeloT.addColumn("Nombre");
        modeloT.addColumn("Perfil");
        modeloT.addColumn("Estado");
       
        Object[] columna = new Object[6];

        //numero de registros recuperado desde la db
        int numRegistros = LD.SeacrhUser(Parameters).size();

        for (int i = 0; i < numRegistros; i++) 
        {
            columna[0] = LD.SeacrhUser(Parameters).get(i).getID_Person();
            columna[1] = LD.SeacrhUser(Parameters).get(i).getPassword_User();
            columna[2] = LD.SeacrhUser(Parameters).get(i).getEmail_Person();
            columna[3] = LD.SeacrhUser(Parameters).get(i).getName_Person();
            columna[4] = LD.SeacrhUser(Parameters).get(i).getID_Profile();
            columna[5] = LD.SeacrhUser(Parameters).get(i).getState_Person();
            
            modeloT.addRow(columna);
        }
    }
    
    public void SearchPersonEnabled(JComboBox ComboBox, String Parameters) //Localized in LD_Person
    {
        LDP.SearchPersonEnabled(ComboBox, Parameters);
    }
    
    public String InsertUser(String IdProfile)
    {
        //JOptionPane.showMessageDialog(null, "User " + "\n" + getID_Person() + "\n" + getPassword_User() + "\n" + IdProfile, "AA Control - SignIn", JOptionPane.INFORMATION_MESSAGE);
        Response = LD.InsertUser(getID_Person(), getPassword_User(), IdProfile);
        IDPerson = LD.IDPerson;
        return Response;
    }
    
    public String UpdateUser(String IdProfile)
    {
        //JOptionPane.showMessageDialog(null, "User " + "\n" + getID_Person() + "\n" + getPassword_User() + "\n" + IdProfile, "AA Control - SignIn", JOptionPane.INFORMATION_MESSAGE);
        Response = LD.UpdateUser(getID_Person(), getPassword_User(), IdProfile);
        IDPerson = LD.IDPerson;
        return Response;
    }
    
    public String DeleteUser()
    {
        //JOptionPane.showMessageDialog(null, "User " + "\n" + getID_Person() + "\n" + getPassword_User() + "\n" + IdProfile, "AA Control - SignIn", JOptionPane.INFORMATION_MESSAGE);
        Response = LD.DeleteUser(getID_Person());
        IDPerson = LD.IDPerson;
        return Response;
    }

    
}
