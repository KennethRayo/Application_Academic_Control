/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Presentation;

import Layer_Business.LB_CIF;
import Layer_Business.LB_Database;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

/**
 *
 * @author KGR
 */
public class JFManageFile_ExportDB extends javax.swing.JFrame {

    /**
     * Creates new form JFTest
     */
    LB_Database LB = new LB_Database();
    public String Response;
    
    public JFManageFile_ExportDB() {
        initComponents();
        setLocationRelativeTo(null);
    }

    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel_Sidebar = new javax.swing.JPanel();
        jLabel_Close = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jTextField_URL = new javax.swing.JTextField();
        jButton_SearchOutputFolder = new javax.swing.JButton();
        jButton_ExportDB = new javax.swing.JButton();
        jSeparator13 = new javax.swing.JSeparator();
        jTextField_URL_MySQLDump = new javax.swing.JTextField();
        jButton_SearchMysqldump = new javax.swing.JButton();
        jLabel7 = new javax.swing.JLabel();
        jSeparator14 = new javax.swing.JSeparator();
        jCheckBox_LocalizeMysqldump = new javax.swing.JCheckBox();
        jLabel_Code = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel_Profile = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        setResizable(false);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel_Sidebar.setBackground(new java.awt.Color(29, 34, 39));
        jPanel_Sidebar.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent evt) {
                jPanel_SidebarMouseDragged(evt);
            }
        });
        jPanel_Sidebar.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                jPanel_SidebarMousePressed(evt);
            }
            public void mouseReleased(java.awt.event.MouseEvent evt) {
                jPanel_SidebarMouseReleased(evt);
            }
        });

        jLabel_Close.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/left_15px.png"))); // NOI18N
        jLabel_Close.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel_Close.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel_CloseMouseClicked(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Microsoft Sans Serif", 0, 14)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("EXPORTAR BASE DE DATOS");
        jLabel1.setToolTipText("");

        javax.swing.GroupLayout jPanel_SidebarLayout = new javax.swing.GroupLayout(jPanel_Sidebar);
        jPanel_Sidebar.setLayout(jPanel_SidebarLayout);
        jPanel_SidebarLayout.setHorizontalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel_Close)
                .addGap(391, 391, 391)
                .addComponent(jLabel1)
                .addContainerGap(567, Short.MAX_VALUE))
        );
        jPanel_SidebarLayout.setVerticalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel_Close)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel_SidebarLayout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel_Sidebar, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1170, -1));

        jPanel1.setBackground(new java.awt.Color(240, 240, 240));
        jPanel1.setForeground(new java.awt.Color(255, 255, 255));

        jPanel3.setBackground(new java.awt.Color(240, 240, 240));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("EXPORTAR"));

        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Find_and_Replace_25px.png"))); // NOI18N

        jTextField_URL.setEditable(false);
        jTextField_URL.setBackground(new java.awt.Color(240, 240, 240));
        jTextField_URL.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTextField_URL.setForeground(new java.awt.Color(105, 105, 105));
        jTextField_URL.setBorder(null);

        jButton_SearchOutputFolder.setBackground(new java.awt.Color(214, 61, 92));
        jButton_SearchOutputFolder.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jButton_SearchOutputFolder.setForeground(new java.awt.Color(255, 255, 255));
        jButton_SearchOutputFolder.setText("...");
        jButton_SearchOutputFolder.setToolTipText("Select an Output folder !");
        jButton_SearchOutputFolder.setBorder(null);
        jButton_SearchOutputFolder.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton_SearchOutputFolder.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton_SearchOutputFolderActionPerformed(evt);
            }
        });

        jButton_ExportDB.setBackground(new java.awt.Color(214, 61, 92));
        jButton_ExportDB.setFont(new java.awt.Font("Tahoma", 0, 12)); // NOI18N
        jButton_ExportDB.setForeground(new java.awt.Color(255, 255, 255));
        jButton_ExportDB.setText("Exportar BD");
        jButton_ExportDB.setBorder(null);
        jButton_ExportDB.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton_ExportDB.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton_ExportDBActionPerformed(evt);
            }
        });

        jSeparator13.setBackground(new java.awt.Color(26, 97, 186));

        jTextField_URL_MySQLDump.setEditable(false);
        jTextField_URL_MySQLDump.setBackground(new java.awt.Color(240, 240, 240));
        jTextField_URL_MySQLDump.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jTextField_URL_MySQLDump.setForeground(new java.awt.Color(105, 105, 105));
        jTextField_URL_MySQLDump.setBorder(null);

        jButton_SearchMysqldump.setBackground(new java.awt.Color(214, 61, 92));
        jButton_SearchMysqldump.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        jButton_SearchMysqldump.setForeground(new java.awt.Color(255, 255, 255));
        jButton_SearchMysqldump.setText("...");
        jButton_SearchMysqldump.setToolTipText("Select an Output folder !");
        jButton_SearchMysqldump.setBorder(null);
        jButton_SearchMysqldump.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton_SearchMysqldump.setEnabled(false);
        jButton_SearchMysqldump.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton_SearchMysqldumpActionPerformed(evt);
            }
        });

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Find_and_Replace_25px.png"))); // NOI18N

        jSeparator14.setBackground(new java.awt.Color(26, 97, 186));

        jCheckBox_LocalizeMysqldump.setBackground(new java.awt.Color(240, 240, 240));
        jCheckBox_LocalizeMysqldump.setText("Localize mysqldump");
        jCheckBox_LocalizeMysqldump.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jCheckBox_LocalizeMysqldumpMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jCheckBox_LocalizeMysqldump))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(12, 12, 12)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jButton_ExportDB, javax.swing.GroupLayout.DEFAULT_SIZE, 470, Short.MAX_VALUE)
                                    .addComponent(jTextField_URL)
                                    .addComponent(jSeparator13, javax.swing.GroupLayout.Alignment.TRAILING))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jButton_SearchOutputFolder, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jSeparator14, javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jTextField_URL_MySQLDump))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jButton_SearchMysqldump, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)))))
                .addGap(30, 30, 30)
                .addComponent(jLabel3))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap(25, Short.MAX_VALUE)
                .addComponent(jCheckBox_LocalizeMysqldump)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(jTextField_URL_MySQLDump)
                        .addComponent(jButton_SearchMysqldump, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jLabel6, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(2, 2, 2)
                .addComponent(jSeparator14, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                        .addComponent(jButton_ExportDB, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(jTextField_URL)
                                    .addComponent(jButton_SearchOutputFolder, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel7, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jSeparator13, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(2, 2, 2)))
                        .addGap(45, 45, 45))))
        );

        jLabel_Code.setText("Code");

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/MySQL.png"))); // NOI18N

        jLabel_Profile.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 12)); // NOI18N
        jLabel_Profile.setForeground(new java.awt.Color(202, 202, 202));
        jLabel_Profile.setText("Profile");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jLabel_Code)
                .addGap(329, 329, 329)
                .addComponent(jLabel_Profile)
                .addGap(0, 0, Short.MAX_VALUE))
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 159, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(421, 421, 421))
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(225, 225, 225)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(224, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 44, Short.MAX_VALUE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel_Code)
                    .addComponent(jLabel_Profile)))
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 30, 1040, 400));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jLabel_CloseMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel_CloseMouseClicked
        // TODO add your handling code here:
        JFFile_Principal viewR = new JFFile_Principal();

        //Mostrar vista Principal
        viewR.setLocationRelativeTo(null);
        //Guardar datos en variables
        viewR.jLabel_Code.setText(this.jLabel_Code.getText());
        viewR.jLabel_Profile.setText(this.jLabel_Profile.getText());
        this.dispose();
        viewR.setVisible(true);
    }//GEN-LAST:event_jLabel_CloseMouseClicked

    int xy, xx;
    private void jPanel_SidebarMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel_SidebarMouseDragged
        // TODO add your handling code here:
        int x = evt.getXOnScreen();
        int y = evt.getYOnScreen();
        this.setLocation(x - xx, y - xy);
    }//GEN-LAST:event_jPanel_SidebarMouseDragged

    private void jPanel_SidebarMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel_SidebarMousePressed
        // TODO add your handling code here:
        setOpacity((float)0.8);
        xx = evt.getX();
        xy = evt.getY();
    }//GEN-LAST:event_jPanel_SidebarMousePressed

    private void jPanel_SidebarMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel_SidebarMouseReleased
        // TODO add your handling code here:
        setOpacity((float)1.0);
    }//GEN-LAST:event_jPanel_SidebarMouseReleased

    private void jButton_SearchOutputFolderActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton_SearchOutputFolderActionPerformed

        JFileChooser ch = new JFileChooser();
        ch.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        int se = ch.showSaveDialog(null);
        if(se == JFileChooser.APPROVE_OPTION){
            String ruta = ch.getSelectedFile().getPath();
            jTextField_URL.setText(ruta);
        }
    }//GEN-LAST:event_jButton_SearchOutputFolderActionPerformed

    private String GetDateTime()
    {
          Date today = new Date();
          String ContructDate;
           SimpleDateFormat sdt = new SimpleDateFormat("hh '_' mm '_' ss k");
           //SimpleDateFormat sdfd = new SimpleDateFormat("EEEE '_' d '_' MMMM '_' yyyy", new Locale("ES", "MX"));
           SimpleDateFormat sdfd = new SimpleDateFormat("d '_' MMMM '_' yyyy", new Locale("EN", "US"));
//           JOptionPane.showMessageDialog(null, sdfd.format(today) +
//                   "_" + sdt.format(today) + "_" + "AAC_Backup", "AA Control - Export DB", JOptionPane.INFORMATION_MESSAGE);
           ContructDate = sdfd.format(today) +
                   "_" + sdt.format(today) + "_" + "AAC_Backup";
           return ContructDate;
    }
    
    private void jButton_ExportDBActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton_ExportDBActionPerformed
        String URL = jTextField_URL.getText();
        String URL_MySQLDump = jTextField_URL_MySQLDump.getText();
        String Name = "\\" + GetDateTime() + ".sql";
      
        
        if (jCheckBox_LocalizeMysqldump.isSelected())
        {
            
            if (!"".equals(jTextField_URL_MySQLDump.getText()))
            {
                if (!"".equals(jTextField_URL.getText()))
                {
                    Response = LB.ExportDB(URL_MySQLDump, URL, Name);
                    JOptionPane.showMessageDialog(null, "File: " + Name + "\n" + "Created on: " + URL, "AA Control - Export DB", JOptionPane.INFORMATION_MESSAGE);
                }
                else
                {
                    JOptionPane.showMessageDialog(null, "The URL of the output file is required", "AA Control - Export DB", JOptionPane.WARNING_MESSAGE);
                }
            }
            else
            {
                JOptionPane.showMessageDialog(null, "The URL of the mysqldump is required", "AA Control - Export DB", JOptionPane.WARNING_MESSAGE);
            }
            
        }
        else
        {
            if (!"".equals(jTextField_URL.getText()))
            {
                URL_MySQLDump = "C:\\Program Files (x86)\\MariaDB 10.3\\bin\\";
                Response = LB.ExportDB(URL_MySQLDump, URL, Name);
                JOptionPane.showMessageDialog(null, "File: " + Name + "\n" + "Created on: " + URL, "AA Control - Export DB", JOptionPane.INFORMATION_MESSAGE);
            }
            else
            {
                JOptionPane.showMessageDialog(null, "The URL of the output file is required", "AA Control - Export DB", JOptionPane.WARNING_MESSAGE);
            }
        }
        
    }//GEN-LAST:event_jButton_ExportDBActionPerformed

    private void jButton_SearchMysqldumpActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton_SearchMysqldumpActionPerformed
        // TODO add your handling code here:
        JFileChooser ch = new JFileChooser();
        ch.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
        int se = ch.showSaveDialog(null);
        if(se == JFileChooser.APPROVE_OPTION){
            String ruta = ch.getSelectedFile().getPath();
            jTextField_URL_MySQLDump.setText(ruta);
        }
    }//GEN-LAST:event_jButton_SearchMysqldumpActionPerformed

    private void jCheckBox_LocalizeMysqldumpMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jCheckBox_LocalizeMysqldumpMouseClicked
        // TODO add your handling code here:
        if (jCheckBox_LocalizeMysqldump.isSelected()) 
        {
            //jTextField_URL_MySQLDump.setEditable(true);
            jButton_SearchMysqldump.setEnabled(true);
        }
        else
        {
            //jTextField_URL_MySQLDump.setEditable(false);
            jButton_SearchMysqldump.setEnabled(false);
        }
    }//GEN-LAST:event_jCheckBox_LocalizeMysqldumpMouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(JFManageFile_ExportDB.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFManageFile_ExportDB.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFManageFile_ExportDB.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFManageFile_ExportDB.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFManageFile_ExportDB().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton_ExportDB;
    private javax.swing.JButton jButton_SearchMysqldump;
    private javax.swing.JButton jButton_SearchOutputFolder;
    private javax.swing.JCheckBox jCheckBox_LocalizeMysqldump;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel_Close;
    public javax.swing.JLabel jLabel_Code;
    public javax.swing.JLabel jLabel_Profile;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel_Sidebar;
    private javax.swing.JSeparator jSeparator13;
    private javax.swing.JSeparator jSeparator14;
    private javax.swing.JTextField jTextField_URL;
    private javax.swing.JTextField jTextField_URL_MySQLDump;
    // End of variables declaration//GEN-END:variables
}
