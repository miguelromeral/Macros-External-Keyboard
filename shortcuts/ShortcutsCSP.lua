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

-- Funciones para cambiar a sets específicos
local function switch_to_set(set_number)
    if current_set ~= set_number then
        current_set = set_number
        print('🎨 Cambiando a SET ' .. set_number)
        setup_current_set()
    else
        print('🎨 Ya estás en SET ' .. set_number)
    end
end

local function switch_to_set_1()
    switch_to_set(1)
end

local function switch_to_set_2()
    switch_to_set(2)
end

local function switch_to_set_3()
    switch_to_set(3)
end

setup_current_set = function()
    local mappings
    
    if current_set == 1 then
        mappings = csp_set_1()
    elseif current_set == 2 then
        mappings = csp_set_2()
    elseif current_set == 3 then
        mappings = csp_set_3()
    end
    
    -- Solo actualizar los mappings, no reinicializar todo el sistema
    update_key_mappings(mappings)
end

-- ==========================================
-- 🎨 HERRAMIENTAS DE DIBUJO
-- ==========================================
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


-- Pinceles
local function csp_brush_0() lmc_send_keys('0') end
local function csp_brush_1() lmc_send_keys('1') end
local function csp_brush_2() lmc_send_keys('2') end
local function csp_brush_3() lmc_send_keys('3') end
local function csp_brush_4() lmc_send_keys('4') end
local function csp_brush_5() lmc_send_keys('5') end
local function csp_brush_6() lmc_send_keys('6') end
local function csp_brush_7() lmc_send_keys('7') end
local function csp_brush_8() lmc_send_keys('8') end
local function csp_brush_9() lmc_send_keys('9') end


local function csp_select_layer() lmc_send_keys('d') end
local function csp_move_layer() lmc_send_keys('k') end


local function csp_cut() lmc_send_keys('^x') end
local function csp_copy() lmc_send_keys('^c') end
local function csp_paste() lmc_send_keys('^v') end


local function csp_opacity_decrease() lmc_send_keys('\'') end
local function csp_opacity_increase() lmc_send_keys('¡') end

local function csp_transparent_color() lmc_send_keys('c') end

local function csp_layer_select() lmc_send_keys('d') end


local function csp_select_all() lmc_send_keys('^a') end

local function csp_auto_select() lmc_send_keys('w') end
local function csp_color_fill() lmc_send_keys('%{DELETE}') end
local function csp_blend_tool() lmc_send_keys('j') end
local function csp_tonal_correction() lmc_send_keys('^u') end

local function csp_escape() lmc_send_keys('{ESC}') end


local function csp_empty() lmc_send_keys('') end





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
local function csp_undo()
    lmc_send_keys('^z')  -- Ctrl + Z para deshacer
end

local function csp_redo()
    lmc_send_keys('^+z')  -- Ctrl + Shift + Z para rehacer
end

-- ==========================================
-- 🎛️ GENERADORES DE SETS DE TECLAS
-- ==========================================

