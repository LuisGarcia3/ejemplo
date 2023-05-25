@echo off

set /p animal=Ingrese el nombre de un animal: 

if /i "%animal%"=="leon" (
    echo El animal es carnivoro.
) else if /i "%animal%"=="tigre" (
    echo El animal es carnivoro.
) else if /i "%animal%"=="lobo" (
    echo El animal es carnivoro.
) else if /i "%animal%"=="águila" (
    echo El animal es carnivoro.
) else if /i "%animal%"=="cocodrilo" (
    echo El animal es carnivoro.
) else if /i "%animal%"=="vaca" (
    echo El animal es herbivoro.
) else if /i "%animal%"=="caballo" (
    echo El animal es herbivoro.
) else if /i "%animal%"=="oveja" (
    echo El animal es herbivoro.
) else if /i "%animal%"=="conejo" (
    echo El animal es herbivoro.
) else if /i "%animal%"=="elefante" (
    echo El animal es herbivoro.
) else if /i "%animal%"=="gallina" (
    echo El animal es oviparo.
) else if /i "%animal%"=="pato" (
    echo El animal es oviparo.
) else if /i "%animal%"=="pinguino" (
    echo El animal es oviparo.
) else if /i "%animal%"=="tiburon" (
    echo El animal es acuatico.
) else if /i "%animal%"=="ballena" (
    echo El animal es acuatico.
) else if /i "%animal%"=="delfín" (
    echo El animal es acuatico.
) else (
    echo No se pudo determinar la clasificación del animal.
)

pause
