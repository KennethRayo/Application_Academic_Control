/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Presentation;

import Layer_Business.LB_Time;
import javax.swing.JOptionPane;

/**
 *
 * @author KGR
 */
public class JFStatistics_Principal extends javax.swing.JFrame {

    /**
     * Creates new form JFPrincipal
     */
    public JFStatistics_Principal() {
        initComponents();
        setLocationRelativeTo(null);
        LB_Time hilo = new LB_Time(jLabel_Time, jLabel_Date);
        hilo.start();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel17 = new javax.swing.JPanel();
        jLabel_Profile = new javax.swing.JLabel();
        jLabel_Time = new javax.swing.JLabel();
        jLabel_Date = new javax.swing.JLabel();
        jLabel_Code = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        jPanel19 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel_Close = new javax.swing.JLabel();
        jPanel_Sidebar = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jPanel_Scroll = new javax.swing.JPanel();
        jPanel25 = new javax.swing.JPanel();
        jButton_Home = new javax.swing.JButton();
        jPanel21 = new javax.swing.JPanel();
        jButton_ManageUAD = new javax.swing.JButton();
        jPanel20 = new javax.swing.JPanel();
        jLabel11 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(947, 510));
        setUndecorated(true);
        setResizable(false);
        setSize(new java.awt.Dimension(947, 540));
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel17.setBackground(new java.awt.Color(55, 61, 69));

