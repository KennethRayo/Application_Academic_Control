/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.swing.JLabel;

/**
 *
 * @author KGR
 */
public class LB_Time extends Thread
{
    private JLabel label_Time;
    private JLabel label_Date;
    
    public LB_Time(JLabel label_Time, JLabel label_Date){
       this.label_Time = label_Time;
       this.label_Date = label_Date;
    }
    
    public void run()
    {
        while(true){
           Date today = new Date();
           SimpleDateFormat sdt = new SimpleDateFormat("hh:mm:ss");
           SimpleDateFormat sdfd = new SimpleDateFormat("EEEE ',' d MMMM ' ' yyyy", new Locale("ES", "MX"));
           //SimpleDateFormat sdfd = new SimpleDateFormat("EEEE d ',' MMMM ' ' yyyy", new Locale("EN", "US"));
           label_Time.setText(sdt.format(today));
           label_Date.setText(sdfd.format(today));
           try{
              sleep(1000); //Segundo a segundo... 
           }catch(Exception e){
              e.getMessage();
           }
       }
   }
}
