/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Layer_Presentation;

import Layer_Business.LB_BranchOffice;
import Layer_Business.LB_CIF;
import Layer_Business.LB_Person;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author KGR
 */
public class JFManageStatistics_CIF extends javax.swing.JFrame {

    /**
     * Creates new form JFTest
     */
    LB_CIF LB = new LB_CIF();
    LB_BranchOffice LBBO = new LB_BranchOffice();
    public JFManageStatistics_CIF() {
        initComponents();
        setLocationRelativeTo(null);
      ListALL();
      ListBranchOffice();
    }
    
    public void ListBranchOffice()
    {
        try 
        {
            LBBO.ListBranchOfficeCBO(this.jComboBox_BranchOffice);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.getMessage());
        }   
    }
     
    public void GetDataBranchOffice()
    {
        LB_BranchOffice Office =  (LB_BranchOffice) this.jComboBox_BranchOffice.getSelectedItem();
        String idO = Office.getID_BranchOffice();
        this.jLabel_IDBranchOffice.setText(idO);
    }
    
    public void ListALL()
    {
        DefaultTableModel miModelo;
        int op = jComboBox_Option.getSelectedIndex();
        switch(op){
            case 0:
                miModelo = LB.Statistics_PersonDirector_CIF();
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 1:
                miModelo = LB.Statistics_PaymentMethod_CIF();
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 2:
                miModelo = LB.Statistics_Classification_CIF();
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 3:
                miModelo = LB.Statistics_Denomination_CIF();
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 4:
                miModelo = LB.Statistics_TypeOfCurrency_CIF();
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            
            default: JOptionPane.showMessageDialog(null, "Checking.. the Option !", "AA Control - Statistics UAD", JOptionPane.WARNING_MESSAGE);
        }
    }
    
    public void ListBO()
    {
        DefaultTableModel miModelo;
        LB_BranchOffice Office =  (LB_BranchOffice) this.jComboBox_BranchOffice.getSelectedItem();
        String idBO = Office.getID_BranchOffice();
        int op = jComboBox_OptionB.getSelectedIndex();
        switch(op){
            case 0:
                miModelo = LB.Statistics_PersonDirector_BO_CIF(idBO);
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 1:
                miModelo = LB.Statistics_PaymentMethod_BO_CIF(idBO);
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 2:
                miModelo = LB.Statistics_Classification_BO_CIF(idBO);
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 3:
                miModelo = LB.Statistics_Denomination_BO_CIF(idBO);
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            case 4:
                miModelo = LB.Statistics_TypeOfCurrency_BO_CIF(idBO);
                tblConsultas.setModel(miModelo);
                Graph();
            break;
            
            default: JOptionPane.showMessageDialog(null, "Checking.. the Option !", "AA Control - Statistics UAD", JOptionPane.WARNING_MESSAGE);
        }
    }
    
    public void Graph()
    {
        if(jRadioButton_3D.isSelected() && jRadioButton_Circular.isSelected()){
            DefaultPieDataset dtsc = new DefaultPieDataset();

            for(int i = 0; i < tblConsultas.getRowCount(); i++){
                dtsc.setValue(tblConsultas.getValueAt(i, 0).toString(), Integer.parseInt(tblConsultas.getValueAt(i, 1).toString()));
            }
            JFreeChart ch = ChartFactory.createPieChart3D("Estadística CIF", dtsc,true, true, false);
            ChartPanel cp = new ChartPanel(ch);
            add(cp);
            cp.setBounds(500,40,500,400);

        }
        if(jRadioButton_2D.isSelected() && jRadioButton_Circular.isSelected()){
            DefaultPieDataset dtsc = new DefaultPieDataset();

            for(int i = 0; i < tblConsultas.getRowCount(); i++){
                dtsc.setValue(tblConsultas.getValueAt(i, 0).toString(), Integer.parseInt(tblConsultas.getValueAt(i, 1).toString()));
            }
            JFreeChart ch = ChartFactory.createPieChart("Estadística CIF", dtsc,true, true, false);
            ChartPanel cp = new ChartPanel(ch);
            add(cp);
            cp.setBounds(500,40,500,400);

        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup_Dimensions = new javax.swing.ButtonGroup();
        buttonGroup_TypeGraph = new javax.swing.ButtonGroup();
        buttonGroup_DimensionsB = new javax.swing.ButtonGroup();
        buttonGroup_TypeGraphB = new javax.swing.ButtonGroup();
        jPanel_Sidebar = new javax.swing.JPanel();
        jLabel_Close = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel_Code = new javax.swing.JLabel();
        jLabel_Profile = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblConsultas = new javax.swing.JTable();
        jPanel3 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jComboBox_Option = new javax.swing.JComboBox<>();
        jRadioButton_2D = new javax.swing.JRadioButton();
        jRadioButton_3D = new javax.swing.JRadioButton();
        jRadioButton_Circular = new javax.swing.JRadioButton();
        jPanel4 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jComboBox_OptionB = new javax.swing.JComboBox<>();
        jRadioButton_2D_BO = new javax.swing.JRadioButton();
        jRadioButton_3D_BO = new javax.swing.JRadioButton();
        jRadioButton_CircularB = new javax.swing.JRadioButton();
        jLabel8 = new javax.swing.JLabel();
        jComboBox_BranchOffice = new javax.swing.JComboBox<>();
        jLabel_IDBranchOffice = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        setResizable(false);

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
        jLabel1.setText("ESTADÍSTICA CIF");
        jLabel1.setToolTipText("");

        javax.swing.GroupLayout jPanel_SidebarLayout = new javax.swing.GroupLayout(jPanel_Sidebar);
        jPanel_Sidebar.setLayout(jPanel_SidebarLayout);
        jPanel_SidebarLayout.setHorizontalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel_Close)
                .addGap(465, 465, 465)
                .addComponent(jLabel1)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel_SidebarLayout.setVerticalGroup(
            jPanel_SidebarLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel_Close)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel_SidebarLayout.createSequentialGroup()
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        jLabel_Code.setText("Code");

        jLabel_Profile.setFont(new java.awt.Font("Microsoft Sans Serif", 1, 12)); // NOI18N
        jLabel_Profile.setForeground(new java.awt.Color(202, 202, 202));
        jLabel_Profile.setText("Profile");

        tblConsultas.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(tblConsultas);

        jPanel3.setBackground(new java.awt.Color(240, 240, 240));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder("GENERATE BY: ALL"));

        jLabel6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Find_and_Replace_25px.png"))); // NOI18N

        jComboBox_Option.setBackground(new java.awt.Color(240, 240, 240));
        jComboBox_Option.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jComboBox_Option.setForeground(new java.awt.Color(105, 105, 105));
        jComboBox_Option.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Director", "Método de Pago", "Clasificación", "Denominación", "Tipo de Cambio" }));
        jComboBox_Option.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox_OptionItemStateChanged(evt);
            }
        });

        jRadioButton_2D.setBackground(new java.awt.Color(240, 240, 240));
        buttonGroup_Dimensions.add(jRadioButton_2D);
        jRadioButton_2D.setForeground(new java.awt.Color(105, 105, 105));
        jRadioButton_2D.setSelected(true);
        jRadioButton_2D.setText("2D");
        jRadioButton_2D.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jRadioButton_2DItemStateChanged(evt);
            }
        });

        jRadioButton_3D.setBackground(new java.awt.Color(240, 240, 240));
        buttonGroup_Dimensions.add(jRadioButton_3D);
        jRadioButton_3D.setForeground(new java.awt.Color(105, 105, 105));
        jRadioButton_3D.setText("3D");
        jRadioButton_3D.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jRadioButton_3DItemStateChanged(evt);
            }
        });

        jRadioButton_Circular.setBackground(new java.awt.Color(240, 240, 240));
        buttonGroup_TypeGraph.add(jRadioButton_Circular);
        jRadioButton_Circular.setForeground(new java.awt.Color(105, 105, 105));
        jRadioButton_Circular.setSelected(true);
        jRadioButton_Circular.setText("Circular");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(19, 19, 19)
                        .addComponent(jComboBox_Option, javax.swing.GroupLayout.PREFERRED_SIZE, 386, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jRadioButton_2D)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jRadioButton_3D)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jRadioButton_Circular)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jLabel3))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(42, 42, 42))
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jComboBox_Option, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jRadioButton_Circular)
                    .addComponent(jRadioButton_3D)
                    .addComponent(jRadioButton_2D))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel4.setBackground(new java.awt.Color(240, 240, 240));
        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder("GENERATE BY: BRANCHOFFICE"));

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Find_and_Replace_25px.png"))); // NOI18N

        jComboBox_OptionB.setBackground(new java.awt.Color(240, 240, 240));
        jComboBox_OptionB.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jComboBox_OptionB.setForeground(new java.awt.Color(105, 105, 105));
        jComboBox_OptionB.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Director", "Método de Pago", "Clasificación", "Denominación", "Tipo de Cambio" }));
        jComboBox_OptionB.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox_OptionBItemStateChanged(evt);
            }
        });

        jRadioButton_2D_BO.setBackground(new java.awt.Color(240, 240, 240));
        buttonGroup_DimensionsB.add(jRadioButton_2D_BO);
        jRadioButton_2D_BO.setForeground(new java.awt.Color(105, 105, 105));
        jRadioButton_2D_BO.setSelected(true);
        jRadioButton_2D_BO.setText("2D");
        jRadioButton_2D_BO.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jRadioButton_2D_BOItemStateChanged(evt);
            }
        });

        jRadioButton_3D_BO.setBackground(new java.awt.Color(240, 240, 240));
        buttonGroup_DimensionsB.add(jRadioButton_3D_BO);
        jRadioButton_3D_BO.setForeground(new java.awt.Color(105, 105, 105));
        jRadioButton_3D_BO.setText("3D");
        jRadioButton_3D_BO.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jRadioButton_3D_BOItemStateChanged(evt);
            }
        });

        jRadioButton_CircularB.setBackground(new java.awt.Color(240, 240, 240));
        buttonGroup_TypeGraphB.add(jRadioButton_CircularB);
        jRadioButton_CircularB.setForeground(new java.awt.Color(105, 105, 105));
        jRadioButton_CircularB.setSelected(true);
        jRadioButton_CircularB.setText("Circular");

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Image/icons8_Find_and_Replace_25px.png"))); // NOI18N

        jComboBox_BranchOffice.setBackground(new java.awt.Color(240, 240, 240));
        jComboBox_BranchOffice.setFont(new java.awt.Font("Dialog", 1, 14)); // NOI18N
        jComboBox_BranchOffice.setForeground(new java.awt.Color(105, 105, 105));
        jComboBox_BranchOffice.addItemListener(new java.awt.event.ItemListener() {
            public void itemStateChanged(java.awt.event.ItemEvent evt) {
                jComboBox_BranchOfficeItemStateChanged(evt);
            }
        });

        jLabel_IDBranchOffice.setText("ID");

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(19, 19, 19)
                        .addComponent(jComboBox_OptionB, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(jLabel4))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel_IDBranchOffice)
                                .addGap(0, 0, Short.MAX_VALUE))))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(19, 19, 19)
                                .addComponent(jComboBox_BranchOffice, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                                .addComponent(jRadioButton_2D_BO)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jRadioButton_3D_BO)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jRadioButton_CircularB)))
                        .addContainerGap())))
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jComboBox_BranchOffice, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel4, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 35, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jComboBox_OptionB, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(jLabel_IDBranchOffice)))
                        .addGap(1, 1, 1)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jRadioButton_2D_BO)
                            .addComponent(jRadioButton_3D_BO)
                            .addComponent(jRadioButton_CircularB))
                        .addGap(57, 57, 57)))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel_Code)
                        .addGap(341, 341, 341)
                        .addComponent(jLabel_Profile))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(19, 19, 19)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jPanel4, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))))
                .addGap(704, 727, Short.MAX_VALUE))
            .addComponent(jPanel_Sidebar, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel_Sidebar, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12)
                .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, 93, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, 128, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 220, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(9, 9, 9)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel_Code)
                    .addComponent(jLabel_Profile)))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jLabel_CloseMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel_CloseMouseClicked
        // TODO add your handling code here:
        JFStatistics_Register_Principal view = new JFStatistics_Register_Principal();
        view.jLabel_Code.setText(this.jLabel_Code.getText());
        view.jLabel_Profile.setText(this.jLabel_Profile.getText());
        view.setLocationRelativeTo(null);
        this.dispose();
        view.setVisible(true);
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

    private void jComboBox_OptionItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox_OptionItemStateChanged
        // TODO add your handling code here:
        ListALL();
    }//GEN-LAST:event_jComboBox_OptionItemStateChanged

    private void jRadioButton_2DItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jRadioButton_2DItemStateChanged
        // TODO add your handling code here:
        Graph();
    }//GEN-LAST:event_jRadioButton_2DItemStateChanged

    private void jRadioButton_3DItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jRadioButton_3DItemStateChanged
        // TODO add your handling code here:
        Graph();
    }//GEN-LAST:event_jRadioButton_3DItemStateChanged

    private void jComboBox_OptionBItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox_OptionBItemStateChanged
        // TODO add your handling code here:
        ListBO();
    }//GEN-LAST:event_jComboBox_OptionBItemStateChanged

    private void jRadioButton_2D_BOItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jRadioButton_2D_BOItemStateChanged
        // TODO add your handling code here:
        Graph();
    }//GEN-LAST:event_jRadioButton_2D_BOItemStateChanged

    private void jRadioButton_3D_BOItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jRadioButton_3D_BOItemStateChanged
        // TODO add your handling code here:
        Graph();
    }//GEN-LAST:event_jRadioButton_3D_BOItemStateChanged

    private void jComboBox_BranchOfficeItemStateChanged(java.awt.event.ItemEvent evt) {//GEN-FIRST:event_jComboBox_BranchOfficeItemStateChanged
        // TODO add your handling code here:
        GetDataBranchOffice();
    }//GEN-LAST:event_jComboBox_BranchOfficeItemStateChanged

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
            java.util.logging.Logger.getLogger(JFManageStatistics_CIF.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(JFManageStatistics_CIF.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(JFManageStatistics_CIF.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(JFManageStatistics_CIF.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
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
                new JFManageStatistics_CIF().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup_Dimensions;
    private javax.swing.ButtonGroup buttonGroup_DimensionsB;
    private javax.swing.ButtonGroup buttonGroup_TypeGraph;
    private javax.swing.ButtonGroup buttonGroup_TypeGraphB;
    private javax.swing.JComboBox<String> jComboBox_BranchOffice;
    private javax.swing.JComboBox<String> jComboBox_Option;
    private javax.swing.JComboBox<String> jComboBox_OptionB;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel_Close;
    public javax.swing.JLabel jLabel_Code;
    private javax.swing.JLabel jLabel_IDBranchOffice;
    public javax.swing.JLabel jLabel_Profile;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel_Sidebar;
    private javax.swing.JRadioButton jRadioButton_2D;
    private javax.swing.JRadioButton jRadioButton_2D_BO;
    private javax.swing.JRadioButton jRadioButton_3D;
    private javax.swing.JRadioButton jRadioButton_3D_BO;
    private javax.swing.JRadioButton jRadioButton_Circular;
    private javax.swing.JRadioButton jRadioButton_CircularB;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblConsultas;
    // End of variables declaration//GEN-END:variables
}
