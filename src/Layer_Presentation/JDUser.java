/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Presentation;

import Layer_Business.LB_Career;
import Layer_Business.LB_KeyEvent;
import Layer_Business.LB_Person;
import Layer_Business.LB_Profile;
import Layer_Business.LB_User;
import java.text.SimpleDateFormat;
import javax.swing.JOptionPane;

/**
 *
 * @author KGR
 */
public class JDUser extends java.awt.Dialog {

    /**
     * Creates new form JDTest
     */
    LB_User LB = new LB_User();
    LB_Profile LBP = new LB_Profile();
    LB_Person LBPE = new LB_Person();
    LB_KeyEvent LBKE = new LB_KeyEvent();
    public Boolean Actualizar = false;
    String Response;
    public String ID;
    public String ID_Profile;
    
    public JDUser(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        setLocationRelativeTo(parent);
        ListProfile();
        ListPerson();
        //ListCIF_CIFType();
    }
    
    public void ListProfile()
    {
        LBP.ListProfile(this.jComboBox_Profile);
    }
    
    public void ListPerson()
    {
        LBPE.ListPerson(this.jComboBox_Person);
    }
    
    public void GetDataPerson()
    {
        LB_Person PERDirect =  (LB_Person) this.jComboBox_Person.getSelectedItem();
        String id = PERDirect.getID_Person();
        this.jLabel_IDPerson.setText(id);
    }
    
