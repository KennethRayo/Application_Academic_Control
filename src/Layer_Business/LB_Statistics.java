/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Business;

import Layer_Data.LD_Statistics;
import javax.swing.JLabel;

/**
 *
 * @author KGR
 */
public class LB_Statistics {

    LD_Statistics LD = new LD_Statistics();
    public LB_Statistics() {}
    
    public void DashboardData_UAD(JLabel jLabel_UAD)
    {
        LD.DashboardData_UAD(jLabel_UAD);
    }
    
    public void DashboardData_CIF(JLabel jLabel_CIF)
    {
        LD.DashboardData_CIF(jLabel_CIF);
    }
    
    public void DashboardData_Coordinator(JLabel jLabel_Coordinator)
    {
        LD.DashboardData_Coordinator(jLabel_Coordinator);
    }
    
    public void DashboardData_Career(JLabel jLabel_Career)
    {
        LD.DashboardData_Career(jLabel_Career);
    }
    
    public void DashboardData_Level(JLabel jLabel_Level)
    {
        LD.DashboardData_Level(jLabel_Level);
    }
    
    public void DashboardData_Subject(JLabel jLabel_Subject)
    {
        LD.DashboardData_Subject(jLabel_Subject);
    }
    
}
