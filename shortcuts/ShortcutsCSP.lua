--[[
🎨 ATAJOS DE TECLADO PARA CLIP STUDIO PAINT
==========================================
Este archivo contiene únicamente los atajos específicos para Clip Studio Paint.
El sistema base está en MacroKeyboardSystem.lua
--]]

-- Cargar el sistema base de teclado macro
require('../configuration/MacroKeyboardSystem')

-- ========================================
-- FUNCIONES ESPECÍFICAS DE CLIP STUDIO PAINT
-- ========================================

-- ==========================================
-- 🎨 HERRAMIENTAS DE DIBUJO
-- ==========================================
local function csp_brush_tool()
    lmc_send_keys('3')  -- Herramienta pincel personalizada
end

local function csp_eraser_tool()
    lmc_send_keys('º')  -- Herramienta borrador
end

local function csp_lasso_tool()
    lmc_send_keys('m')  -- Herramienta Lazo
end

-- ==========================================
-- 🖌️ AJUSTES DE PINCEL
-- ==========================================
local function csp_brush_size_down()
    lmc_send_keys('1')  -- Disminuir tamaño de pincel
end

local function csp_brush_size_up()
    lmc_send_keys('2')  -- Aumentar tamaño de pincel
end

local function csp_toggle_color_mixing()
    lmc_send_keys('e')  -- Toggle mezcla de colores
end

-- ==========================================
-- 🎨 COLOR Y PICKER
-- ==========================================
function screen_color_pick()
    lmc_send_keys('%');
    lmc_send_keys('e');
    lmc_send_keys('x');
end

local function csp_switch_transparent()
    lmc_send_keys('c')  -- Cambiar a color transparente
end

-- ==========================================
-- 🔄 TRANSFORMACIONES Y CANVAS
-- ==========================================
local function csp_transform()
    lmc_send_keys('^t')  -- Herramienta transformar
end

local function csp_rotate_left()
    lmc_send_keys('-')  -- Rotar canvas izquierda
end

local function csp_rotate_right()
    lmc_send_keys('´')  -- Rotar canvas derecha
end

local function csp_reset_rotation()
    lmc_send_keys('^,')  -- Reset rotación canvas
end

local function csp_flip_canvas()
    lmc_send_keys('.')  -- Voltear canvas horizontalmente
end

-- ==========================================
-- 🔍 ZOOM Y NAVEGACIÓN
-- ==========================================
local function csp_zoom_fit()
    lmc_send_keys('^0')  -- Ajustar zoom al canvas
end

-- ==========================================
-- 📑 CAPAS
-- ==========================================
local function csp_new_layer()
    lmc_send_keys('^+n')  -- Nueva capa
end

local function csp_merge_down()
    lmc_send_keys('^e')  -- Fusionar capa hacia abajo
end

-- ==========================================
-- 🎛️ INTERFAZ Y SELECCIÓN
-- ==========================================
local function csp_hide_ui()
    lmc_send_keys('{TAB}')  -- Esconder/mostrar UI
end

local function csp_deselect()
    lmc_send_keys('^d')  -- Deseleccionar
end

local function csp_move_tool()
    lmc_send_keys('k')
end

-- ==========================================
-- 🎪 EFECTOS ESPECIALES
-- ==========================================
local function csp_liquify()
    lmc_send_keys('l')  -- Herramienta Liquify
end

-- ==========================================
-- ↩️ ACCIONES COMUNES (DESHACER/REHACER)
-- ==========================================
local function common_undo()
    lmc_send_keys('^z')  -- Ctrl + Z para deshacer
end

local function common_redo()
    lmc_send_keys('^y')  -- Ctrl + Y para rehacer
end

local function csp_redo()
    lmc_send_keys('^+z')  -- Ctrl + Shift + Z para rehacer
end


-- ========================================
-- CONFIGURACIÓN DE TECLAS PARA CLIP STUDIO PAINT
-- ========================================
local csp_key_mappings = {
    -- [] = create_key_action("🎨 Mezcla Color", csp_toggle_color_mixing),

    -- FILA SUPERIOR - Herramientas principales de dibujo
    [KEY_UP_1] = create_key_action("🎨 Color Picker", screen_color_pick),
    [KEY_UP_2] = create_key_action("💧 Liquify", csp_liquify),
    [KEY_UP_3] = create_key_action("🧽 Borrador", csp_eraser_tool),
    [KEY_UP_4] = create_key_action("🖌️ Pincel", csp_brush_tool),

    -- FILA MEDIA - Acciones y herramientas secundarias
    [KEY_MIDDLE_1] = create_key_action("Deseleccionar", csp_deselect),
    [KEY_MIDDLE_2] = create_key_action("Mover", csp_move_tool),
    [KEY_MIDDLE_3] = create_key_action("🎗️ Lazo", csp_lasso_tool),
    [KEY_MIDDLE_4] = create_key_action("🔄 Voltear Canvas", csp_flip_canvas),

    -- FILA INFERIOR - UI y funciones globales
    [KEY_DOWN_1] = create_key_action("🎯 Zoom Fit", csp_zoom_fit),
    [KEY_DOWN_2] = create_key_action("🖼️ Toggle UI", csp_hide_ui),
    [KEY_DOWN_3] = create_key_action("↪️ Rehacer", csp_redo),
    [KEY_DOWN_4] = create_key_action("↩️ Deshacer", common_undo),


    -- SLIDER CENTRO - Rotación de canvas (mantenidos como están)
    [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("↺ Rotar Izquierda", csp_rotate_left),
    [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("🔄 Reset Rotación", csp_reset_rotation),
    [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("↻ Rotar Derecha", csp_rotate_right),

    -- SLIDER ABAJO - Tamaño de pincel (mantenidos como están)
    [KEY_SLIDER_DOWN_LEFT] = create_key_action("🖌️- Pincel Pequeño", csp_brush_size_down),
    [KEY_SLIDER_DOWN_CLICK] = create_key_action("➕ Transformar", csp_transform),
    [KEY_SLIDER_DOWN_RIGHT] = create_key_action("🖌️+ Pincel Grande", csp_brush_size_up),
}


-- Inicializar el sistema con la configuración de CSP
initialize_macro_system(csp_key_mappings)
