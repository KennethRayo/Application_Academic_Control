/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Data;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author KGR
 */
public class LD_Connection 
{
    private static String us = "KGRSystems";
    private static String pass = "08093005";
    private static String db = "aac";
    private static String url = "jdbc:mysql://localhost:3306/" + db;
    
    public static String getUs()
    {
      return us;
    }

    public static String getPass()
    {
      return pass;
    }

    public static String getBd()
    {
      return db;
    }
    
    public Connection getConexion()
    {
        Connection con = null;
        try 
        {
//            String connectionUrl = "jdbc:sqlserver://;database=Application_Academic_Control;integratedSecurity=true;";
//            con = DriverManager.getConnection(connectionUrl);
//            System.out.println("Conectado.");
            
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
//            System.out.println("Driver Loaded");
//            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
//                    + "databaseName=Application_Academic_Control;user=KGRSystems;password=userinjector");
//            System.out.println("Connection Create");
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            System.out.println("Driver Loaded");
            con = DriverManager.getConnection(url, us, pass);
            System.out.println("Connection Create");
        }
        catch (Exception ex)
        {
            JOptionPane.showMessageDialog(null, "Connection not stablished with Database\n\n" + ex.getMessage(), "AA Control - Connection", JOptionPane.WARNING_MESSAGE);
            System.exit(0);
        }
        
        return con;
    }
    
}
