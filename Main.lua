-- Morphes Hub - Main Script
-- Creador: TuNombre

-- Cargar la interfaz
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Morphes Hub ⚙️", HidePremium = false, SaveConfig = true, ConfigFolder = "MorphesHub"})

-- Configuración global
_G.MorphesConfig = {
    SelectedWeapon = "Auto",
    FlySpeed = 100,
    AttackDistance = 20,
    Abilities = {
        Z = true,
        X = true,
        C = true,
        V = false,
        F = false
    }
}

-- Cargar scripts (más adelante los agregaremos)
local AutoFarm = {
    Level = loadstring(game:HttpGet("https://raw.githubusercontent.com/usuario/MorphesHub/main/AutoFarm/Level.lua"))(),
    Fruit = loadstring(game:HttpGet("https://raw.githubusercontent.com/usuario/MorphesHub/main/AutoFarm/Fruit.lua"))(),
    Sword = loadstring(game:HttpGet("https://raw.githubusercontent.com/usuario/MorphesHub/main/AutoFarm/Sword.lua"))(),
    Gun = loadstring(game:HttpGet("https://raw.githubusercontent.com/usuario/MorphesHub/main/AutoFarm/Gun.lua"))(),
    FightingStyle = loadstring(game:HttpGet("https://raw.githubusercontent.com/usuario/MorphesHub/main/AutoFarm/FightingStyle.lua"))()
}

-- Crear pestaña
local Tab = Window:MakeTab({Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- Arma
Tab:AddDropdown({
    Name = "Elegir Arma",
    Default = "Auto",
    Options = {"Auto", "Espada", "Fruta", "Pistola", "Estilo de Pelea"},
    Callback = function(Value)
        _G.MorphesConfig.SelectedWeapon = Value
    end
})

-- Velocidad de vuelo
Tab:AddSlider({
    Name = "Velocidad de vuelo",
    Min = 50,
    Max = 300,
    Default = 100,
    Increment = 10,
    Callback = function(Value)
        _G.MorphesConfig.FlySpeed = Value
    end
})

-- Distancia de ataque
Tab:AddSlider({
    Name = "Distancia de ataque",
    Min = 5,
    Max = 50,
    Default = 20,
    Increment = 1,
    Callback = function(Value)
        _G.MorphesConfig.AttackDistance = Value
    end
})

-- Selección de habilidades
Tab:AddLabel("Usar habilidades:")
for _, skill in ipairs({"Z", "X", "C", "V", "F"}) do
    Tab:AddToggle({
        Name = "Habilidad " .. skill,
        Default = (skill == "Z" or skill == "X"),
        Callback = function(Value)
            _G.MorphesConfig.Abilities[skill] = Value
        end
    })
end

-- Activadores de farmeo
Tab:AddButton({Name = "Auto Farm Nivel", Callback = function() AutoFarm.Level() end})
Tab:AddButton({Name = "Auto Farm Fruta", Callback = function() AutoFarm.Fruit() end})
Tab:AddButton({Name = "Auto Farm Espada", Callback = function() AutoFarm.Sword() end})
Tab:AddButton({Name = "Auto Farm Pistola", Callback = function() AutoFarm.Gun() end})
Tab:AddButton({Name = "Auto Farm Estilo de Pelea", Callback = function() AutoFarm.FightingStyle() end})

OrionLib:Init()
