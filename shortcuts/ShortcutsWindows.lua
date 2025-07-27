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
-- CONFIGURACIÓN DE TECLAS PARA WINDOWS
-- ========================================
local windows_key_mappings = {
    -- FILA SUPERIOR - Clipboard y edición
    [KEY_UP_1] = create_key_action("📋 Pegar", paste_action),
    [KEY_UP_2] = create_key_action("📄 Copiar", copy_action),
    [KEY_UP_3] = create_key_action("✂️ Cortar", cut_action),
    [KEY_UP_4] = create_key_action("↩️ Deshacer", undo_action),
    
    -- FILA MEDIA - Navegación y ventanas
    [KEY_MIDDLE_1] = create_key_action("💾 Guardar", save_action),
    [KEY_MIDDLE_2] = create_key_action("🔍 Buscar", find_text),
    [KEY_MIDDLE_3] = create_key_action("🔄 Alt+Tab", alt_tab_action),
    [KEY_MIDDLE_4] = create_key_action("🖥️ Escritorio", show_desktop),
    
    -- FILA INFERIOR - Pestañas y navegación web
    [KEY_DOWN_1] = create_key_action("📑 Nueva Pestaña", new_tab_action),
    [KEY_DOWN_2] = create_key_action("❌ Cerrar Pestaña", close_tab_action),
    [KEY_DOWN_3] = create_key_action("🔙 Reabrir Pestaña", reopen_tab_action),
    [KEY_DOWN_4] = create_key_action("📋 Seleccionar Todo", select_all),
    
    -- SLIDER CENTRO - Control de volumen
    [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("🔉 Volumen -", send_volume_down),
    [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("🔊 Volumen +", send_volume_up),
    
    -- SLIDER ABAJO - Control de medios
    [KEY_SLIDER_DOWN_LEFT] = create_key_action("⏮️ Pista Anterior", prev_track),
    [KEY_SLIDER_DOWN_CLICK] = create_key_action("⏯️ Play/Pausa", play_pause),
    [KEY_SLIDER_DOWN_RIGHT] = create_key_action("⏭️ Pista Siguiente", next_track),
}

-- ========================================
-- INICIALIZAR EL SISTEMA PARA WINDOWS
-- ========================================
print('💻 Configurando atajos generales para Windows...')
print('==========================================')
print('✨ Teclas configuradas:')
print('   📋 A: Pegar | 📄 B: Copiar | ✂️ C: Cortar | ↩️ D: Deshacer')
print('   💾 E: Guardar | 🔍 F: Buscar | 🔄 G: Alt+Tab | 🖥️ H: Escritorio')
print('   📑 I: Nueva Pestaña | ❌ J: Cerrar Pestaña | 🔙 K: Reabrir | 📋 L: Seleccionar Todo')
print('   🔊 Sliders: Volumen / Control de medios')
print('==========================================\n')

-- Inicializar el sistema con la configuración de Windows
initialize_macro_system(windows_key_mappings)
