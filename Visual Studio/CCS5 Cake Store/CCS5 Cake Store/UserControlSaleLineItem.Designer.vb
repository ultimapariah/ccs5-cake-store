﻿<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class UserControlSaleLineItem
    Inherits System.Windows.Forms.UserControl

    'UserControl overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.DataGridViewSaleTemp = New System.Windows.Forms.DataGridView()
        Me.BtnAddToSale = New System.Windows.Forms.Button()
        Me.BtnSaleLineItemClearFields = New System.Windows.Forms.Button()
        Me.BtnSaleLineItemUpdate = New System.Windows.Forms.Button()
        Me.BtnSaleLineItemDelete = New System.Windows.Forms.Button()
        Me.BtnSaleLineItemInsert = New System.Windows.Forms.Button()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.TxtSaleQty = New System.Windows.Forms.TextBox()
        Me.GroupBox1.SuspendLayout()
        CType(Me.DataGridViewSaleTemp, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.DataGridViewSaleTemp)
        Me.GroupBox1.Controls.Add(Me.BtnAddToSale)
        Me.GroupBox1.Controls.Add(Me.BtnSaleLineItemClearFields)
        Me.GroupBox1.Controls.Add(Me.BtnSaleLineItemUpdate)
        Me.GroupBox1.Controls.Add(Me.BtnSaleLineItemDelete)
        Me.GroupBox1.Controls.Add(Me.BtnSaleLineItemInsert)
        Me.GroupBox1.Controls.Add(Me.Label5)
        Me.GroupBox1.Controls.Add(Me.TxtSaleQty)
        Me.GroupBox1.Location = New System.Drawing.Point(3, 3)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(797, 485)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Sale Line Items"
        '
        'DataGridViewSaleTemp
        '
        Me.DataGridViewSaleTemp.AllowUserToAddRows = False
        Me.DataGridViewSaleTemp.AllowUserToDeleteRows = False
        Me.DataGridViewSaleTemp.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridViewSaleTemp.Location = New System.Drawing.Point(6, 28)
        Me.DataGridViewSaleTemp.Name = "DataGridViewSaleTemp"
        Me.DataGridViewSaleTemp.RowTemplate.Height = 24
        Me.DataGridViewSaleTemp.Size = New System.Drawing.Size(306, 451)
        Me.DataGridViewSaleTemp.TabIndex = 16
        '
        'BtnAddToSale
        '
        Me.BtnAddToSale.Location = New System.Drawing.Point(376, 440)
        Me.BtnAddToSale.Name = "BtnAddToSale"
        Me.BtnAddToSale.Size = New System.Drawing.Size(132, 39)
        Me.BtnAddToSale.TabIndex = 15
        Me.BtnAddToSale.Text = "Add Items To Sale"
        Me.BtnAddToSale.UseVisualStyleBackColor = True
        '
        'BtnSaleLineItemClearFields
        '
        Me.BtnSaleLineItemClearFields.Location = New System.Drawing.Point(376, 398)
        Me.BtnSaleLineItemClearFields.Name = "BtnSaleLineItemClearFields"
        Me.BtnSaleLineItemClearFields.Size = New System.Drawing.Size(132, 36)
        Me.BtnSaleLineItemClearFields.TabIndex = 14
        Me.BtnSaleLineItemClearFields.Text = "Clear Fields"
        Me.BtnSaleLineItemClearFields.UseVisualStyleBackColor = True
        '
        'BtnSaleLineItemUpdate
        '
        Me.BtnSaleLineItemUpdate.Location = New System.Drawing.Point(376, 356)
        Me.BtnSaleLineItemUpdate.Name = "BtnSaleLineItemUpdate"
        Me.BtnSaleLineItemUpdate.Size = New System.Drawing.Size(132, 36)
        Me.BtnSaleLineItemUpdate.TabIndex = 13
        Me.BtnSaleLineItemUpdate.Text = "Update Line Item"
        Me.BtnSaleLineItemUpdate.UseVisualStyleBackColor = True
        '
        'BtnSaleLineItemDelete
        '
        Me.BtnSaleLineItemDelete.Location = New System.Drawing.Point(376, 306)
        Me.BtnSaleLineItemDelete.Name = "BtnSaleLineItemDelete"
        Me.BtnSaleLineItemDelete.Size = New System.Drawing.Size(132, 44)
        Me.BtnSaleLineItemDelete.TabIndex = 12
        Me.BtnSaleLineItemDelete.Text = "Delete Selected Line Item"
        Me.BtnSaleLineItemDelete.UseVisualStyleBackColor = True
        '
        'BtnSaleLineItemInsert
        '
        Me.BtnSaleLineItemInsert.Location = New System.Drawing.Point(376, 256)
        Me.BtnSaleLineItemInsert.Name = "BtnSaleLineItemInsert"
        Me.BtnSaleLineItemInsert.Size = New System.Drawing.Size(132, 44)
        Me.BtnSaleLineItemInsert.TabIndex = 11
        Me.BtnSaleLineItemInsert.Text = "Insert Line Item"
        Me.BtnSaleLineItemInsert.UseVisualStyleBackColor = True
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(318, 208)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(61, 17)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Quantity"
        '
        'TxtSaleQty
        '
        Me.TxtSaleQty.Location = New System.Drawing.Point(319, 228)
        Me.TxtSaleQty.Name = "TxtSaleQty"
        Me.TxtSaleQty.Size = New System.Drawing.Size(189, 22)
        Me.TxtSaleQty.TabIndex = 9
        '
        'UserControlSaleLineItem
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(8.0!, 16.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "UserControlSaleLineItem"
        Me.Size = New System.Drawing.Size(803, 491)
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        CType(Me.DataGridViewSaleTemp, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents BtnSaleLineItemInsert As System.Windows.Forms.Button
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents TxtSaleQty As System.Windows.Forms.TextBox
    Friend WithEvents BtnSaleLineItemDelete As System.Windows.Forms.Button
    Friend WithEvents BtnSaleLineItemUpdate As System.Windows.Forms.Button
    Friend WithEvents BtnSaleLineItemClearFields As System.Windows.Forms.Button
    Friend WithEvents DataGridViewSaleTemp As System.Windows.Forms.DataGridView
    Friend WithEvents BtnAddToSale As System.Windows.Forms.Button

End Class
