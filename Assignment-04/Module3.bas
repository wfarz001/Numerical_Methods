Attribute VB_Name = "Module1"
Sub SolveAndPlotEquations()
    ' Define variables for the coefficients and solutions.
    Dim a As Double
    Dim b As Double
    Dim c As Double
    Dim d As Double
    Dim x As Double
    Dim y As Double
    Dim i As Long

    ' Set the coefficients.
    a = 2
    b = 3
    c = 1
    d = 2

    ' Create a range of x-values
    Dim xValues() As Double
    ReDim xValues(1 To 400)
    For i = 1 To 400
        xValues(i) = -10 + (i - 1) * 0.05
    Next i

    ' Create arrays to store y-values for both equations
    Dim y1Values() As Double
    Dim y2Values() As Double
    ReDim y1Values(1 To 400)
    ReDim y2Values(1 To 400)

    ' Calculate corresponding y-values for the two equations
    For i = 1 To 400
        y1Values(i) = (3 - 2 * xValues(i)) / 3
        y2Values(i) = (1 - xValues(i)) / 2
    Next i

    ' Create a new worksheet for the graph
    Dim ws As Worksheet
    Set ws = ThisWorkbook.Sheets.Add

    ' Plot the two equations
    Dim cht As ChartObject
    Set cht = ws.ChartObjects.Add(Left:=100, Width:=375, Top:=75, Height:=225)
    With cht.Chart
        .ChartType = xlXYScatterLines
        .HasLegend = True
        .Legend.Position = xlLegendPositionRight

        ' Add data series for each equation
        .SeriesCollection.NewSeries
        .SeriesCollection(1).xValues = xValues
        .SeriesCollection(1).Values = y1Values
        .SeriesCollection(1).Name = "2x + 3y = 3"
        .SeriesCollection(1).MarkerStyle = xlMarkerStyleNone  ' Remove markers (optional)
        .SeriesCollection(1).Format.Line.Weight = 2  ' Set line width to 2 points (adjust as needed)


        .SeriesCollection.NewSeries
        .SeriesCollection(2).xValues = xValues
        .SeriesCollection(2).Values = y2Values
        .SeriesCollection(2).Name = "x + 2y = 1"
        .SeriesCollection(1).MarkerStyle = xlMarkerStyleNone  ' Remove markers (optional)
        .SeriesCollection(1).Format.Line.Weight = 2  ' Set line width to 2 points (adjust as needed)


    ' Find the intersection point
    x = 0
    y = 0
    For i = 1 To 399
        If (y1Values(i) - y2Values(i)) * (y1Values(i + 1) - y2Values(i + 1)) < 0 Then
            x = xValues(i)
            y = y1Values(i)
            Exit For
        End If
    Next i

    ' Plot the intersection point
    cht.Chart.SeriesCollection(1).Points(i).HasDataLabel = True
    cht.Chart.SeriesCollection(1).Points(i).DataLabel.Text = "Intersection"
    ' Add a big green circle at the intersection point within the scatter plot
    cht.Chart.Shapes.AddShape(msoShapeOval, x, y, 10, 10).Fill.ForeColor.RGB = RGB(0, 255, 0)
    End With

    ' Display the result
    ws.Cells(1, 1).Value = "Intersection Point:"
    ws.Cells(2, 1).Value = "x = " & x
    ws.Cells(3, 1).Value = "y = " & y
End Sub