    public void GetDataProfile()
    {
        LB_Profile PERDirect =  (LB_Profile) this.jComboBox_Profile.getSelectedItem();
        String idP = PERDirect.getID_Profile();
        this.jLabel_IDProfile.setText(idP);
        
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel_Sidebar = new javax.swing.JPanel();
        jLabel_Close = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jTabbedPane3 = new javax.swing.JTabbedPane();
        jPanel3 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        jSeparator6 = new javax.swing.JSeparator();
        jLabel14 = new javax.swing.JLabel();
        jSeparator13 = new javax.swing.JSeparator();
        jTextField_Password = new javax.swing.JTextField();
        jLabel_IDPerson = new javax.swing.JLabel();
        jComboBox_Person = new javax.swing.JComboBox<>();
        jLabel8 = new javax.swing.JLabel();
        jTextField_SearchIDPerson = new javax.swing.JTextField();
        jSeparator7 = new javax.swing.JSeparator();
        jPanel_Background = new javax.swing.JPanel();
        jLabel_IDProfile = new javax.swing.JLabel();
        jSeparator19 = new javax.swing.JSeparator();
        jComboBox_Profile = new javax.swing.JComboBox<>();
        jLabel20 = new javax.swing.JLabel();
        jLabel_Code = new javax.swing.JLabel();
        jButton_Save = new javax.swing.JButton();
        jLabel_Profile = new javax.swing.JLabel();

        setUndecorated(true);
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                closeDialog(evt);
            }
        });
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

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
        jLabel1.setText("USUARIO");

        javax.swing.GroupLayout jPanel_SidebarLayout = new javax.swing.GroupLayout(jPanel_Sidebar);
        jPanel_Sidebar.setLayout(jPanel_SidebarLayout);
        jPanel_SidebarLayout.setHorizontalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel_Close)
                .addGap(311, 311, 311)
                .addComponent(jLabel1)
                .addContainerGap(346, Short.MAX_VALUE))
        );
        jPanel_SidebarLayout.setVerticalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel_Close)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 7, Short.MAX_VALUE))
        );

        add(jPanel_Sidebar, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 740, 40));

        jPanel1.setBackground(new java.awt.Color(240, 240, 240));
        jPanel1.setForeground(new java.awt.Color(255, 255, 255));

        jTabbedPane3.setBackground(new java.awt.Color(240, 240, 240));
        jTabbedPane3.setForeground(new java.awt.Color(0, 0, 0));

        jPanel3.setBackground(new java.awt.Color(240, 240, 240));

        jLabel7.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(119, 123, 125));
        jLabel7.setText("CONTRASEÑA");

        jSeparator6.setBackground(new java.awt.Color(26, 97, 186));

        jLabel14.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel14.setForeground(new java.awt.Color(119, 123, 125));
        jLabel14.setText("EXPEDIENTE PERSONAL");

        jSeparator13.setBackground(new java.awt.Color(26, 97, 186));

        jTextField_Password.setBackground(new java.awt.Color(240, 240, 240));
        jTextField_Password.setFont(new java.awt.Font("Century Gothic", 1, 14)); // NOI18N
        jTextField_Password.setForeground(new java.awt.Color(105, 105, 105));
        jTextField_Password.setBorder(null);
        jTextField_Password.setMaximumSize(new java.awt.Dimension(0, 19));
        jTextField_Password.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTextField_PasswordKeyTyped(evt);
            }
        });

        jLabel_IDPerson.setForeground(new java.awt.Color(105, 105, 105));
        jLabel_IDPerson.setText("ID");

        jComboBox_Person.setBackground(new java.awt.Color(240, 240, 240));
        jComboBox_Person.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jComboBox_Person.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox_PersonItemStateChanged(evt);
            }
        });

        jLabel8.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(119, 123, 125));
        jLabel8.setText("CONSULTAR EXPEDIENTE");

        jTextField_SearchIDPerson.setBackground(new java.awt.Color(240, 240, 240));
        jTextField_SearchIDPerson.setFont(new java.awt.Font("Century Gothic", 1, 14)); // NOI18N
        jTextField_SearchIDPerson.setForeground(new java.awt.Color(105, 105, 105));
        jTextField_SearchIDPerson.setBorder(null);
        jTextField_SearchIDPerson.setMaximumSize(new java.awt.Dimension(0, 19));
        jTextField_SearchIDPerson.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField_SearchIDPersonKeyReleased(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTextField_SearchIDPersonKeyTyped(evt);
            }
        });

        jSeparator7.setBackground(new java.awt.Color(26, 97, 186));

        jPanel_Background.setBackground(new java.awt.Color(240, 240, 240));

        jLabel_IDProfile.setForeground(new java.awt.Color(105, 105, 105));
        jLabel_IDProfile.setText("ID");

        jSeparator19.setBackground(new java.awt.Color(26, 97, 186));

        jComboBox_Profile.setBackground(new java.awt.Color(240, 240, 240));
        jComboBox_Profile.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jComboBox_Profile.setForeground(new java.awt.Color(105, 105, 105));
        jComboBox_Profile.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox_ProfileItemStateChanged(evt);
            }
        });

        jLabel20.setFont(new java.awt.Font("Century Gothic", 0, 14)); // NOI18N
        jLabel20.setForeground(new java.awt.Color(119, 123, 125));
        jLabel20.setText("PERFIL");

        javax.swing.GroupLayout jPanel_BackgroundLayout = new javax.swing.GroupLayout(jPanel_Background);
        jPanel_Background.setLayout(jPanel_BackgroundLayout);
        jPanel_BackgroundLayout.setHorizontalGroup(
            jPanel_BackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_BackgroundLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel_BackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jSeparator19)
                    .addComponent(jLabel_IDProfile)
                    .addComponent(jLabel20)
                    .addComponent(jComboBox_Profile, 0, 242, Short.MAX_VALUE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel_BackgroundLayout.setVerticalGroup(
            jPanel_BackgroundLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel_BackgroundLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel20)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jComboBox_Profile, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jSeparator19, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jLabel_IDProfile)
                .addContainerGap(24, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addGap(0, 164, Short.MAX_VALUE))
                    .addComponent(jTextField_Password, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jSeparator6)
                    .addComponent(jPanel_Background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(18, 18, 18)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jSeparator13)
                    .addComponent(jComboBox_Person, 0, 230, Short.MAX_VALUE)
                    .addComponent(jLabel14)
                    .addComponent(jLabel_IDPerson)
                    .addComponent(jLabel8)
                    .addComponent(jSeparator7)
                    .addComponent(jTextField_SearchIDPerson, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(29, 29, 29))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(15, 15, 15)
                        .addComponent(jLabel8)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jTextField_SearchIDPerson, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jSeparator7, javax.swing.GroupLayout.PREFERRED_SIZE, 2, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(jPanel_Background, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel7)
                        .addGap(18, 18, 18)
                        .addComponent(jTextField_Password, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel14)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jComboBox_Person, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(4, 4, 4)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jSeparator6, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jSeparator13, javax.swing.GroupLayout.PREFERRED_SIZE, 10, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(jLabel_IDPerson)
                .addGap(80, 80, 80))
        );

        jTabbedPane3.addTab("Pág 1", jPanel3);

        jLabel_Code.setText("Code");

        jButton_Save.setBackground(new java.awt.Color(214, 61, 92));
        jButton_Save.setForeground(new java.awt.Color(255, 255, 255));
        jButton_Save.setText("Guardar");
        jButton_Save.setToolTipText("");
        jButton_Save.setBorder(null);
        jButton_Save.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        jButton_Save.setFocusable(false);
        jButton_Save.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton_SaveActionPerformed(evt);
            }
        });

        jLabel_Profile.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 12)); // NOI18N
        jLabel_Profile.setForeground(new java.awt.Color(202, 202, 202));
        jLabel_Profile.setText("Profile");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(79, 79, 79)
                        .addComponent(jTabbedPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 552, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel_Code)
                        .addGap(314, 314, 314)
                        .addComponent(jLabel_Profile))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(316, 316, 316)
                        .addComponent(jButton_Save, javax.swing.GroupLayout.PREFERRED_SIZE, 108, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(109, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(jTabbedPane3)
                .addGap(1, 1, 1)
                .addComponent(jButton_Save, javax.swing.GroupLayout.PREFERRED_SIZE, 37, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel_Code)
                    .addComponent(jLabel_Profile))
                .addGap(1, 1, 1))
        );

        add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 40, 740, 450));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    /**
     * Closes the dialog
     */
    private void closeDialog(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_closeDialog
        setVisible(false);
        dispose();
    }//GEN-LAST:event_closeDialog

    private void jLabel_CloseMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel_CloseMouseClicked
        // TODO add your handling code here:
        JFManageUser viewR = new JFManageUser();

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

    private void jButton_SaveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton_SaveActionPerformed
        // TODO add your handling code here:

        if (jComboBox_Profile.getSelectedItem()!= null)
        {
            if (!"".equals(jTextField_Password.getText()))
            {
               if (jComboBox_Person.getSelectedItem()!= null)
                {
                   String Password = jTextField_Password.getText();
                   //String CIFType = jComboBox_CIFType.getSelectedItem().toString();
                   LB_Person PERDirect =  (LB_Person) this.jComboBox_Person.getSelectedItem();
                   String IDPerson = PERDirect.getID_Person();
                   
                   LB_Profile PRODirect =  (LB_Profile) this.jComboBox_Profile.getSelectedItem();
                    String idP = PRODirect.getID_Profile();

                   if (Actualizar == true)
                   {
                       //UPDATE

                       LB = new LB_User(ID, Password, idP);

                       Response = LB.UpdateUser(idP);
                       if (Response != null)
                       {
                           JOptionPane.showMessageDialog(null, "User " + LB.getID_Person()+ "\n" + Response, "AA Control - User", JOptionPane.INFORMATION_MESSAGE);
                           //listar
                           //this.dispose();
                       }
                       Actualizar = false;
                   }
                   else
                   {
                       //SAVE

                       LB = new LB_User(IDPerson, Password, idP);

                       //Insert CIF
                       String rptaRegistro = LB.InsertUser(idP);

                       if (rptaRegistro != null)
                       {
                           JOptionPane.showMessageDialog(null, "User " + LB.getID_Person() + "\n" + rptaRegistro, "AA Control - User", JOptionPane.INFORMATION_MESSAGE);
                           //listar
                           //this.dispose();
                       }
                    } 
                }
               else
               {
                   JOptionPane.showMessageDialog(null, "The ID Person Is Required !", "AA Control - User", JOptionPane.WARNING_MESSAGE);
               }
            }
            else
            {
                JOptionPane.showMessageDialog(null, "The Password Is Required !", "AA Control - User", JOptionPane.WARNING_MESSAGE);
            }
        }
        else
       {
           JOptionPane.showMessageDialog(null, "The Profile Is Required !", "AA Control - User", JOptionPane.WARNING_MESSAGE);
       }
    }//GEN-LAST:event_jButton_SaveActionPerformed

    private void jTextField_PasswordKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField_PasswordKeyTyped
        // TODO add your handling code here:
        LBKE.NumbersAndCharactersMinAndCharactersMayus(evt);
    }//GEN-LAST:event_jTextField_PasswordKeyTyped

    private void jComboBox_PersonItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox_PersonItemStateChanged
        // TODO add your handling code here:
        GetDataPerson();
    }//GEN-LAST:event_jComboBox_PersonItemStateChanged

    private void jTextField_SearchIDPersonKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField_SearchIDPersonKeyTyped
        // TODO add your handling code here:
        LBKE.NumbersAndCharactersMinAndCharactersMayus(evt);
    }//GEN-LAST:event_jTextField_SearchIDPersonKeyTyped

    private void jComboBox_ProfileItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox_ProfileItemStateChanged
        // TODO add your handling code here:
        GetDataProfile();
    }//GEN-LAST:event_jComboBox_ProfileItemStateChanged

    private void jTextField_SearchIDPersonKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField_SearchIDPersonKeyReleased
        // TODO add your handling code here:
        LB.SearchPersonEnabled(this.jComboBox_Person, this.jTextField_SearchIDPerson.getText());
    }//GEN-LAST:event_jTextField_SearchIDPersonKeyReleased

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                JDUser dialog = new JDUser(new java.awt.Frame(), true);
                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                    public void windowClosing(java.awt.event.WindowEvent e) {
                        System.exit(0);
                    }
                });
                dialog.setVisible(true);
            }
        });
    }


    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JButton jButton_Save;
    private javax.swing.JComboBox<String> jComboBox_Person;
    private javax.swing.JComboBox<String> jComboBox_Profile;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel_Close;
    public javax.swing.JLabel jLabel_Code;
    private javax.swing.JLabel jLabel_IDPerson;
    private javax.swing.JLabel jLabel_IDProfile;
    public javax.swing.JLabel jLabel_Profile;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    public javax.swing.JPanel jPanel_Background;
    private javax.swing.JPanel jPanel_Sidebar;
    private javax.swing.JSeparator jSeparator13;
    private javax.swing.JSeparator jSeparator19;
    private javax.swing.JSeparator jSeparator6;
    private javax.swing.JSeparator jSeparator7;
    private javax.swing.JTabbedPane jTabbedPane3;
    public javax.swing.JTextField jTextField_Password;
    public javax.swing.JTextField jTextField_SearchIDPerson;
    // End of variables declaration//GEN-END:variables
}
