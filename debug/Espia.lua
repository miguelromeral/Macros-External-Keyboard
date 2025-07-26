clear()

-- 1. Imprime todos los dispositivos conectados
print("Lista de dispositivos disponibles:")
lmc_print_devices()

-- 2. Asigna un nombre al teclado que quieres espiar
-- Reemplaza esta línea con el ID de tu teclado interno o principal
lmc_device_set_name('ESPIA', 'ACPI#IDEA0100')

-- 3. Crea el handler para espiar
lmc_set_handler('ESPIA', function(key, direction)
    local action = (direction == 0) and '⬇️ PRESIONADA' or '⬆️ SOLTADA'
    print(string.format('Tecla %s: Código %d', action, key))
end)

