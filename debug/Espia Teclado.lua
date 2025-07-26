clear()

-- 🕵️ SCRIPT ESPÍA PARA DETECTAR CÓDIGOS DE TECLAS
-- ================================================
-- Este script te ayuda a descubrir los códigos numéricos
-- de todas las teclas y controles de tu teclado

-- Configuración del dispositivo (copiada del script principal)
local KEYBOARD_ID = 'VID&0205AC_PID&022C'
local DEVICE_NAME = 'MACRO'

print('🕵️ MODO ESPÍA ACTIVADO')
print('======================')
print('Este script detectará TODOS los códigos de tecla de tu teclado')
print('')

-- Función para configurar el dispositivo
local function setup_spy_device()
    print('🔍 Configurando dispositivo espía...')
    lmc_print_devices()
    
    local success, error_msg = pcall(function()
        lmc_device_set_name(DEVICE_NAME, KEYBOARD_ID)
        print(string.format('✅ Dispositivo "%s" configurado para espionaje', DEVICE_NAME))
        return true
    end)
    
    if not success then
        print(string.format('❌ Error configurando el dispositivo: %s', error_msg))
        print('💡 Verifica que el teclado esté conectado')
        return false
    end
    
    return true
end

-- Configurar el dispositivo espía
local spy_ready = setup_spy_device()

if not spy_ready then
    print('⚠️ No se puede espiar el dispositivo')
    return
end

-- Tabla para rastrear qué teclas ya hemos visto
local seen_keys = {}

-- Handler espía que captura TODO
local function setup_spy_handler()
    local success, error_msg = pcall(function()
        
        -- Handler principal para nuestro dispositivo específico
        lmc_set_handler(DEVICE_NAME, function(key, direction)
            -- Mostrar información detallada de cada evento
            local direction_text = direction == 0 and "⬇️ PRESIONADA" or "⬆️ LIBERADA"
            local key_char = ""
            
            -- Intentar mostrar el carácter si es una letra/número conocido
            if key >= 65 and key <= 90 then
                key_char = string.format(" (%s)", string.char(key))
            elseif key >= 48 and key <= 57 then
                key_char = string.format(" (número %s)", string.char(key))
            elseif key >= 160 and key <= 180 then
                key_char = " (tecla multimedia?)"
            end
            
            print(string.format('🎹 TECLA: %d%s | %s | Dispositivo: %s', 
                key, key_char, direction_text, DEVICE_NAME))
            
            -- Marcar esta tecla como vista solo en keydown
            if direction == 0 and not seen_keys[key] then
                seen_keys[key] = true
                print(string.format('✨ NUEVA TECLA DETECTADA: %d%s', key, key_char))
            end
        end)
        
        -- Handler universal para capturar todo lo demás (sin filtros)
        lmc_set_handler('*', function(key, direction)
            print(string.format('🌐 CUALQUIER DISPOSITIVO: Código %d | Dirección %d', key, direction))
            
            -- Detectar códigos multimedia comunes
            if key == 173 then print("   🎵 ¡Posible control de volumen detectado!")
            elseif key == 174 then print("   🔉 ¡Posible bajar volumen detectado!")
            elseif key == 175 then print("   🔊 ¡Posible subir volumen detectado!")
            elseif key >= 160 and key <= 183 then print("   🎛️ ¡Posible tecla multimedia detectada!")
            end
        end)
        
        -- Intentar capturar eventos de consumidor (para sliders)
        pcall(function()
            lmc_set_consumer_handler(function(key)
                print(string.format('�️ CONSUMER CONTROL: Código %d (¡SLIDER DETECTADO!)', key))
                seen_keys[key] = true
            end)
        end)
        
        print('✅ Handlers espía configurados (incluyendo consumer controls)')
        return true
    end)
    
    if not success then
        print(string.format('❌ Error configurando handlers: %s', error_msg))
        return false
    end
    
    return true
end

-- Función para mostrar resumen de teclas detectadas
local function show_summary()
    print('')
    print('📊 RESUMEN DE TECLAS DETECTADAS:')
    print('================================')
    
    local key_list = {}
    for key, _ in pairs(seen_keys) do
        table.insert(key_list, key)
    end
    
    table.sort(key_list)
    
    for _, key in ipairs(key_list) do
        local key_char = ""
        if key >= 65 and key <= 90 then
            key_char = string.format(" (letra %s)", string.char(key))
        elseif key >= 48 and key <= 57 then
            key_char = string.format(" (número %s)", string.char(key))
        end
        print(string.format('  • Código %d%s', key, key_char))
    end
    
    print('')
    print('💡 Copia estos códigos a tu script principal:')
    for _, key in ipairs(key_list) do
        if key >= 65 and key <= 90 then
            print(string.format('local KEY_%s = %d', string.char(key), key))
        elseif key == 52 or key == 54 or key == 55 or key == 57 then
            print(string.format('local KEY_%d = %d', key - 48, key))
        elseif key == 173 then
            print(string.format('local KEY_VOLUME_MUTE = %d  -- Silenciar', key))
        elseif key == 174 then
            print(string.format('local KEY_VOLUME_DOWN = %d  -- Bajar volumen', key))
        elseif key == 175 then
            print(string.format('local KEY_VOLUME_UP = %d  -- Subir volumen', key))
        elseif key >= 160 and key <= 183 then
            print(string.format('local KEY_MULTIMEDIA_%d = %d  -- Tecla multimedia', key, key))
        else
            print(string.format('local KEY_SPECIAL_%d = %d  -- ¿Slider u otro control?', key, key))
        end
    end
    
    print('')
    print('📝 NOTAS IMPORTANTES:')
    print('====================')
    print('• Si NO aparecieron códigos del slider, puede ser que:')
    print('  1. El slider use Consumer Controls (no interceptables por LuaMacros)')
    print('  2. El slider esté en un dispositivo HID separado')
    print('  3. El slider sea manejado directamente por el sistema')
    print('')
    print('• Códigos multimedia comunes:')
    print('  - 173: Silenciar/Activar audio')
    print('  - 174: Bajar volumen')
    print('  - 175: Subir volumen')
    print('  - 176: Siguiente pista')
    print('  - 177: Pista anterior')
    print('  - 179: Play/Pause')
end

-- Configurar handlers
local spy_handler_ready = setup_spy_handler()

if spy_handler_ready then
    print('')
    print('🎯 INSTRUCCIONES:')
    print('================')
    print('1. Presiona TODAS las teclas de tu teclado una por una')
    print('2. 🎚️ IMPORTANTE: Mueve el slider de volumen LENTAMENTE')
    print('3. Prueba también tocar/presionar el slider (si es clickeable)')
    print('4. Presiona teclas Fn + volumen si las tienes')
    print('5. Presiona cualquier botón especial del teclado')
    print('6. Cuando termines, presiona Ctrl+C para ver el resumen')
    print('')
    print('🔍 BUSCA ESTOS MENSAJES:')
    print('- "🎚️ CONSUMER CONTROL" = ¡Slider detectado!')
    print('- "🎵 Posible control de volumen" = Tecla multimedia')
    print('- "🎛️ Posible tecla multimedia" = Otros controles')
    print('')
    print('🚀 ¡Empieza a presionar teclas!')
    print('')
    
    -- Configurar un timer para mostrar el resumen cada 30 segundos
    lmc_set_timer(30000, function()
        show_summary()
        print('')
        print('⏰ Continúa presionando teclas o Ctrl+C para terminar...')
        print('')
    end)
    
else
    print('❌ No se pudo configurar el modo espía')
end
