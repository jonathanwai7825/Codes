Attribute VB_Name = "Module1"



Sub Reportchecklist()
LastRow = Cells(Rows.Count, "A").End(xlUp).Row

    Dim counter
    counter = 0
    Do While True
        counter = counter + 1
        
        With ActiveDocument.MailMerge
            .Destination = wdSendToNewDocument
            .SuppressBlankLines = True
            With .DataSource
                .FirstRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                .LastRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                With .DataFields
                    sFirmFileName = .Item(14).Value
                End With
            End With
            .Execute Pause:=False
        End With
  
        ActiveDocument.SaveAs2 FileName:=sFirmFileName + " report checklist" + ".docx", _
            FileFormat:=wdFormatXMLDocument, LockComments:=False, Password:="", _
            AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, _
            EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
            :=False, SaveAsAOCELetter:=False, CompatibilityMode:=15
        ActiveWindow.Close
        ActiveDocument.MailMerge.DataSource.ActiveRecord = wdNextRecord
        
        If counter = LastRow Then
            Exit Do
        End If
    Loop
End Sub



Sub procedurechecklist()
LastRow = Cells(Rows.Count, "A").End(xlUp).Row

    Dim counter
    counter = 0
    Do While True
        counter = counter + 1
        
        With ActiveDocument.MailMerge
            .Destination = wdSendToNewDocument
            .SuppressBlankLines = True
            With .DataSource
                .FirstRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                .LastRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                With .DataFields
                    sFirmFileName = .Item(14).Value
                End With
            End With
            .Execute Pause:=False
        End With
  
        ActiveDocument.SaveAs2 FileName:=sFirmFileName + " procedure checklist" + ".docx", _
            FileFormat:=wdFormatXMLDocument, LockComments:=False, Password:="", _
            AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, _
            EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
            :=False, SaveAsAOCELetter:=False, CompatibilityMode:=15
        ActiveWindow.Close
        ActiveDocument.MailMerge.DataSource.ActiveRecord = wdNextRecord
        
        If counter = LastRow Then
            Exit Do
        End If
    Loop
    
End Sub



Sub completionsignoff()
LastRow = Cells(Rows.Count, "A").End(xlUp).Row

    Dim counter
    counter = 0
    Do While True
        counter = counter + 1
        
        With ActiveDocument.MailMerge
            .Destination = wdSendToNewDocument
            .SuppressBlankLines = True
            With .DataSource
                .FirstRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                .LastRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                With .DataFields
                    sFirmFileName = .Item(14).Value
                End With
            End With
            .Execute Pause:=False
        End With
  
        ActiveDocument.SaveAs2 FileName:=sFirmFileName + " COMPLETION SIGN-OFF FORM" + ".docx", _
            FileFormat:=wdFormatXMLDocument, LockComments:=False, Password:="", _
            AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, _
            EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
            :=False, SaveAsAOCELetter:=False, CompatibilityMode:=15
        ActiveWindow.Close
        ActiveDocument.MailMerge.DataSource.ActiveRecord = wdNextRecord
        
        If counter = LastRow Then
            Exit Do
        End If
    Loop
    
End Sub



Sub clientaccform()
LastRow = Cells(Rows.Count, "A").End(xlUp).Row

    Dim counter
    counter = 0
    Do While True
        counter = counter + 1
        
        With ActiveDocument.MailMerge
            .Destination = wdSendToNewDocument
            .SuppressBlankLines = True
            With .DataSource
                .FirstRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                .LastRecord = ActiveDocument.MailMerge.DataSource.ActiveRecord
                With .DataFields
                    sFirmFileName = .Item(14).Value
                End With
            End With
            .Execute Pause:=False
        End With
  
        ActiveDocument.SaveAs2 FileName:=sFirmFileName + " client acceptance form" + ".docx", _
            FileFormat:=wdFormatXMLDocument, LockComments:=False, Password:="", _
            AddToRecentFiles:=True, WritePassword:="", ReadOnlyRecommended:=False, _
            EmbedTrueTypeFonts:=False, SaveNativePictureFormat:=False, SaveFormsData _
            :=False, SaveAsAOCELetter:=False, CompatibilityMode:=15
        ActiveWindow.Close
        ActiveDocument.MailMerge.DataSource.ActiveRecord = wdNextRecord
        
        If counter = LastRow Then
            Exit Do
        End If
    Loop
 
End Sub

