/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Database;

/**
 *
 * @author KGR
 */
public class LB_Database {

    LD_Database LD = new LD_Database();
    public String Response;
    
    public LB_Database() {}
    
    public String ExportDB(String URL_MySQLDump, String URL, String Name)
    {
        Response = LD.ExportDB(URL_MySQLDump,URL,Name);
        return Response;
    }
}
