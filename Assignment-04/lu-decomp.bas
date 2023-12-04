Attribute VB_Name = "Module1"
Sub LU_Factorization()
    ' Define the matrix B
    Dim B() As Double
    ReDim B(1 To 2, 1 To 2)
    B(1, 1) = 2
    B(1, 2) = 3
    B(2, 1) = 1
    B(2, 2) = 2
    
    ' Get the size of the matrix B
    Dim n As Long, m As Long
    n = UBound(B, 1)
    m = UBound(B, 2)

    ' Initialize matrices L and U with zero elements
    Dim L() As Double
    ReDim L(1 To n, 1 To m)
    
    Dim U() As Double
    ReDim U(1 To n, 1 To m)

    If n = m Then
        For j = 1 To n
            For i = 1 To n
                Dim sum As Double
                sum = 0
                Dim q As Long
                q = j - 1
                For k = 1 To q
                    sum = sum + (L(i, k) * U(k, j))
                Next k
                If i = j Then
                    U(i, j) = 1
                End If
                If i >= j Then
                    L(i, j) = B(i, j) - sum ' Generate lower triangular matrix
                Else
                    U(i, j) = (1 / L(i, i)) * (B(i, j) - sum) ' Generate upper triangular matrix
                End If
            Next i
        Next j
    End If
    
    If n = m Then
        ' Display matrices B, L, U, and LU
        Dim ws As Worksheet
        Set ws = ThisWorkbook.Sheets.Add
        
        ws.Cells(1, 1).Value = "Matrix B:"
        For i = 1 To n
            For j = 1 To m
                ws.Cells(i + 1, j).Value = B(i, j)
            Next j
        Next i
        
        ws.Cells(1, 5).Value = "Matrix L:"
        For i = 1 To n
            For j = 1 To m
                ws.Cells(i + 1, j + 5).Value = L(i, j)
            Next j
        Next i
        
        ws.Cells(1, 10).Value = "Matrix U:"
        For i = 1 To n
            For j = 1 To m
                ws.Cells(i + 1, j + 10).Value = U(i, j)
            Next j
        Next i
        
        ' Calculate LU
        Dim LU() As Double
        ReDim LU(1 To n, 1 To m)
        For i = 1 To n
            For j = 1 To m
                LU(i, j) = 0
                For k = 1 To n
                    LU(i, j) = LU(i, j) + L(i, k) * U(k, j)
                Next k
            Next j
        Next i
        ws.Cells(1, 15).Value = "Matrix LU:"
        For i = 1 To n
            For j = 1 To m
                ws.Cells(i + 1, j + 15).Value = LU(i, j)
            Next j
        Next i
    Else
        MsgBox "The matrix is not square"
    End If
    
    ' Define the matrix P and vector v
    Dim P() As Double
    ReDim P(1 To 2, 1 To 2)
    P(1, 1) = 1
    P(1, 2) = 0
    P(2, 1) = 0
    P(2, 2) = 1
    
    Dim v() As Double
    ReDim v(1 To 2, 1 To 1)
    v(1, 1) = 3
    v(2, 1) = 1
    
    ' Solve for y in Ly = P*v
    Dim y() As Double
    ReDim y(1 To n, 1 To 1)
    For i = 1 To n
        For j = 1 To 1
            y(i, j) = v(i, j)
            For k = 1 To i - 1
                y(i, j) = y(i, j) - L(i, k) * y(k, j)
            Next k
        Next j
    Next i
    
    ' Solve for x in Ux = y
    Dim x() As Double
    ReDim x(1 To n, 1 To 1)
    For i = n To 1 Step -1
        For j = 1 To 1
            x(i, j) = y(i, j)
            For k = i + 1 To n
                x(i, j) = x(i, j) - U(i, k) * x(k, j)
            Next k
            x(i, j) = x(i, j) / U(i, i)
        Next j
    Next i
    
    ' Display the solutions
    MsgBox "Solution:" & vbCrLf & "x = " & Format(x(1, 1) / 2, "0.00") & vbCrLf & "y = " & Format(x(2, 1) / 2, "0.00")
End Sub

