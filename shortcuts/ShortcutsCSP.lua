--[[
🎨 ATAJOS DE TECLADO PARA CLIP STUDIO PAINT
==========================================
Este archivo contiene únicamente los atajos específicos para Clip Studio Paint.
El sistema base está en MacroKeyboardSystem.lua

FUNCIONES ESPECÍFICAS DE CSP:
• Color Picker: Tu solución que funciona con screen_color_pick()
• Brush Size +/-: Ajustar tamaño de pincel
• Undo/Redo: Deshacer y rehacer acciones
• Zoom: Acercar y alejar canvas
• Rotate Canvas: Rotar lienzo
• Hand Tool: Herramienta mano para navegar

INSTRUCCIONES:
1. Descomenta las teclas que quieras usar
2. Modifica las acciones según tus preferencias
3. Ejecuta el script para activar las macros
--]]

-- Cargar el sistema base de teclado macro
require('./configuration/MacroKeyboardSystem')

-- ========================================
-- FUNCIONES ESPECÍFICAS DE CLIP STUDIO PAINT
-- ========================================

-- Color picker para toda la pantalla (tu solución que funciona)
function screen_color_pick()
    lmc_send_keys('%');
    lmc_send_keys('e');
    lmc_send_keys('x');
end

-- Funciones de pincel
local function csp_brush_size_up()
    lmc_send_keys(']')  -- Aumentar tamaño de pincel
end

local function csp_brush_size_down()
    lmc_send_keys('[')  -- Disminuir tamaño de pincel
end

-- Funciones de zoom
local function csp_zoom_in()
    lmc_send_keys('^{PLUS}')  -- Ctrl + "+" para zoom in
end

local function csp_zoom_out()
    lmc_send_keys('^{MINUS}')  -- Ctrl + "-" para zoom out
end

local function csp_zoom_fit()
    lmc_send_keys('^0')  -- Ctrl + 0 para ajustar zoom
end

-- Funciones de rotación de canvas
local function csp_rotate_left()
    lmc_send_keys('^+{LEFT}')  -- Ctrl + Shift + Flecha Izquierda
end

local function csp_rotate_right()
    lmc_send_keys('^+{RIGHT}')  -- Ctrl + Shift + Flecha Derecha
end

local function csp_reset_rotation()
    lmc_send_keys('^+r')  -- Ctrl + Shift + R para resetear rotación
end

-- Herramientas
local function csp_hand_tool()
    lmc_send_keys('h')  -- Herramienta mano
end

local function csp_brush_tool()
    lmc_send_keys('b')  -- Herramienta pincel
end

local function csp_eraser_tool()
    lmc_send_keys('e')  -- Herramienta borrador
end

local function csp_eyedropper_tool()
    lmc_send_keys('i')  -- Herramienta cuentagotas
end

-- Capas
local function csp_new_layer()
    lmc_send_keys('^+n')  -- Ctrl + Shift + N para nueva capa
end

local function csp_merge_down()
    lmc_send_keys('^e')  -- Ctrl + E para fusionar hacia abajo
end

-- ========================================
-- CONFIGURACIÓN DE TECLAS PARA CLIP STUDIO PAINT
-- ========================================
local csp_key_mappings = {
    -- FILA SUPERIOR - Herramientas principales
    [KEY_UP_1] = create_key_action("🎨 Color Picker", screen_color_pick),
    [KEY_UP_2] = create_key_action("🖌️ Pincel (B)", csp_brush_tool),
    [KEY_UP_3] = create_key_action("🧽 Borrador (E)", csp_eraser_tool),
    [KEY_UP_4] = create_key_action("👁️ Cuentagotas (I)", csp_eyedropper_tool),
    
    -- FILA MEDIA - Acciones comunes
    [KEY_MIDDLE_1] = create_key_action("↩️ Deshacer", function() lmc_send_keys('^z') end),
    [KEY_MIDDLE_2] = create_key_action("↪️ Rehacer", function() lmc_send_keys('^y') end),
    [KEY_MIDDLE_3] = create_key_action("🆕 Nueva Capa", csp_new_layer),
    [KEY_MIDDLE_4] = create_key_action("🤚 Herramienta Mano (H)", csp_hand_tool),
    
    -- FILA INFERIOR - Zoom y navegación
    [KEY_DOWN_1] = create_key_action("🔍+ Zoom In", csp_zoom_in),
    [KEY_DOWN_2] = create_key_action("🔍- Zoom Out", csp_zoom_out),
    [KEY_DOWN_3] = create_key_action("🎯 Ajustar Zoom", csp_zoom_fit),
    [KEY_DOWN_4] = create_key_action("🔄 Reset Rotación", csp_reset_rotation),
    
    -- SLIDER CENTRO - Tamaño de pincel
    [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("🖌️- Pincel Pequeño", csp_brush_size_down),
    [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("💾 Guardar", function() lmc_send_keys('^s') end),
    [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("🖌️+ Pincel Grande", csp_brush_size_up),
    
    -- SLIDER ABAJO - Rotación de canvas
    [KEY_SLIDER_DOWN_LEFT] = create_key_action("↺ Rotar Izquierda", csp_rotate_left),
    [KEY_SLIDER_DOWN_CLICK] = create_key_action("🔄 Reset Rotación", csp_reset_rotation),
    [KEY_SLIDER_DOWN_RIGHT] = create_key_action("↻ Rotar Derecha", csp_rotate_right),
}

-- ========================================
-- INICIALIZAR EL SISTEMA PARA CLIP STUDIO PAINT
-- ========================================
print('🎨 Configurando atajos para Clip Studio Paint...')
print('==========================================')
print('✨ Teclas configuradas:')
print('   🎨 A: Color Picker (tu solución que funciona)')
print('   🖌️  B: Pincel')
print('   🧽 C: Borrador')
print('   👁️  D: Cuentagotas')
print('   ↩️  1: Deshacer (Ctrl+Z)')
print('   ↪️  2: Rehacer (Ctrl+Y)')
print('   🆕 3: Nueva Capa')
print('   🤚 4: Herramienta Mano')
print('   🔍 5-8: Zoom In/Out/Fit/Reset')
print('   🖌️  Slider Centro: Tamaño pincel y Guardar')
print('   ↺↻ Slider Abajo: Rotación de canvas')
print('==========================================')
print('💡 Color Picker simplificado:')
print('   • Usa tu solución que funciona perfectamente')
print('   • Sin complicaciones de toggle o hold')
print('   • Funciona con Alt+E+X automáticamente')
print('==========================================\n')

-- Inicializar el sistema con la configuración de CSP
initialize_macro_system(csp_key_mappings)
