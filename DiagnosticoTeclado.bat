@echo off
REM ============================================
REM 🔍 DIAGNÓSTICO DE TECLADO MACRO
REM ============================================
REM Este archivo ejecuta el script de diagnóstico para
REM ver qué teclas se están presionando

echo.
echo ==========================================
echo 🔍 MODO DIAGNÓSTICO - ESPÍA DE TECLAS
echo ==========================================
echo.

REM Cambiar al directorio donde están los scripts
cd /d "%~dp0"

REM Verificar que existe el archivo de diagnóstico
if not exist "Espia.lua" (
    echo ❌ ERROR: No se encuentra el archivo Espia.lua
    echo    Este archivo es necesario para el diagnóstico
    echo.
    pause
    exit /b 1
)

echo 📁 Directorio actual: %CD%
echo 📄 Ejecutando: Espia.lua
echo.
echo 💡 INSTRUCCIONES:
echo    • Presiona teclas en tu teclado macro
echo    • Los códigos aparecerán en esta ventana
echo    • Usa Ctrl+C para detener el diagnóstico
echo.
echo ⚠️  IMPORTANTE: Mantén esta ventana abierta
echo    para ver los códigos de las teclas presionadas
echo.

pause

echo ==========================================
echo ⚡ INICIANDO MODO ESPÍA...
echo ==========================================

REM Ejecutar el script de diagnóstico
"C:\luamacros\LuaMacros\LuaMacros.exe" "Espia.lua"

REM Si LuaMacros está en otra ubicación:
REM "C:\Program Files (x86)\LuaMacros\LuaMacros.exe" "Espia.lua"
REM "%LOCALAPPDATA%\Programs\LuaMacros\LuaMacros.exe" "Espia.lua"

echo.
echo ==========================================
echo 🏁 DIAGNÓSTICO FINALIZADO
echo ==========================================

if %errorlevel% neq 0 (
    echo ❌ ERROR: Problema durante la ejecución
    echo    Código de error: %errorlevel%
) else (
    echo ✅ Diagnóstico completado sin errores
)

echo.
echo Presiona cualquier tecla para cerrar...
pause >nul
