--[[
📖 GUÍA PARA CREAR NUEVOS ARCHIVOS DE CONFIGURACIÓN
==================================================

Esta guía te ayuda a crear tus propios archivos de configuración para diferentes aplicaciones.

ESTRUCTURA BÁSICA DE UN ARCHIVO DE CONFIGURACIÓN:
===============================================

1. CARGAR EL SISTEMA BASE
require('./configuration/MacroKeyboardSystem')

2. DEFINIR FUNCIONES ESPECÍFICAS DE LA APLICACIÓN
local function mi_funcion_personalizada()
    lmc_send_keys('comando')
end

3. CREAR LA TABLA DE MAPEO
local mi_configuracion = {
    [KEY_UP_1] = create_key_action("Nombre", mi_funcion, false),
    -- ... más teclas
}

4. INICIALIZAR EL SISTEMA
initialize_macro_system(mi_configuracion)

EJEMPLOS DE CONFIGURACIONES POR APLICACIÓN:
==========================================

TECLAS ESPECIALES ÚTILES:
========================

MODIFICADORES:
• ^ = Ctrl
• + = Shift  
• % = Alt
• # = Win

TECLAS ESPECIALES:
• {F1} a {F12} = Teclas de función
• {TAB} = Tab
• {ENTER} = Enter
• {ESC} = Escape
• {SPACE} = Espacio
• {BACKSPACE} = Retroceso
• {DELETE} = Suprimir
• {HOME}, {END} = Inicio/Fin
• {PGUP}, {PGDN} = Re Pág/Av Pág
• {UP}, {DOWN}, {LEFT}, {RIGHT} = Flechas

COMBINACIONES COMUNES:
• '^c' = Ctrl+C (copiar)
• '^v' = Ctrl+V (pegar)
• '^z' = Ctrl+Z (deshacer)
• '^y' = Ctrl+Y (rehacer)
• '%{F4}' = Alt+F4 (cerrar)
• '#d' = Win+D (escritorio)

FUNCIONES DE MANTENER PRESIONADO:
===============================

Para funciones que requieren mantener una tecla:
• Usar hold_mode = true en create_key_action
• El sistema automáticamente detecta cuando soltar

Ejemplo:
[KEY_UP_1] = create_key_action("Mantener Space", function()
    lmc_send_input(32, 0, 0)  -- Space down
end, true)



PLANTILLA PARA NUEVAS CONFIGURACIONES:
====================================

-- Archivo: ShortcutsMiApp.lua
require('./configuration/MacroKeyboardSystem')

-- Funciones específicas
local function mi_funcion()
    lmc_send_keys('comando')
end

-- Configuración de teclas
local mi_app_mappings = {
    [KEY_UP_1] = create_key_action("Mi Acción", mi_funcion, false),
    -- ... más teclas
}

-- Inicializar
print('🎯 Configurando atajos para Mi Aplicación...')
initialize_macro_system(mi_app_mappings)

DEBUGGEAR PROBLEMAS:
==================

1. Si una tecla no funciona:
   • Verifica que el comando sea correcto
   • Prueba el comando manualmente primero
   • Revisa que no haya conflictos con otros atajos

2. Si el sistema no detecta teclas:
   • Verifica que el dispositivo esté conectado
   • Comprueba el ID del dispositivo

3. Para ver qué teclas se están presionando:
   • Usa el archivo Espia.lua para detectar códigos

¡DIVIÉRTETE CREANDO TUS CONFIGURACIONES! 🎉
--]]

print("📖 Guía de configuración cargada. ¡Lista para crear nuevas configuraciones!")
