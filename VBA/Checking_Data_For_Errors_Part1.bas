Attribute VB_Name = "Core"
Sub ItemDBToRaw()

'    Set Item_DB = Workbooks(ABC(12)).Sheets(ABC(13))
'    Set RAW_DB = Workbooks(ABC(2)).Sheets(ABC(3))
    
    Set Item_DB = ITEMDB
    Set RAW_DB = RAW
    
    Dim CheckingSameID As Boolean
    
    Red = 3
    
    RER = RAW_DB.Range("A1").End(xlDown).Row
    IER = Item_DB.Range("A1").End(xlDown).Row
    
    For Each RAWCell In RAW_DB.Range("A2:A" & RER)
        CheckingSameID = False
'Run a loop through entire ItemCell to make sure client and product id is registered.
        For Each ItemCell In Item_DB.Range("A2:A" & IER)
            If RAWCell.Value = ItemCell.Value And RAWCell.Offset(0, 2).Value = ItemCell.Offset(0, 1).Value Then
                CheckingSameID = True
                Exit For
            End If
        Next ItemCell
        If Not CheckingSameID Then
'Highlight product that is not registered
            Rows(RAWCell.Row & ":" & RAWCell.Row).Font.ColorIndex = Red
        Else
            For Each ItemCell In Item_DB.Range("A2:A" & IER)
                Rows(RAWCell.Row & ":" & RAWCell.Row).Font.ColorIndex = 1
' If the product has been previously shipped it will be in Item Database
' Then if any errors are made filling out the forms can be automatically corrected
' Add comments is for future proofing, the comment can let the staff know what has been changed
                If RAWCell.Value = ItemCell.Value And RAWCell.Offset(0, 2).Value = ItemCell.Offset(0, 1).Value Then
                    If RAWCell.Offset(0, 3).Value <> ItemCell.Offset(0, 6).Value Then
                        RAWCell.Offset(0, 3).AddComment (RAWCell.Offset(0, 3).Value & "")
                        RAWCell.Offset(0, 3).Value = ItemCell.Offset(0, 6).Value
                    End If
                    If RAWCell.Offset(0, 6).Value <> ItemCell.Offset(0, 2).Value Then
                        RAWCell.Offset(0, 6).AddComment (RAWCell.Offset(0, 6).Value & "")
                        RAWCell.Offset(0, 6).Value = ItemCell.Offset(0, 2).Value
                    End If
                    If RAWCell.Offset(0, 8).Value <> ItemCell.Offset(0, 15).Value Then
                        RAWCell.Offset(0, 8).AddComment (RAWCell.Offset(0, 8).Value & "")
                        RAWCell.Offset(0, 8).Value = ItemCell.Offset(0, 15).Value
                    End If
                    If RAWCell.Offset(0, 9).Value <> ItemCell.Offset(0, 16).Value Then
                        RAWCell.Offset(0, 9).AddComment (RAWCell.Offset(0, 9).Value & "")
                        RAWCell.Offset(0, 9).Value = ItemCell.Offset(0, 16).Value
                    End If
                    If RAWCell.Offset(0, 10).Value <> ItemCell.Offset(0, 14).Value Then
                        RAWCell.Offset(0, 10).AddComment (RAWCell.Offset(0, 10).Value & "")
                        RAWCell.Offset(0, 10).Value = ItemCell.Offset(0, 14).Value
                    End If
                    If RAWCell.Offset(0, 11).Value <> ItemCell.Offset(0, 5).Value Then
                        RAWCell.Offset(0, 11).AddComment (RAWCell.Offset(0, 11).Value & "")
                        RAWCell.Offset(0, 11).Value = ItemCell.Offset(0, 5).Value
                    End If
                    If RAWCell.Offset(0, 30).Value <> ItemCell.Offset(0, 13).Value Then
                        RAWCell.Offset(0, 30).AddComment (RAWCell.Offset(0, 30).Value & "")
                        RAWCell.Offset(0, 30).Value = ItemCell.Offset(0, 13).Value
                    End If
                    If RAWCell.Offset(0, 31).Value <> ItemCell.Offset(0, 12).Value Then
                        RAWCell.Offset(0, 31).AddComment (RAWCell.Offset(0, 31).Value & "")
                        RAWCell.Offset(0, 31).Value = ItemCell.Offset(0, 12).Value
                    End If
                    
                    RAWCell.Offset(0, 36).Value = ItemCell.Offset(0, 22).Value
                    RAWCell.Offset(0, 37).Formula = "=IF(AK" & RAWCell.Row & "=""035"",AF" & RAWCell.Row & ",E" & RAWCell.Row & ")"
                    RAWCell.Offset(0, 40).Value = ItemCell.Offset(0, 11).Value
                    RAWCell.Offset(0, 41).Value = ItemCell.Offset(0, 18).Value
                    RAWCell.Offset(0, 42).Value = ItemCell.Offset(0, 20).Value
                    RAWCell.Offset(0, 44).Value = ItemCell.Offset(0, 23).Value
                    RAWCell.Offset(0, 37).Formula = "=IF(AS" & RAWCell.Row & "=""065"",E" & RAWCell.Row & ",0)"
                    RAWCell.Offset(0, 46).Value = ItemCell.Offset(0, 21).Value
                    
                End If
            Next ItemCell
        End If
        
        
        
    Next RAWCell
    
    
    
    
    
    
    
End Sub