-- SET 1: Herramientas de dibujo (configuración actual)
function csp_set_1()
    return {
        [KEY_UP_1] = create_key_action("🎨 Ir a SET 1", switch_to_set_1),
        [KEY_UP_2] = create_key_action("Pincel 1", csp_brush_1),
        [KEY_UP_3] = create_key_action("Pincel 2", csp_brush_2),
        [KEY_UP_4] = create_key_action("Pincel 3", csp_brush_3),

        [KEY_MIDDLE_1] = create_key_action("Ir a SET 2", switch_to_set_2),
        [KEY_MIDDLE_2] = create_key_action("Pincel 4", csp_brush_4),
        [KEY_MIDDLE_3] = create_key_action("Pincel 5", csp_brush_5),
        [KEY_MIDDLE_4] = create_key_action("Pincel 6", csp_brush_6),

        [KEY_DOWN_1] = create_key_action("Ir a SET 3", switch_to_set_3),
        [KEY_DOWN_2] = create_key_action("Pincel 7", csp_brush_7),
        [KEY_DOWN_3] = create_key_action("Pincel 8", csp_brush_8),
        [KEY_DOWN_4] = create_key_action("Pincel 9", csp_brush_9),

        [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("Disminuir opacidad", csp_opacity_decrease),
        [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("Color Transparente", csp_transparent_color),
        [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("Aumentar opacidad", csp_opacity_increase),

        [KEY_SLIDER_DOWN_LEFT] = create_key_action("Pincel Pequeño", csp_brush_size_down),
        [KEY_SLIDER_DOWN_CLICK] = create_key_action("", csp_empty),
        [KEY_SLIDER_DOWN_RIGHT] = create_key_action("Pincel Grande", csp_brush_size_up),
    }
end

-- SET 2: Capas y navegación
function csp_set_2()
    return {
        [KEY_UP_1] = create_key_action("Ir a SET 1", switch_to_set_1),
        [KEY_UP_2] = create_key_action("Cotar", csp_cut),
        [KEY_UP_3] = create_key_action("Copiar", csp_copy),
        [KEY_UP_4] = create_key_action("Pegar", csp_paste),

        [KEY_MIDDLE_1] = create_key_action("Ir a SET 2", switch_to_set_2),
        [KEY_MIDDLE_2] = create_key_action("Selección Automática", csp_auto_select),
        [KEY_MIDDLE_3] = create_key_action("Lazo", csp_lasso_tool),
        [KEY_MIDDLE_4] = create_key_action("Mover", csp_move_tool),

        [KEY_DOWN_1] = create_key_action("Ir a SET 3", switch_to_set_3),
        [KEY_DOWN_2] = create_key_action("Rellenar Color", csp_color_fill),
        [KEY_DOWN_3] = create_key_action("Seleccionar Todo", csp_select_all),
        [KEY_DOWN_4] = create_key_action("Deseleccionar", csp_deselect),

        [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("Rotar Izquierda", csp_rotate_left),
        [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("Reiniciar Rotación", csp_reset_rotation),
        [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("Rotar Derecha", csp_rotate_right),

        [KEY_SLIDER_DOWN_LEFT] = create_key_action("Deshacer", csp_undo),
        [KEY_SLIDER_DOWN_CLICK] = create_key_action("Zoom Fit", csp_zoom_fit),
        [KEY_SLIDER_DOWN_RIGHT] = create_key_action("Rehacer", csp_redo),
    }
end

-- SET 3: Efectos y transformaciones
function csp_set_3()
    return {
        -- FILA SUPERIOR - Transformaciones
        [KEY_UP_1] = create_key_action("Ir a SET 1", switch_to_set_1),
        [KEY_UP_2] = create_key_action("Color Picker", screen_color_pick),
        [KEY_UP_3] = create_key_action("Mezcla Color", csp_toggle_color_mixing),
        [KEY_UP_4] = create_key_action("Flip Canvas", csp_flip_canvas),
        
        -- FILA MEDIA - Efectos especiales
        [KEY_MIDDLE_1] = create_key_action("Ir a SET 2", switch_to_set_2),
        [KEY_MIDDLE_2] = create_key_action("Borrador", csp_eraser_tool),
        [KEY_MIDDLE_3] = create_key_action("Liquify", csp_liquify),
        [KEY_MIDDLE_4] = create_key_action("Blend Tool", csp_blend_tool),
        
        -- FILA INFERIOR - Herramientas básicas
        [KEY_DOWN_1] = create_key_action("Ir a SET 3", switch_to_set_3),
        [KEY_DOWN_2] = create_key_action("Corrección Tonal", csp_tonal_correction),
        [KEY_DOWN_3] = create_key_action("Transformar", csp_transform),
        [KEY_DOWN_4] = create_key_action("Escape", csp_escape),

        -- SLIDER CENTRO - Rotación de canvas
        [KEY_SLIDER_MIDDLE_LEFT] = create_key_action("", csp_empty),
        [KEY_SLIDER_MIDDLE_CLICK] = create_key_action("", csp_empty),
        [KEY_SLIDER_MIDDLE_RIGHT] = create_key_action("", csp_empty),

        -- SLIDER ABAJO - Tamaño de pincel
        [KEY_SLIDER_DOWN_LEFT] = create_key_action("", csp_empty),
        [KEY_SLIDER_DOWN_CLICK] = create_key_action("", csp_empty),
        [KEY_SLIDER_DOWN_RIGHT] = create_key_action("", csp_empty),
    }
end

-- Inicializar el sistema completo solo una vez con el primer set
initialize_macro_system(csp_set_1())
