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
-- 🔄 SISTEMA DE SETS MÚLTIPLES
-- ==========================================
local current_set = 1
local total_sets = 3

-- Declaración forward de setup_current_set
local setup_current_set

local function switch_to_next_set()
    current_set = current_set + 1
    if current_set > total_sets then
        current_set = 1
    end
    
    print('🔄 Cambiando a SET ' .. current_set .. ' de ' .. total_sets)
    
    if current_set == 1 then
        print('🎨 SET 1: HERRAMIENTAS DE DIBUJO')
        print('   A: Color Picker | B: Liquify | C: Borrador | D: Pincel')
    elseif current_set == 2 then
        print('📑 SET 2: CAPAS Y NAVEGACIÓN')  
        print('   A: Nueva Capa | B: Fusionar | C: Deseleccionar | D: Zoom Fit')
    elseif current_set == 3 then
        print('⚡ SET 3: EFECTOS Y TRANSFORMACIONES')
        print('   A: Transformar | B: Flip Canvas | C: Toggle UI | D: Mezcla Color')
    end
    print('💡 Presiona A para cambiar de set')
    print('==========================================')
    
    -- Reconfigurar las teclas según el set actual
    setup_current_set()
end

setup_current_set = function()
    local mappings
    
    if current_set == 1 then
        mappings = get_drawing_tools_set()
    elseif current_set == 2 then
        mappings = get_layers_navigation_set()
    elseif current_set == 3 then
        mappings = get_effects_transforms_set()
    end
    
    -- Solo actualizar los mappings, no reinicializar todo el sistema
    update_key_mappings(mappings)
end

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

local function csp_eyedropper_tool()
    lmc_send_keys('i')  -- Herramienta cuentagotas
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

-- ==========================================
-- 🎛️ GENERADORES DE SETS DE TECLAS
-- ==========================================

