Attribute VB_Name = "Core"
Sub Checking_M()

Set ORDER_DB = ORDER
Set ADDRESS_DB = ADDRESSDB
Dim CheckCity As Boolean


OER = ORDER_DB.Range("A1").End(xlDown).Row
AER = ADDRESS_DB.Range("A1").End(xlDown).Row

Application.DisplayAlerts = False
Application.Calculation = xlManual
Application.ScreenUpdating = False



Cells.ClearComments

' There are certain rules to each of the slots
' For example customer id must only be 5 digits
' Phone numbers must contain only numbers
' Each province contain certain cities and each city contain certain districts. This must match our database. If not will provide note to administrator

For Each cell In ORDER_DB.Range("A2:A" & OER)

    If Len(cell.Value) <> 5 Then cell.AddComment ("Must be 5 digits")
    If Not IsNumeric(cell.Offset(0, 3).Value) Then cell.Offset(0, 3).AddComment ("Must be numbers")
    If Not IsNumeric(cell.Offset(0, 4).Value) Then cell.Offset(0, 4).AddComment ("Must be numbers")
    If Not (cell.Offset(0, 6).Value Like "*" & cell.Offset(0, 8).Value) Then cell.Offset(0, 8).AddComment ("Amount differs from amount confirmed in product description in Cell " & cell.Offset(0, 6).Address(0, 0))
    If Len(cell.Offset(0, 13).Value) <> 18 Then cell.Offset(0, 13).AddComment ("Must be numbers and 18 digits long")
    If Len(cell.Offset(0, 14).Value) <> 11 And Left(cell.Offset(0, 14).Value, 1) <> 1 Then cell.Offset(0, 14).AddComment ("Must start with 1 as area code and 11 digits long")
    CheckCity = False
    For Each AddressCell In ADDRESS_DB.Range("A2:A" & AER)
    
        If AddressCell.Offset(0, 0).Value = cell.Offset(0, 15).Value And _
        AddressCell.Offset(0, 1).Value = cell.Offset(0, 16).Value And _
        AddressCell.Offset(0, 2).Value = cell.Offset(0, 17).Value Then
             CheckCity = True
        End If
        
    Next AddressCell
            If Not CheckCity Then
            cell.Offset(0, 17).AddComment ("Area, City and Province does not align")
        End If
        
        If Not (cell.Offset(0, 18).Value Like "*" & cell.Offset(0, 15) & "*" And _
        cell.Offset(0, 18).Value Like "*" & cell.Offset(0, 16) & "*" And _
        cell.Offset(0, 18).Value Like "*" & cell.Offset(0, 17) & "*") Then
            cell.Offset(0, 18).AddComment ("Area, City and Province does not align")
        End If
        If Not IsNumeric(cell.Offset(0, 30).Value) Then cell.Offset(0, 30).AddComment ("Must only contain numbers and decimals")
        If Not IsNumeric(cell.Offset(0, 31).Value) Then cell.Offset(0, 31).AddComment ("Must only contain numbers and decimals")
        
Next cell


Application.DisplayAlerts = True
Application.ScreenUpdating = True
Application.Calculation = xlAutomatic






End Sub


