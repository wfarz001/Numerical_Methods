VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
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

Sub Romberg()

Dim Integ(10, 10)

ea = 100
exact = f1(2) - f1(1)
a = 1
b = 2
I = 1
n = 1
Integ(1, 1) = Trap(n, a, b)

Do While ea > 0.001

    n = 2 ^ I
   'Next Integral Approx
    Integ(I + 1, 1) = Trap(n, a, b)
   'Romberg Integration
    For k = 2 To I + 1
      j = 2 + I - k
      Integ(j, k) = (4 ^ (k - 1) * Integ(j + 1, k - 1) - Integ(j, k - 1)) / (4 ^ (k - 1) - 1)
     
    Next k
    
     
    ea = Abs((Integ(1, I + 1) - Integ(2, I)) / Integ(1, I + 1)) * 100
    et = Abs((exact - Integ(1, I + 1)) / exact) * 100
    
    Cells(33 + I, 2) = I
    Cells(33 + I, 3) = ea
    Cells(33 + I, 4) = et
    Cells(33 + I, 5) = Integ(1, I + 1)
    
    I = I + 1
    
Loop

For I = 1 To k
   For j = 1 To k
   
    Cells(27 + I, 1 + j) = Integ(I, j)
    Next j
Next I

End Sub
