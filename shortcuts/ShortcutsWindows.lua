--[[
💻 ATAJOS DE TECLADO GENERALES PARA WINDOWS
==========================================
Este archivo contiene atajos generales útiles para Windows.
El sistema base está en MacroKeyboardSystem.lua

FUNCIONES INCLUIDAS:
• Copiar, Pegar, Cortar, Deshacer
• Navegación de pestañas
• Control de volumen/brillo
• Cambio entre ventanas
• Zoom universal
• Accesos directos de sistema

INSTRUCCIONES:
1. Ejecuta este script para activar los atajos generales
2. Modifica las asignaciones según tus preferencias
--]]

-- Cargar el sistema base de teclado macro
require('../configuration/MacroKeyboardSystem')

-- ========================================
-- FUNCIONES ESPECÍFICAS PARA WINDOWS
-- ========================================

-- Funciones de ventanas
local function minimize_window()
    lmc_send_keys('#m')  -- Win + M
end

local function maximize_window()
    lmc_send_keys('#{UP}')  -- Win + Flecha Arriba
end

local function show_desktop()
    lmc_send_keys('#d')  -- Win + D
end

local function task_manager()
    lmc_send_keys('^+{ESC}')  -- Ctrl + Shift + Esc
end

-- Funciones de texto
local function select_all()
    lmc_send_keys('^a')  -- Ctrl + A
end

local function find_text()
    lmc_send_keys('^f')  -- Ctrl + F
end

local function replace_text()
    lmc_send_keys('^h')  -- Ctrl + H
end

-- Navegación de pestañas avanzada
local function close_all_tabs()
    lmc_send_keys('^+w')  -- Ctrl + Shift + W
end

local function duplicate_tab()
    lmc_send_keys('^+k')  -- Ctrl + Shift + K (algunos navegadores)
end

-- Control de medios
local function play_pause()
    lmc_send_input(179, 0, 0)  -- VK_MEDIA_PLAY_PAUSE
    lmc_send_input(179, 2, 0)
end

local function next_track()
    lmc_send_input(176, 0, 0)  -- VK_MEDIA_NEXT_TRACK
    lmc_send_input(176, 2, 0)
end

local function prev_track()
    lmc_send_input(177, 0, 0)  -- VK_MEDIA_PREV_TRACK
    lmc_send_input(177, 2, 0)
end

-- ========================================
-- CONFIGURACIÓN DE TECLAS PARA WINDOWS
-- ========================================
local windows_key_mappings = {
    -- FILA SUPERIOR - Clipboard y edición
    [KEY_UP_1] = create_key_action("📋 Pegar", paste_action, false),
    [KEY_UP_2] = create_key_action("📄 Copiar", copy_action, false),
    [KEY_UP_3] = create_key_action("✂️ Cortar", cut_action, false),
    [KEY_UP_4] = create_key_action("↩️ Deshacer", undo_action, false),
    
    -- FILA MEDIA - Navegación y ventanas
    [KEY_MIDDLE_1] = create_key_action("💾 Guardar", save_action, false),
    [KEY_MIDDLE_2] = create_key_action("🔍 Buscar", find_text, false),
    [KEY_MIDDLE_3] = create_key_action("🔄 Alt+Tab", alt_tab_action, false),
    [KEY_MIDDLE_4] = create_key_action("🖥️ Escritorio", show_desktop, false),
    
    -- FILA INFERIOR - Pestañas y navegación web
    [KEY_DOWN_1] = create_key_action("📑 Nueva Pestaña", new_tab_action, false),
    [KEY_DOWN_2] = create_key_action("❌ Cerrar Pestaña", close_tab_action, false),
    [KEY_DOWN_3] = create_key_action("🔙 Reabrir Pestaña", reopen_tab_action, false),
    [KEY_DOWN_4] = create_key_action("📋 Seleccionar Todo", select_all, false),
    
    -- SLIDER CENTRO - Control de volumen
    [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("🔉 Volumen -", send_volume_down, false),
    [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("🔊 Volumen +", send_volume_up, false),
    
    -- SLIDER ABAJO - Control de medios
    [KEY_SLIDER_DOWN_LEFT] = create_key_action("⏮️ Pista Anterior", prev_track, false),
    [KEY_SLIDER_DOWN_CLICK] = create_key_action("⏯️ Play/Pausa", play_pause, false),
    [KEY_SLIDER_DOWN_RIGHT] = create_key_action("⏭️ Pista Siguiente", next_track, false),
    
    -- Opciones adicionales comentadas
    -- [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("🔇 Mutear", mute_toggle, false),
    -- [KEY_UP_1] = create_key_action("🔒 Bloquear PC", function() lmc_send_keys('#l') end, false),
}

-- ========================================
-- INICIALIZAR EL SISTEMA PARA WINDOWS
-- ========================================
print('💻 Configurando atajos generales para Windows...')
print('==========================================')
print('✨ Teclas configuradas:')
print('   📋 A: Pegar')
print('   📄 B: Copiar') 
print('   ✂️ C: Cortar')
print('   ↩️ D: Deshacer')
print('   💾 E: Guardar')
print('   🔍 F: Buscar')
print('   🔄 G: Alt+Tab')
print('   🖥️ H: Mostrar Escritorio')
print('   📑 I: Nueva Pestaña')
print('   ❌ J: Cerrar Pestaña')
print('   🔙 K: Reabrir Pestaña')
print('   📋 L: Seleccionar Todo')
print('   🔊 Sliders: Volumen / Control de medios')
print('==========================================\n')

-- Inicializar el sistema con la configuración de Windows
initialize_macro_system(windows_key_mappings)
