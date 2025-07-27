@echo off
REM ============================================
REM 🎯 EJECUTOR DE MACROS - CLIP STUDIO PAINT
REM ============================================
REM Este archivo ejecuta el script de LuaMacros para CSP
REM y mantiene la terminal abierta para ver los mensajes

echo.
echo ==========================================
echo INICIANDO MACROS PARA CLIP STUDIO PAINT
echo ==========================================
echo.

REM Cambiar al directorio padre donde está la estructura completa
cd /d "%~dp0\.."

REM Verificar que existe el archivo principal
if not exist "shortcuts\ShortcutsCSP.lua" (
    echo [ERROR]: No se encuentra el archivo shortcuts\ShortcutsCSP.lua
    echo    Verifica que el archivo esté en la carpeta shortcuts\
    echo.
    pause
    exit /b 1
)

REM Verificar que existe el sistema base
if not exist "configuration\MacroKeyboardSystem.lua" (
    echo [ERROR]: No se encuentra configuration\MacroKeyboardSystem.lua
    echo    Este archivo es necesario para que funcionen los scripts
    echo.
    pause
    exit /b 1
)

REM Mostrar información del sistema
echo [DIRECTORIO ACTUAL]: %CD%
echo [EJECUTANDO]: shortcuts\ShortcutsCSP.lua
echo.

REM Ejecutar LuaMacros con el script
echo Iniciando LuaMacros...
echo ==========================================

REM Ejecutar LuaMacros - ajusta la ruta según tu instalación
REM Opciones comunes de rutas de LuaMacros:
"C:\luamacros\LuaMacros.exe" "shortcuts\ShortcutsCSP.lua"

REM Si LuaMacros está en otra ubicación, descomenta y ajusta la línea correspondiente:
REM "C:\Program Files (x86)\LuaMacros\LuaMacros.exe" "shortcuts\ShortcutsCSP.lua"
REM "%LOCALAPPDATA%\Programs\LuaMacros\LuaMacros.exe" "shortcuts\ShortcutsCSP.lua"

echo.
echo ==========================================
echo SCRIPT FINALIZADO
echo ==========================================
echo.

REM Verificar si hubo algún error
if %errorlevel% neq 0 (
    echo [ERROR]: LuaMacros terminó con código de error %errorlevel%
    echo.
    echo [Posibles soluciones:]
    echo    • Verifica que LuaMacros esté instalado correctamente
    echo    • Ajusta la ruta de LuaMacros en este archivo .bat
    echo    • Revisa que el dispositivo USB esté conectado
    echo    • Ejecuta como administrador si es necesario
) else (
    echo [SUCCESS]: LuaMacros se ejecutó correctamente
)

echo.
echo Presiona cualquier tecla para cerrar esta ventana...
pause >nul
