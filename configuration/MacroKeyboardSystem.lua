--[[
🔧 SISTEMA DE TECLADO MACRO - MÓDULO BASE
========================================
Este módulo contiene todas las funciones base para manejar el teclado macro.
Incluye el constructor de acciones, handlers, configuración de dispositivos, etc.

Para usar este módulo en tu script:
require('MacroKeyboardSystem')
--]]

-- ========================================
-- CONFIGURACIÓN GLOBAL
-- ========================================
local KEYBOARD_ID = 'VID&0205AC_PID&022C'
local DEVICE_NAME = 'MACRO'

-- Variable global para almacenar los mappings actuales
local current_key_mappings = {}

-- ========================================
-- CÓDIGOS DE TECLAS DISPONIBLES
-- ========================================
-- Arriba
KEY_UP_1 = 65   -- Letra A | Arriba 1
KEY_UP_2 = 66   -- Letra B | Arriba 2
KEY_UP_3 = 67   -- Letra C | Arriba 3
KEY_UP_4 = 68   -- Letra D | Arriba 4
-- Centro
KEY_MIDDLE_1 = 69   -- Letra E | Centro 1
KEY_MIDDLE_2 = 70   -- Letra F | Centro 2
KEY_MIDDLE_3 = 71   -- Letra G | Centro 3
KEY_MIDDLE_4 = 72   -- Letra H | Centro 4
-- Abajo
KEY_DOWN_1 = 73   -- Letra I | Abajo 1
KEY_DOWN_2 = 74   -- Letra J | Abajo 2
KEY_DOWN_3 = 75   -- Letra K | Abajo 3
KEY_DOWN_4 = 76   -- Letra L | Abajo 4
-- Slider Centro
KEY_SLIDER_MIDDLE_LEFT = 52   -- Número 4 | Antihorario, izquierda
KEY_SLIDER_MIDDLE_CLICK = 53   -- Número 5 | Click
KEY_SLIDER_MIDDLE_RIGHT = 54   -- Número 6 | Horario, derecha
-- Slider Abajo
KEY_SLIDER_DOWN_LEFT = 55   -- Número 7 | Antihorario, izquierda
KEY_SLIDER_DOWN_CLICK = 56   -- Número 8 | Click
KEY_SLIDER_DOWN_RIGHT = 57   -- Número 9 | Horario, derecha

-- ========================================
-- FUNCIÓN CONSTRUCTOR PARA ACCIONES TIPADAS
-- ========================================
function create_key_action(name, action_function)
    -- Validación de tipos
    assert(type(name) == "string", "El nombre debe ser una cadena de texto")
    assert(type(action_function) == "function", "La acción debe ser una función")
    
    return {
        name = name,
        action = action_function
    }
end

-- ========================================
-- FUNCIONES DE ACCIÓN REUTILIZABLES
-- ========================================
function paste_action()
    lmc_send_keys('^v')
end

function copy_action()
    lmc_send_keys('^c')
end

function cut_action()
    lmc_send_keys('^x')
end

function undo_action()
    lmc_send_keys('^z')
end

function save_action()
    lmc_send_keys('^s')
end

function new_tab_action()
    lmc_send_keys('^t')
end

function close_tab_action()
    lmc_send_keys('^w')
end

function reopen_tab_action()
    lmc_send_keys('^+t')
end

function alt_tab_action()
    lmc_send_keys('%{TAB}')
end

-- ========================================
-- FUNCIONES UTILITARIAS PARA CONTROLES DEL SISTEMA
-- ========================================
function send_brightness_down()
    lmc_send_input(0xAE, 0, 0)
    lmc_send_input(0xAE, 2, 0)
end

function send_brightness_up()
    lmc_send_input(0xAF, 0, 0)
    lmc_send_input(0xAF, 2, 0)
end

function send_volume_down()
    lmc_send_input(0xAE, 0, 0)
    lmc_send_input(0xAE, 2, 0)
end

function send_volume_up()
    lmc_send_input(0xAF, 0, 0)
    lmc_send_input(0xAF, 2, 0)
end

-- ========================================
-- FUNCIONES ESPECÍFICAS PARA WINDOWS
-- ========================================

-- Funciones de ventanas
function minimize_window()
    lmc_send_keys('#m')  -- Win + M
end

function maximize_window()
    lmc_send_keys('#{UP}')  -- Win + Flecha Arriba
end

function show_desktop()
    lmc_send_keys('#d')  -- Win + D
end

function task_manager()
    lmc_send_keys('^+{ESC}')  -- Ctrl + Shift + Esc
end

-- Funciones de texto
function select_all()
    lmc_send_keys('^a')  -- Ctrl + A
end

function find_text()
    lmc_send_keys('^f')  -- Ctrl + F
end

function replace_text()
    lmc_send_keys('^h')  -- Ctrl + H
end

-- Navegación de pestañas avanzada
function close_all_tabs()
    lmc_send_keys('^+w')  -- Ctrl + Shift + W
end

function duplicate_tab()
    lmc_send_keys('^+k')  -- Ctrl + Shift + K (algunos navegadores)
end

