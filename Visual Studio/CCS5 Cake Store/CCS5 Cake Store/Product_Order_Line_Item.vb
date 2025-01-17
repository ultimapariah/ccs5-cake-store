﻿Imports IBM.Data.DB2

Public Class Product_Order_Line_Item
    Inherits Table

    Private ColumnArray = New List(Of String)({
        "ProdOrderLineItemId",
        "ProdOrderId",
        "ProdId",
        "ProdOrderLineItemPrice",
        "ProdOrderLineItemQty"
    })

    Private ColumnNames = New List(Of String)({
        "Product Order Line Item ID",
        "Product Order ID",
        "Product ID",
        "Price",
        "Quantity"
    })

    Public Sub New(DataGridView As DataGridView, Db2Connection As Common.DbConnection)
        MyBase.New(DataGridView)
    End Sub

    Public Overrides Sub Initialize()
        Try
            DataGridView.ColumnCount = ColumnArray.Count
            For i As Integer = 0 To DataGridView.ColumnCount - 1
                DataGridView.Columns(i).Name = ColumnNames(i)
                DataGridView.Columns(i).Width = 150
            Next
            DataGridView.Columns(0).Width = 110
            DataGridView.Columns(0).ReadOnly = True

            Call RefreshDataGrid()

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Public Overloads Sub EventCreate(ByRef Values As List(Of String))
        Dim StrInsert As String

        Try
            StrInsert = UtilityFunctions.Db2InsertStringGenerator("product_order_line_item", ColumnArray, Values)
            ExecuteCommand(StrInsert)
        Catch ex As Exception
            MsgBox(ex.ToString)
            Return
        End Try
    End Sub

    Public Overrides Sub EventDelete()
        Dim StrDelete As String
        Dim ID = Me.DataGridView.CurrentRow.Cells(0).Value

        Try
            StrDelete = UtilityFunctions.Db2DeleteStringGenerator("product_order_line_item", "prodorderlineitemid", ID)
            ExecuteCommand(StrDelete)
            MsgBox("Successfully deleted line item.")
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Public Overloads Sub EventEdit(ByRef Values As List(Of String))
        Try
            Dim StrEdit As String = UtilityFunctions.Db2UpdateStringGenerator("product_order_line_item", ColumnArray, Values)
            ExecuteCommand(StrEdit)
            MsgBox("Successfully edited line item.")
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub
End Class
