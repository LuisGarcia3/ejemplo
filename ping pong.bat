@echo off
setlocal enabledelayedexpansion

rem Configuración del juego
set WIDTH=60
set HEIGHT=20
set "BALL_CHAR=O"
set "PADDLE_CHAR=|"

rem Variables de estado
set "BALL_X=30"
set "BALL_Y=10"
set "BALL_DX=1"
set "BALL_DY=1"
set "PLAYER_Y=10"

:game_loop
cls
call :draw_board

rem Mover la pelota
set /a "BALL_X+=BALL_DX"
set /a "BALL_Y+=BALL_DY"

rem Rebote en las paredes verticales
if %BALL_X% leq 0 set "BALL_DX=1"
if %BALL_X% gtr %WIDTH% set "BALL_DX=-1"

rem Rebote en las paredes horizontales
if %BALL_Y% leq 0 set "BALL_DY=1"
if %BALL_Y% gtr %HEIGHT% set "BALL_DY=-1"

rem Comprobar colisión con la paleta del jugador
if %BALL_X% equ 1 (
    if %BALL_Y% equ %PLAYER_Y% (
        set "BALL_DX=1"
    )
)

rem Mover la paleta del jugador
choice /c:wasd /n /t:0.1 /d:w > nul
set "PADDLE_DIRECTION=%errorlevel%"

if %PADDLE_DIRECTION% equ 2 (
    if %PLAYER_Y% lss %HEIGHT% (
        set /a "PLAYER_Y+=1"
    )
)
if %PADDLE_DIRECTION% equ 3 (
    if %PLAYER_Y% gtr 1 (
        set /a "PLAYER_Y-=1"
    )
)

goto :game_loop

:draw_board
echo.

for /l %%y in (1,1,%HEIGHT%) do (
    for /l %%x in (1,1,%WIDTH%) do (
        if %%x equ 1 (
            if %%y equ %PLAYER_Y% (
                echo -n %PADDLE_CHAR%
            ) else (
                echo -n " "
            )
        ) else if %%x equ %BALL_X% (
            if %%y equ %BALL_Y% (
                echo -n %BALL_CHAR%
            ) else (
                echo -n " "
            )
        ) else (
            echo -n " "
        )
    )
    echo.
)

exit /b
