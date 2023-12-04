Attribute VB_Name = "Module1"
Function f1(x)
f1 = (x + 1 / x) ^ 2
End Function

Function Trap(n, a, b)
'calculate the width or h of each trapezoid
h = (b - a) / n
'calculate the sum term
Sum = 0
For I = 1 To n - 1
 Sum = Sum + 2 * f1(a + I * h)
Next I
'Add Upper Limit abd lower limit function values 'multiply by h/2
Trap = (h / 2) * (f1(a) + Sum + f1(b))

End Function

Sub RombergWithChart()
    Dim Integ(10, 10) As Double
    Dim ea As Double
    Dim et As Double
    Dim exact As Double
    Dim a As Double
    Dim b As Double
    Dim I As Integer
    Dim n As Integer
    Dim k As Integer
    
    ' Set up a new worksheet for the chart
    Sheets.Add(After:=Sheets(Sheets.Count)).Name = "ChartSheet"
    Sheets("ChartSheet").Activate
    
    ' Create a line chart
    Charts.Add
    ActiveChart.ChartType = xlLineMarkers
    ActiveChart.SetSourceData Source:=Sheets("Sheet1").Range("B33:E43")
    ActiveChart.Location Where:=xlLocationAsObject, Name:="ChartSheet"
    
    ea = 100
    exact = f1(2) - f1(1)
    a = 1
    b = 2
    I = 1
    n = 1
    Integ(1, 1) = Trap(n, a, b)
    
    Do While ea > 0.005
        n = 2 ^ I
        ' Next Integral Approx
        Integ(I + 1, 1) = Trap(n, a, b)
        
        ' Romberg Integration
        For k = 2 To I + 1
            j = 2 + I - k
            Integ(j, k) = (4 ^ (k - 1) * Integ(j + 1, k - 1) - Integ(j, k - 1)) / (4 ^ (k - 1) - 1)
        Next k
        
        ea = Abs((Integ(1, I + 1) - Integ(2, I)) / Integ(1, I + 1)) * 100
        et = Abs((exact - Integ(1, I + 1)) / exact) * 100
        
        ' Output results to Excel cells
        Cells(33 + I, 2) = I
        Cells(33 + I, 3) = ea
        Cells(33 + I, 4) = et
        Cells(33 + I, 5) = Integ(1, I + 1)
        
        ' Add data to the chart
        Sheets("ChartSheet").Select
        ActiveChart.SeriesCollection.NewSeries
        ActiveChart.SeriesCollection(1).Name = "Iteration " & I & " (ea)"
        ActiveChart.SeriesCollection(1).Values = Sheets("Sheet1").Range("C33:C43").Offset(I - 1, 0)
        ActiveChart.SeriesCollection.NewSeries
        ActiveChart.SeriesCollection(2).Name = "Iteration " & I & " (et)"
        ActiveChart.SeriesCollection(2).Values = Sheets("Sheet1").Range("D33:D43").Offset(I - 1, 0)
        
        I = I + 1
    Loop
    
    ' Output Romberg table to Excel
    For I = 1 To k
        For j = 1 To k
            Cells(27 + I, 1 + j) = Integ(I, j)
        Next j
    Next I
End Sub

