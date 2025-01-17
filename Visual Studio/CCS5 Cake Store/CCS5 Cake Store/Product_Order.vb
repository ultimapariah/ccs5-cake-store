﻿Imports IBM.Data.DB2

Public Class Product_Order
    Inherits Table

    Private ColumnArray = New List(Of String)({
        "ProdOrderId",
        "CustId",
        "EmpId",
        "ProdOrderDate",
        "ProdOrderTime",
        "ProdOrderSubtotal"
    })

    Private ColumnNames = New List(Of String)({
        "Product Order ID",
        "Customer ID",
        "Employee ID",
        "Date",
        "Time",
        "Subtotal"
    })

    Public Sub New(DataGridView As DataGridView)
        MyBase.New(DataGridView)
    End Sub

    Public Overrides Sub Initialize()
        Try
            DataGridView.ColumnCount = ColumnArray.Count
            For i As Integer = 0 To DataGridView.ColumnCount - 1
                DataGridView.Columns(i).Name = ColumnNames(i)
            Next

            Call RefreshDataGrid()

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Public Overrides Sub RefreshDataGrid()
        Dim CmdPopulateGrid As DB2Command
        Dim RdrPopulateGrid As DB2DataReader
        Dim row As String()
        Dim SelectString As String

        Try
            SelectString = UtilityFunctions.Db2SelectStringGenerator("product_order", ColumnArray)

            CmdPopulateGrid = New DB2Command(SelectString, Db2Connection)
            RdrPopulateGrid = CmdPopulateGrid.ExecuteReader
            DataGridView.Rows.Clear()
            While RdrPopulateGrid.Read

                row = New String() {
                    RdrPopulateGrid.GetString(0),
                    RdrPopulateGrid.GetString(1),
                    RdrPopulateGrid.GetString(2),
                    RdrPopulateGrid.GetDate(3),
                    RdrPopulateGrid.GetTime(4).ToString,
                    RdrPopulateGrid.GetString(5)
                }
                DataGridView.Rows.Add(row)

            End While
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Public Overloads Sub EventCreate(ByRef Values As List(Of String))
        Dim StrInsert As String

        Try
            StrInsert = UtilityFunctions.Db2InsertStringGenerator("product_order", ColumnArray, Values)
            ExecuteCommand(StrInsert)
            MsgBox("Successfully created product order.")
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Public Overrides Sub EventDelete()
        Dim StrDelete As String
        Dim ID = Me.DataGridView.CurrentRow.Cells(0).Value

        Try
            StrDelete = UtilityFunctions.Db2DeleteStringGenerator("product_order", "prodorderid", ID)
            ExecuteCommand(StrDelete)
            MsgBox("Successfully deleted product order.")
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

End Class
