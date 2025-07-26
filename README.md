# 📖 Guía para Crear Nuevos Archivos de Configuración

Esta guía te ayuda a crear tus propios archivos de configuración para diferentes aplicaciones usando el sistema de teclado macro LuaMacros.

## 📋 Estructura Básica de un Archivo de Configuración

### 1. Cargar el Sistema Base
```lua
require('./configuration/MacroKeyboardSystem')
```

### 2. Definir Funciones Específicas de la Aplicación
```lua
local function mi_funcion_personalizada()
    lmc_send_keys('comando')
end
```

### 3. Crear la Tabla de Mapeo
```lua
local mi_configuracion = {
    [KEY_UP_1] = create_key_action("Nombre", mi_funcion),
    -- ... más teclas
}
```

### 4. Inicializar el Sistema
```lua
initialize_macro_system(mi_configuracion)
```

## ⌨️ Teclas Especiales Útiles

### 🔧 Modificadores
- `^` = Ctrl
- `+` = Shift  
- `%` = Alt
- `#` = Win

### 🎯 Teclas Especiales
- `{F1}` a `{F12}` = Teclas de función
- `{TAB}` = Tab
- `{ENTER}` = Enter
- `{ESC}` = Escape
- `{SPACE}` = Espacio
- `{BACKSPACE}` = Retroceso
- `{DELETE}` = Suprimir
- `{HOME}`, `{END}` = Inicio/Fin
- `{PGUP}`, `{PGDN}` = Re Pág/Av Pág
- `{UP}`, `{DOWN}`, `{LEFT}`, `{RIGHT}` = Flechas

### 🔗 Combinaciones Comunes
- `'^c'` = Ctrl+C (copiar)
- `'^v'` = Ctrl+V (pegar)
- `'^z'` = Ctrl+Z (deshacer)
- `'^y'` = Ctrl+Y (rehacer)
- `'%{F4}'` = Alt+F4 (cerrar)
- `'#d'` = Win+D (escritorio)

## 📝 Plantilla para Nuevas Configuraciones

```lua
-- Archivo: ShortcutsMiApp.lua
require('./configuration/MacroKeyboardSystem')

-- Funciones específicas
local function mi_funcion()
    lmc_send_keys('comando')
end

-- Configuración de teclas
local mi_app_mappings = {
    [KEY_UP_1] = create_key_action("Mi Acción", mi_funcion),
    [KEY_UP_2] = create_key_action("Otra Acción", function() 
        lmc_send_keys('^s') -- Ctrl+S
    end),
    -- ... más teclas
}

-- Inicializar
print('🎯 Configurando atajos para Mi Aplicación...')
initialize_macro_system(mi_app_mappings)
```

## 🔧 Variables de Teclas Disponibles

### Fila Superior
- `KEY_UP_1`, `KEY_UP_2`, `KEY_UP_3`, `KEY_UP_4`

### Fila Media
- `KEY_MIDDLE_1`, `KEY_MIDDLE_2`, `KEY_MIDDLE_3`, `KEY_MIDDLE_4`

### Fila Inferior
- `KEY_DOWN_1`, `KEY_DOWN_2`, `KEY_DOWN_3`, `KEY_DOWN_4`

### Sliders
- `KEY_SLIDER_MIDDLE_LEFT`, `KEY_SLIDER_MIDDLE_CLICK`, `KEY_SLIDER_MIDDLE_RIGHT`
- `KEY_SLIDER_DOWN_LEFT`, `KEY_SLIDER_DOWN_CLICK`, `KEY_SLIDER_DOWN_RIGHT`

## 🔍 Debuggear Problemas

### 1. Si una tecla no funciona:
- ✅ Verifica que el comando sea correcto
- ✅ Prueba el comando manualmente primero
- ✅ Revisa que no haya conflictos con otros atajos

### 2. Si el sistema no detecta teclas:
- ✅ Verifica que el dispositivo esté conectado
- ✅ Comprueba el ID del dispositivo (`VID&0205AC_PID&022C`)

### 3. Para ver qué teclas se están presionando:
- ✅ Usa el archivo `Espia.lua` para detectar códigos

## 📁 Estructura del Proyecto

```
Scripts Lua/
├── MacroKeyboardSystem.lua    # Sistema base
├── ShortcutsCSP.lua          # Configuración para Clip Studio Paint
├── ShortcutsWindows.lua      # Configuración general de Windows
├── Espia.lua                 # Herramienta de diagnóstico
└── README.md                 # Esta guía
```

## 🚀 Ejemplos de Configuraciones

### Para Photoshop
```lua
require('./configuration/MacroKeyboardSystem')

local function ps_brush_tool()
    lmc_send_keys('b')
end

local function ps_eraser_tool()
    lmc_send_keys('e')
end

local photoshop_mappings = {
    [KEY_UP_1] = create_key_action("🖌️ Pincel", ps_brush_tool),
    [KEY_UP_2] = create_key_action("🧽 Borrador", ps_eraser_tool),
}

initialize_macro_system(photoshop_mappings)
```

### Para VS Code
```lua
require('./configuration/MacroKeyboardSystem')

local vscode_mappings = {
    [KEY_UP_1] = create_key_action("💾 Guardar", function() lmc_send_keys('^s') end),
    [KEY_UP_2] = create_key_action("🔍 Buscar", function() lmc_send_keys('^f') end),
    [KEY_UP_3] = create_key_action("🏃 Ejecutar", function() lmc_send_keys('{F5}') end),
}

initialize_macro_system(vscode_mappings)
```

## 🎯 Consejos Útiles

### ✨ Buenas Prácticas
- 📝 Usa nombres descriptivos para las funciones
- 🎨 Incluye emojis en los nombres de las acciones para facilitar identificación
- 📋 Agrupa funciones relacionadas
- 💬 Comenta tu código para futuras referencias

### ⚡ Optimización
- 🔄 Reutiliza funciones comunes entre configuraciones
- 📦 Mantén las configuraciones específicas por aplicación
- 🧹 Mantén el código limpio y organizado

---

## 🎉 ¡Diviértete Creando Tus Configuraciones!

Con esta guía tienes todo lo necesario para crear configuraciones personalizadas para cualquier aplicación. ¡El límite es tu imaginación! 🚀
