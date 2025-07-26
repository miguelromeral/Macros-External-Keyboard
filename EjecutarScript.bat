@echo off
REM ============================================
REM 🚀 EJECUTOR GENÉRICO DE SCRIPTS LUAMACROS
REM ============================================
REM Este archivo te permite ejecutar cualquier script de LuaMacros
REM con salida visible en la terminal

setlocal enabledelayedexpansion

echo.
echo ==========================================
echo 🚀 EJECUTOR DE SCRIPTS LUAMACROS
echo ==========================================
echo.

REM Cambiar al directorio donde están los scripts
cd /d "%~dp0"

REM Mostrar scripts disponibles
echo 📁 Scripts disponibles:
echo.
if exist "shortcuts\ShortcutsCSP.lua" echo    1. ShortcutsCSP.lua (Clip Studio Paint)
if exist "shortcuts\ShortcutsWindows.lua" echo    2. ShortcutsWindows.lua (Windows General)
if exist "Espia.lua" echo    3. Espia.lua (Diagnóstico de teclas)
echo    4. Otro archivo (especificar manualmente)
echo.

set /p choice="Selecciona una opción (1-4): "

set script_file=
if "%choice%"=="1" set script_file=shortcuts\ShortcutsCSP.lua
if "%choice%"=="2" set script_file=shortcuts\ShortcutsWindows.lua
if "%choice%"=="3" set script_file=Espia.lua
if "%choice%"=="4" (
    set /p script_file="Introduce el nombre del archivo: "
)

if "%script_file%"=="" (
    echo ❌ ERROR: Opción no válida
    goto :end
)

REM Verificar que existe el archivo
if not exist "%script_file%" (
    echo ❌ ERROR: No se encuentra el archivo "%script_file%"
    echo    Verifica que el archivo existe en el directorio correcto
    goto :end
)

echo.
echo ==========================================
echo ⚡ EJECUTANDO: %script_file%
echo ==========================================
echo 📁 Directorio: %CD%
echo.

REM Ejecutar LuaMacros con el script seleccionado
REM Ajusta la ruta según tu instalación de LuaMacros
"C:\luamacros\LuaMacros\LuaMacros.exe" "%script_file%"

REM Si LuaMacros está en otra ubicación, descomenta y ajusta:
REM "C:\Program Files (x86)\LuaMacros\LuaMacros.exe" "%script_file%"
REM "%LOCALAPPDATA%\Programs\LuaMacros\LuaMacros.exe" "%script_file%"

echo.
echo ==========================================
echo 🏁 EJECUCIÓN COMPLETADA
echo ==========================================

REM Verificar si hubo algún error
if %errorlevel% neq 0 (
    echo ❌ ERROR: Código de salida %errorlevel%
    echo.
    echo 💡 Posibles soluciones:
    echo    • Verifica la instalación de LuaMacros
    echo    • Ajusta la ruta en este archivo .bat
    echo    • Conecta el dispositivo USB correctamente
    echo    • Ejecuta como administrador
) else (
    echo ✅ Script ejecutado correctamente
)

:end
echo.
echo Presiona cualquier tecla para salir...
pause >nul