-- SET 1: Herramientas de dibujo (configuración actual)
function get_drawing_tools_set()
    return {
        -- FILA SUPERIOR - Herramientas principales de dibujo
        [KEY_UP_1] = create_key_action("🔄 Cambiar Set", switch_to_next_set),
        [KEY_UP_2] = create_key_action("💧 Liquify", csp_liquify),
        [KEY_UP_3] = create_key_action("🧽 Borrador", csp_eraser_tool),
        [KEY_UP_4] = create_key_action("🖌️ Pincel", csp_brush_tool),

        -- FILA MEDIA - Acciones y herramientas secundarias
        [KEY_MIDDLE_1] = create_key_action("🎨 Color Picker", screen_color_pick),
        [KEY_MIDDLE_2] = create_key_action("🛠️ Mover", csp_move_tool),
        [KEY_MIDDLE_3] = create_key_action("🎗️ Lazo", csp_lasso_tool),
        [KEY_MIDDLE_4] = create_key_action("👁️ Cuentagotas", csp_eyedropper_tool),

        -- FILA INFERIOR - UI y funciones globales
        [KEY_DOWN_1] = create_key_action("🎯 Zoom Fit", csp_zoom_fit),
        [KEY_DOWN_2] = create_key_action("🖼️ Toggle UI", csp_hide_ui),
        [KEY_DOWN_3] = create_key_action("↪️ Rehacer", csp_redo),
        [KEY_DOWN_4] = create_key_action("↩️ Deshacer", common_undo),

        -- SLIDER CENTRO - Rotación de canvas
        [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("↺ Rotar Izquierda", csp_rotate_left),
        [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("🔄 Reset Rotación", csp_reset_rotation),
        [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("↻ Rotar Derecha", csp_rotate_right),

        -- SLIDER ABAJO - Tamaño de pincel
        [KEY_SLIDER_DOWN_LEFT] = create_key_action("🖌️- Pincel Pequeño", csp_brush_size_down),
        [KEY_SLIDER_DOWN_CLICK] = create_key_action("➕ Transformar", csp_transform),
        [KEY_SLIDER_DOWN_RIGHT] = create_key_action("🖌️+ Pincel Grande", csp_brush_size_up),
    }
end

-- SET 2: Capas y navegación
function get_layers_navigation_set()
    return {
        -- FILA SUPERIOR - Gestión de capas
        [KEY_UP_1] = create_key_action("🔄 Cambiar Set", switch_to_next_set),
        [KEY_UP_2] = create_key_action("🆕 Nueva Capa", csp_new_layer),
        [KEY_UP_3] = create_key_action("📋 Fusionar Abajo", csp_merge_down),
        [KEY_UP_4] = create_key_action("🚫 Deseleccionar", csp_deselect),

        -- FILA MEDIA - Navegación y selección
        [KEY_MIDDLE_1] = create_key_action("🎨 Color Picker", screen_color_pick),
        [KEY_MIDDLE_2] = create_key_action("🛠️ Mover", csp_move_tool),
        [KEY_MIDDLE_3] = create_key_action("🎗️ Lazo", csp_lasso_tool),
        [KEY_MIDDLE_4] = create_key_action("🎯 Zoom Fit", csp_zoom_fit),

        -- FILA INFERIOR - Acciones básicas
        [KEY_DOWN_1] = create_key_action("🖼️ Toggle UI", csp_hide_ui),
        [KEY_DOWN_2] = create_key_action("🎨 Color Transparente", csp_switch_transparent),
        [KEY_DOWN_3] = create_key_action("↪️ Rehacer", csp_redo),
        [KEY_DOWN_4] = create_key_action("↩️ Deshacer", common_undo),

        -- SLIDER CENTRO - Rotación de canvas
        [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("↺ Rotar Izquierda", csp_rotate_left),
        [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("🔄 Reset Rotación", csp_reset_rotation),
        [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("↻ Rotar Derecha", csp_rotate_right),

        -- SLIDER ABAJO - Tamaño de pincel
        [KEY_SLIDER_DOWN_LEFT] = create_key_action("🖌️- Pincel Pequeño", csp_brush_size_down),
        [KEY_SLIDER_DOWN_CLICK] = create_key_action("➕ Transformar", csp_transform),
        [KEY_SLIDER_DOWN_RIGHT] = create_key_action("🖌️+ Pincel Grande", csp_brush_size_up),
    }
end

-- SET 3: Efectos y transformaciones
function get_effects_transforms_set()
    return {
        -- FILA SUPERIOR - Transformaciones
        [KEY_UP_1] = create_key_action("🔄 Cambiar Set", switch_to_next_set),
        [KEY_UP_2] = create_key_action("➕ Transformar", csp_transform),
        [KEY_UP_3] = create_key_action("🔄 Flip Canvas", csp_flip_canvas),
        [KEY_UP_4] = create_key_action("🎨 Mezcla Color", csp_toggle_color_mixing),

        -- FILA MEDIA - Efectos especiales
        [KEY_MIDDLE_1] = create_key_action("🎨 Color Picker", screen_color_pick),
        [KEY_MIDDLE_2] = create_key_action("💧 Liquify", csp_liquify),
        [KEY_MIDDLE_3] = create_key_action("🖼️ Toggle UI", csp_hide_ui),
        [KEY_MIDDLE_4] = create_key_action("🎯 Zoom Fit", csp_zoom_fit),

        -- FILA INFERIOR - Herramientas básicas
        [KEY_DOWN_1] = create_key_action("🖌️ Pincel", csp_brush_tool),
        [KEY_DOWN_2] = create_key_action("🧽 Borrador", csp_eraser_tool),
        [KEY_DOWN_3] = create_key_action("↪️ Rehacer", csp_redo),
        [KEY_DOWN_4] = create_key_action("↩️ Deshacer", common_undo),

        -- SLIDER CENTRO - Rotación de canvas
        [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("↺ Rotar Izquierda", csp_rotate_left),
        [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("🔄 Reset Rotación", csp_reset_rotation),
        [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("↻ Rotar Derecha", csp_rotate_right),

        -- SLIDER ABAJO - Tamaño de pincel
        [KEY_SLIDER_DOWN_LEFT] = create_key_action("🖌️- Pincel Pequeño", csp_brush_size_down),
        [KEY_SLIDER_DOWN_CLICK] = create_key_action("➕ Transformar", csp_transform),
        [KEY_SLIDER_DOWN_RIGHT] = create_key_action("🖌️+ Pincel Grande", csp_brush_size_up),
    }
end

-- Inicializar el sistema completo solo una vez con el primer set
initialize_macro_system(get_drawing_tools_set())