        jLabel_Profile.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 12)); // NOI18N
        jLabel_Profile.setForeground(new java.awt.Color(202, 202, 202));
        jLabel_Profile.setText("Profile");

        jLabel_Time.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 36)); // NOI18N
        jLabel_Time.setForeground(new java.awt.Color(202, 202, 202));
        jLabel_Time.setText("21:49:45");

        jLabel_Date.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 14)); // NOI18N
        jLabel_Date.setForeground(new java.awt.Color(202, 202, 202));
        jLabel_Date.setText("Lunes, 26 de septiembre 2018");

        jLabel_Code.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 12)); // NOI18N
        jLabel_Code.setForeground(new java.awt.Color(202, 202, 202));
        jLabel_Code.setText("Code");

        jLabel5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icono-cliente70x70.png"))); // NOI18N

        jLabel20.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/logo oficial UNADENIC 110x80.png"))); // NOI18N
        jLabel20.setToolTipText("UNIVERSIDAD ADVENTISTA DE NICARAGUA");

        javax.swing.GroupLayout jPanel17Layout = new javax.swing.GroupLayout(jPanel17);
        jPanel17.setLayout(jPanel17Layout);
        jPanel17Layout.setHorizontalGroup(
            jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel17Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel5)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel_Profile)
                    .addComponent(jLabel_Code))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 209, Short.MAX_VALUE)
                .addComponent(jLabel20)
                .addGap(148, 148, 148)
                .addGroup(jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel_Date)
                    .addComponent(jLabel_Time))
                .addGap(78, 78, 78))
        );
        jPanel17Layout.setVerticalGroup(
            jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel17Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel17Layout.createSequentialGroup()
                        .addComponent(jLabel20)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel17Layout.createSequentialGroup()
                        .addComponent(jLabel_Time)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel_Date)
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel17Layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addGroup(jPanel17Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel5)
                            .addGroup(jPanel17Layout.createSequentialGroup()
                                .addGap(28, 28, 28)
                                .addComponent(jLabel_Profile)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel_Code)))
                        .addGap(34, 34, 34))))
        );

        getContentPane().add(jPanel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 500, 890, 90));

        jPanel19.setBackground(new java.awt.Color(214, 61, 92));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/satellite-dish (1).png"))); // NOI18N

        jLabel3.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 10)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("AA SYSTEM");

        jLabel_Close.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/cancel.png"))); // NOI18N
        jLabel_Close.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel_Close.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel_CloseMouseClicked(evt);
            }
        });

        javax.swing.GroupLayout jPanel19Layout = new javax.swing.GroupLayout(jPanel19);
        jPanel19.setLayout(jPanel19Layout);
        jPanel19Layout.setHorizontalGroup(
            jPanel19Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel19Layout.createSequentialGroup()
                .addComponent(jLabel2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 980, Short.MAX_VALUE)
                .addComponent(jLabel_Close)
                .addContainerGap())
        );
        jPanel19Layout.setVerticalGroup(
            jPanel19Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel19Layout.createSequentialGroup()
                .addGroup(jPanel19Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel_Close)
                    .addComponent(jLabel3)
                    .addComponent(jLabel2))
                .addGap(0, 6, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel19, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1100, 30));

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

        jLabel1.setFont(new java.awt.Font("Century Gothic", 1, 18)); // NOI18N
        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/logo kgr white pink83x53.png"))); // NOI18N

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Shutdown_25px.png"))); // NOI18N
        jLabel8.setToolTipText("Cerrar Sesión Actual");
        jLabel8.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jLabel8.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel8MouseClicked(evt);
            }
        });

        jPanel_Scroll.setBackground(new java.awt.Color(29, 34, 39));
        jPanel_Scroll.setAutoscrolls(true);

        jPanel25.setBackground(new java.awt.Color(214, 61, 92));
        jPanel25.setPreferredSize(new java.awt.Dimension(2, 40));

        javax.swing.GroupLayout jPanel25Layout = new javax.swing.GroupLayout(jPanel25);
        jPanel25.setLayout(jPanel25Layout);
        jPanel25Layout.setHorizontalGroup(
            jPanel25Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 2, Short.MAX_VALUE)
        );
        jPanel25Layout.setVerticalGroup(
            jPanel25Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        jButton_Home.setBackground(new java.awt.Color(29, 34, 39));
        jButton_Home.setForeground(new java.awt.Color(192, 192, 192));
        jButton_Home.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Home_Page_35px.png"))); // NOI18N
        jButton_Home.setText("           Inicio");
        jButton_Home.setToolTipText("");
        jButton_Home.setActionCommand("Administración");
        jButton_Home.setBorder(null);
        jButton_Home.setBorderPainted(false);
        jButton_Home.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton_Home.setDefaultCapable(false);
        jButton_Home.setFocusPainted(false);
        jButton_Home.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jButton_Home.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        jButton_Home.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton_HomeActionPerformed(evt);
            }
        });

        jPanel21.setBackground(new java.awt.Color(214, 61, 92));
        jPanel21.setPreferredSize(new java.awt.Dimension(2, 40));

        javax.swing.GroupLayout jPanel21Layout = new javax.swing.GroupLayout(jPanel21);
        jPanel21.setLayout(jPanel21Layout);
        jPanel21Layout.setHorizontalGroup(
            jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 2, Short.MAX_VALUE)
        );
        jPanel21Layout.setVerticalGroup(
            jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 40, Short.MAX_VALUE)
        );

        jButton_ManageUAD.setBackground(new java.awt.Color(29, 34, 39));
        jButton_ManageUAD.setForeground(new java.awt.Color(192, 192, 192));
        jButton_ManageUAD.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Form_35px.png"))); // NOI18N
        jButton_ManageUAD.setText("        Registro");
        jButton_ManageUAD.setToolTipText("");
        jButton_ManageUAD.setActionCommand("Administración");
        jButton_ManageUAD.setBorder(null);
        jButton_ManageUAD.setBorderPainted(false);
        jButton_ManageUAD.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton_ManageUAD.setDefaultCapable(false);
        jButton_ManageUAD.setFocusPainted(false);
        jButton_ManageUAD.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jButton_ManageUAD.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        jButton_ManageUAD.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton_ManageUADActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel_ScrollLayout = new javax.swing.GroupLayout(jPanel_Scroll);
        jPanel_Scroll.setLayout(jPanel_ScrollLayout);
        jPanel_ScrollLayout.setHorizontalGroup(
            jPanel_ScrollLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_ScrollLayout.createSequentialGroup()
                .addComponent(jPanel21, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton_ManageUAD, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel_ScrollLayout.createSequentialGroup()
                .addComponent(jPanel25, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton_Home, javax.swing.GroupLayout.PREFERRED_SIZE, 202, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel_ScrollLayout.setVerticalGroup(
            jPanel_ScrollLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_ScrollLayout.createSequentialGroup()
                .addGroup(jPanel_ScrollLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel25, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jButton_Home, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel_ScrollLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel21, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton_ManageUAD, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(248, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel_SidebarLayout = new javax.swing.GroupLayout(jPanel_Sidebar);
        jPanel_Sidebar.setLayout(jPanel_SidebarLayout);
        jPanel_SidebarLayout.setHorizontalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addGap(59, 59, 59)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addGroup(jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel_Scroll, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8))
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel_SidebarLayout.setVerticalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addGap(44, 44, 44)
                .addComponent(jPanel_Scroll, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 98, Short.MAX_VALUE)
                .addComponent(jLabel8))
        );

        getContentPane().add(jPanel_Sidebar, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 30, 210, 560));

        jPanel20.setBackground(new java.awt.Color(64, 69, 76));

        jLabel11.setFont(new java.awt.Font("Dialog", 1, 18)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(202, 202, 202));
        jLabel11.setText("INICIO - ESTADÍSTICA");

        javax.swing.GroupLayout jPanel20Layout = new javax.swing.GroupLayout(jPanel20);
        jPanel20.setLayout(jPanel20Layout);
        jPanel20Layout.setHorizontalGroup(
            jPanel20Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel20Layout.createSequentialGroup()
                .addGap(335, 335, 335)
                .addComponent(jLabel11)
                .addContainerGap(364, Short.MAX_VALUE))
        );
        jPanel20Layout.setVerticalGroup(
            jPanel20Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel20Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel11)
                .addContainerGap(440, Short.MAX_VALUE))
        );

        getContentPane().add(jPanel20, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 30, 890, 470));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jLabel_CloseMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel_CloseMouseClicked
        // TODO add your handling code here:
        
        int rptaCategory = JOptionPane.showConfirmDialog(null, 
                "Would you like to Exit ?", "AA Control - Register",JOptionPane.YES_NO_CANCEL_OPTION);
        //si la respuesta es si el valor de rptaUsuario será 1, no -> 2, cancelar -> 3
        if (rptaCategory == 0) 
        {
            System.exit(0);
        }
    }//GEN-LAST:event_jLabel_CloseMouseClicked

    int xy, xx;
    private void jPanel_SidebarMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel_SidebarMousePressed
        // TODO add your handling code here:
        setOpacity((float)0.8);
        xx = evt.getX();
        xy = evt.getY();
    }//GEN-LAST:event_jPanel_SidebarMousePressed

    private void jPanel_SidebarMouseDragged(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel_SidebarMouseDragged
        // TODO add your handling code here:
        int x = evt.getXOnScreen();
        int y = evt.getYOnScreen();
        this.setLocation(x - xx, y - xy);
    }//GEN-LAST:event_jPanel_SidebarMouseDragged

    private void jPanel_SidebarMouseReleased(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jPanel_SidebarMouseReleased
        // TODO add your handling code here:
        setOpacity((float)1.0);
    }//GEN-LAST:event_jPanel_SidebarMouseReleased

    private void jButton_HomeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton_HomeActionPerformed
        // TODO add your handling code here:
        JFDashboard_Admin viewR = new JFDashboard_Admin();

        //Mostrar vista Principal
        viewR.setLocationRelativeTo(null);
        //Guardar datos en variables
        viewR.jLabel_Code.setText(this.jLabel_Code.getText());
        viewR.jLabel_Profile.setText(this.jLabel_Profile.getText());
        this.dispose();
        viewR.setVisible(true);
    }//GEN-LAST:event_jButton_HomeActionPerformed

    private void jButton_ManageUADActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton_ManageUADActionPerformed
        // TODO add your handling code here:
        JFStatistics_Register_Principal view = new JFStatistics_Register_Principal();
        view.jLabel_Code.setText(this.jLabel_Code.getText());
        view.jLabel_Profile.setText(this.jLabel_Profile.getText());
        view.setLocationRelativeTo(null);
        this.dispose();
        view.setVisible(true);
