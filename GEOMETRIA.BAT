@echo off
set /p figura1=Ingrese la primera figura: 
set /p figura2=Ingrese la segunda figura: 
set /p figura3=Ingrese la tercera figura: 

if "%figura1%"=="cuadrado" (
  set /p lado1=Ingrese el lado del cuadrado: 
  set /a area1=%lado1%*%lado1%
  set /a perimetro1=4*%lado1%
  echo El área del cuadrado es: %area1%
  echo El perímetro del cuadrado es: %perimetro1%
)

if "%figura1%"=="circulo" (
  set /p radio1=Ingrese el radio del circulo: 
  set /a area1=3*%radio1%*%radio1%
  set /a perimetro1=2*3*%radio1%
  echo El area del circulo es: %area1%
  echo El perimetro del circulo es: %perimetro1%
)

if "%figura1%"=="triangulo" (
  set /p base1=Ingrese la base del triangulo: 
  set /p altura1=Ingrese la altura del triangulo: 
  set /a area1=(%base1%*%altura1%)/2
  set /a perimetro1=3*%base1%
  echo El area del triangulo es: %area1%
  echo El perimetro del triangulo es: %perimetro1%
)

if "%figura2%"=="cuadrado" (
  set /p lado2=Ingrese el lado del cuadrado: 
  set /a area2=%lado2%*%lado2%
  set /a perimetro2=4*%lado2%
  echo El area del cuadrado es: %area2%
  echo El perimetro del cuadrado es: %perimetro2%
)

if "%figura2%"=="circulo" (
  set /p radio2=Ingrese el radio del circulo: 
  set /a area2=3*%radio2%*%radio2%
  set /a perimetro2=2*3*%radio2%
  echo El area del circulo es: %area2%
  echo El perímetro del circulo es: %perimetro2%
)

if "%figura2%"=="triangulo" (
  set /p base2=Ingrese la base del triangulo: 
  set /p altura2=Ingrese la altura del triangulo: 
  set /a area2=(%base2%*%altura2%)/2
  set /a perimetro2=3*%base2%
  echo El area del triangulo es: %area2%
  echo El perimetro del triangulo es: %perimetro2%
)

if "%figura3%"=="cuadrado" (
  set /p lado3=Ingrese el lado del cuadrado: 
  set /a area3=%lado3%*%lado3%
  set /a perimetro3=4*%lado3%
  echo El area del cuadrado es: %area3%
  echo El perimetro del cuadrado es: %perimetro3%
)

if "%figura3%"=="circulo" (
  set /p radio3=Ingrese el radio del circulo:
  set /a area3=3*%radio3%%radio3%
  set /a perimetro3=23*%radio3%
  echo El area del circulo es: %area3%
  echo El perímetro del circulo es: %perimetro3%
)

if "%figura3%"=="triangulo" (
  set /p base3=Ingrese la base del triángulo:
  set /p altura3=Ingrese la altura del triángulo:
  set /a area3=(%base3%%altura3%)/2
  set /a perimetro3=3%base3%
  echo El area del triangulo es: %area3%
  echo El perimetro del triangulo es: %perimetro3%
)

pause