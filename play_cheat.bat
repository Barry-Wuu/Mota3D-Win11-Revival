@echo off
rem ============================================
rem  3D MO TA (MTR) - CHEAT launcher (built-in heal hack)
rem  Starts a tiny local web server, then opens the
rem  game in a standalone Flash Player projector.
rem  play_cheat.swf has the heal hack compiled in:
rem  press SPACE (when below max HP) to refill HP to full.
rem ============================================
setlocal
cd /d "%~dp0"
set PORT=8777

set PY=D:/B++/Py313/python.exe
if not exist "%PY%" set PY=python

set FLASH=D:/Adobe Flash CS6\Players\Release\FlashPlayer.exe
if not exist "%FLASH%" set FLASH=D:/Adobe Flash CS6\Players\FlashPlayer.exe
if not exist "%FLASH%" set FLASH=D:/Macromedia Flash Player\SAFlashPlayer.exe

echo [1/3] starting local server on port %PORT% ...
start "mtr-server" /min "%PY%" -m http.server %PORT% --bind 127.0.0.1

echo [2/3] waiting for server ...
ping -n 3 127.0.0.1 >nul

echo [3/3] launching Flash Player (CHEAT / heal hack ON) ...
start "" "%FLASH%" "http://127.0.0.1:%PORT%/play_cheat.swf"

echo.
echo Game window should appear shortly.
echo SPACE (when below max HP) = refill to full. A green toast shows the result.
echo Keep the "mtr-server" window open while playing.
echo Close it when you are done.
echo.
pause
