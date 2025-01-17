﻿Imports IBM.Data.DB2

Public Module Globals
    ' Placed here because it will be constantly reused.
    ' The uid and password are preset here, as the user will be prompted
    ' to login using credentials in the database.
    Public CONNECTION_STRING As String = "server=localhost; database=cake; uid=db2admin; password=db2admin"

    ' Used as the employee ID for transactions
    Public CURRENTLY_LOGGED_IN_EMPLOYEE_ID As Integer
    Public CURRENTLY_LOGGED_IN_EMPLOYEE_POSITION As String

    ' So we can essentially pass this to user controls
    Public DASHBOARD_CONNECTION As Common.DbConnection

    ' Allows us to get the currently selected item
    ' for certain tables
    Public SELECTED_EMPLOYEE As DataGridViewRow
    Public SELECTED_PRODUCT As DataGridViewRow
    Public SELECTED_SALE As DataGridViewRow
    Public SELECTED_PRODUCT_ORDER As DataGridViewRow
    Public SELECTED_CUSTOMER As DataGridViewRow
    Public SELECTED_SUPPLIER As DataGridViewRow
    Public SELECTED_PURCHASE_ORDER As DataGridViewRow
    Public SELECTED_SUPPLY As DataGridViewRow
    Public SELECTED_SUPPLY_DELIVERY As DataGridViewRow
    Public SELECTED_SUPPLY_USAGE As DataGridViewRow

End Module
