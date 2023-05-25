@echo off
setlocal enabledelayedexpansion

rem Configuración del juego
set WIDTH=20
set HEIGHT=10
set "SNAKE_CHAR=O"
set "FOOD_CHAR=*"

rem Variables de estado
set "GAME_OVER="
set "SNAKE=0,0"

:game_loop
cls
call :draw_board

rem Mover la serpiente
choice /c:wasd /n /t:0.1 /d:w > nul
set "DIRECTION=%errorlevel%"

rem Obtener la posición actual de la cabeza de la serpiente
for %%a in (!SNAKE!) do set "HEAD=%%a"

rem Calcular la nueva posición de la cabeza de la serpiente
set /a "NEW_HEAD_X=!HEAD:*,=!"
set /a "NEW_HEAD_Y=!HEAD:*,!"

if %DIRECTION% equ 1 (set /a "NEW_HEAD_X-=1")
if %DIRECTION% equ 2 (set /a "NEW_HEAD_X+=1")
if %DIRECTION% equ 3 (set /a "NEW_HEAD_Y-=1")
if %DIRECTION% equ 4 (set /a "NEW_HEAD_Y+=1")

rem Comprobar colisiones con los bordes
if !NEW_HEAD_X! lss 0 set "NEW_HEAD_X=%WIDTH%"
if !NEW_HEAD_X! gtr %WIDTH% set "NEW_HEAD_X=0"
if !NEW_HEAD_Y! lss 0 set "NEW_HEAD_Y=%HEIGHT%"
if !NEW_HEAD_Y! gtr %HEIGHT% set "NEW_HEAD_Y=0"

rem Actualizar la serpiente
set "SNAKE=%NEW_HEAD_X%,%NEW_HEAD_Y%!SNAKE:~0,-1!"

rem Comprobar colisiones con la comida
if "!SNAKE:~0,5!"=="%FOOD_CHAR%" (
    call :generate_food
    set "SNAKE=%NEW_HEAD_X%,%NEW_HEAD_Y%!SNAKE!"
)

rem Comprobar colisiones con el cuerpo de la serpiente
for %%a in (!SNAKE:~5!) do (
    if %%a equ %NEW_HEAD_X%,%NEW_HEAD_Y% (
        set "GAME_OVER=1"
        goto :game_over
    )
)

goto :game_loop

:game_over
cls
echo Game Over!
pause
exit /b

:draw_board
echo.
for /l %%y in (0,1,%HEIGHT%) do (
    for /l %%x in (0,1,%WIDTH%) do (
        if "!SNAKE!"=="%%x,%%y!SNAKE:~5!" (
            echo -n %SNAKE_CHAR%
        ) else if "!SNAKE:~5!"=="!FOOD_CHAR!" (
            echo -n %FOOD_CHAR%
        ) else (
            echo -n " "
        )
)
echo.
)
exit /b

:generate_food
set /a "FOOD_X=!random! %% %WIDTH% + 1"
set /a "FOOD_Y=!random! %% %HEIGHT% + 1"
set "FOOD=%FOOD_X%,%FOOD_Y%"

rem Comprobar que la comida no esté en la posición de la serpiente
for %%a in (!SNAKE!) do (
if %%a equ %FOOD_X%,%FOOD_Y% (
call :generate_food
exit /b
)
)

set "SNAKE=%FOOD%!SNAKE!"
exit /b