//        JFGraph_UAD view = new JFGraph_UAD();
//        //view.jLabel_Code.setText(this.jLabel_Code.getText());
//        view.setLocationRelativeTo(null);
//        this.dispose();
//        view.setVisible(true);
        
    }//GEN-LAST:event_jButton_ManageUADActionPerformed

    private void jLabel8MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel8MouseClicked
        // TODO add your handling code here:
        int rpta = JOptionPane.showConfirmDialog(null, 
                "Would you like to Exit ?", "AA Control - Register",JOptionPane.YES_NO_CANCEL_OPTION);
        //si la respuesta es si el valor de rptaUsuario será 1, no -> 2, cancelar -> 3
        if (rpta == 0) 
        {
            System.exit(0);
        }
    }//GEN-LAST:event_jLabel8MouseClicked

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
            java.util.logging.Logger.getLogger(JFStatistics_Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFStatistics_Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFStatistics_Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFStatistics_Principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new JFStatistics_Principal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton_Home;
    private javax.swing.JButton jButton_ManageUAD;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel_Close;
    public javax.swing.JLabel jLabel_Code;
    private javax.swing.JLabel jLabel_Date;
    public javax.swing.JLabel jLabel_Profile;
    private javax.swing.JLabel jLabel_Time;
    private javax.swing.JPanel jPanel17;
    private javax.swing.JPanel jPanel19;
    private javax.swing.JPanel jPanel20;
    private javax.swing.JPanel jPanel21;
    private javax.swing.JPanel jPanel25;
    private javax.swing.JPanel jPanel_Scroll;
    private javax.swing.JPanel jPanel_Sidebar;
    // End of variables declaration//GEN-END:variables
}