-- Control de medios
function play_pause()
    lmc_send_input(179, 0, 0)  -- VK_MEDIA_PLAY_PAUSE
    lmc_send_input(179, 2, 0)
end

function next_track()
    lmc_send_input(176, 0, 0)  -- VK_MEDIA_NEXT_TRACK
    lmc_send_input(176, 2, 0)
end

function prev_track()
    lmc_send_input(177, 0, 0)  -- VK_MEDIA_PREV_TRACK
    lmc_send_input(177, 2, 0)
end

-- ========================================
-- CONFIGURACIÓN DEL DISPOSITIVO
-- ========================================
function setup_device()
    print('🔍 Configurando dispositivo de teclado macro...')
    lmc_print_devices()
    
    local success, error_msg = pcall(function()
        lmc_device_set_name(DEVICE_NAME, KEYBOARD_ID)
        print(string.format('✅ Dispositivo "%s" configurado correctamente', DEVICE_NAME))
        return true
    end)
    
    if not success then
        print(string.format('❌ Error al configurar el dispositivo "%s": %s', DEVICE_NAME, error_msg))
        print('💡 Verifica que el teclado esté conectado y el ID sea correcto')
        print('💡 ID actual configurado:', KEYBOARD_ID)
        return false
    end
    
    return true
end

-- ========================================
-- FUNCIÓN PARA MANEJAR TECLAS CON PROTECCIÓN DE ERRORES
-- ========================================
function handle_key(key_code, action_name, action_function, direction)
    -- Solo ejecutar en keydown (direction == 0)
    if direction == 0 then
        print(string.format('⚡ Tecla %d detectada → %s', key_code, action_name))
        if action_function then
            local success, error_msg = pcall(action_function)
            if not success then
                print(string.format('✗ Error ejecutando acción "%s": %s', action_name, error_msg))
            end
        end
    end
end

-- ========================================
-- CONFIGURACIÓN DEL HANDLER PRINCIPAL
-- ========================================
function setup_handler(key_mappings)
    local success, error_msg = pcall(function()
        -- Guardar los mappings globalmente
        current_key_mappings = key_mappings
        
        -- Configurar el dispositivo primero
        local device_ready = setup_device()
        if not device_ready then
            print('⚠️  El script continuará pero las macros no funcionarán hasta que el dispositivo esté disponible')
            return false
        end
        
        -- Handler para nuestro dispositivo específico
        lmc_set_handler(DEVICE_NAME, function(key, direction)
            print(string.format('📱 %s - Tecla: %d, Evento: %s', 
                DEVICE_NAME, key, 
                direction == 0 and "PRESIONADA" or "LIBERADA"))
            
            local mapping = current_key_mappings[key]  -- Usar la variable global
            if mapping then
                -- Ejecutar la acción (solo en keydown)
                handle_key(key, mapping.name, mapping.action, direction)
                return false -- ⭐ BLOQUEAR la tecla original SIEMPRE
            else
                -- Tecla no configurada - solo mostrar mensaje en keydown
                if direction == 0 then
                    print(string.format('❓ Tecla no asignada: %d', key))
                end
                return true -- Permitir que teclas no asignadas pasen normalmente
            end
        end)
        
        print('✅ Handler configurado correctamente')
        print('🎚️ Sistema de teclas configurado:')
        print('   • Todas las acciones se ejecutan al presionar')
        print('   • Teclas configuradas: bloqueadas completamente')
        print('   • Teclas no configuradas: funcionan normalmente')
        
        -- Mostrar resumen de teclas configuradas
        local count = 0
        for _ in pairs(key_mappings) do
            count = count + 1
        end
        print(string.format('📊 Total de teclas configuradas: %d', count))
        return true
    end)
    
    if not success then
        print(string.format('❌ Error configurando el handler: %s', error_msg))
        return false
    end
    
    return true
end

-- ========================================
-- FUNCIÓN PARA ACTUALIZAR SOLO LOS MAPPINGS
-- ========================================
function update_key_mappings(new_key_mappings)
    current_key_mappings = new_key_mappings
    
    print('🔄 ==========================================')
    print('   ACTUALIZANDO MAPPINGS DE TECLAS')
    print('==========================================')
    
    -- Mostrar resumen de teclas configuradas
    local count = 0
    for _ in pairs(current_key_mappings) do
        count = count + 1
    end
    print(string.format('📊 Total de teclas configuradas: %d', count))
    print('==========================================\n')
    
    return true
end

-- ========================================
-- FUNCIÓN PRINCIPAL PARA INICIALIZAR EL SISTEMA
-- ========================================
function initialize_macro_system(key_mappings)
    clear()
    print('🎹 ==========================================')
    print('   SISTEMA DE TECLADO MACRO - INICIALIZANDO')
    print('==========================================')
    
    local handler_ready = setup_handler(key_mappings)
    
    print('==========================================')
    if handler_ready then
        print('✅ Sistema listo. Presiona las teclas configuradas para probar las macros.')
    else
        print('❌ El sistema no pudo inicializarse correctamente.')
    end
    print('==========================================\n')
    
    return handler_ready
end

print("📦 Módulo MacroKeyboardSystem cargado correctamente")
