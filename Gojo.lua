
local Gojo = {}

Gojo.Security = {
    AntiDetect = function()
        local mt = getrawmetatable(game)
        if mt then
            local old = mt.__namecall
            setreadonly(mt, false)
            mt.__namecall = function(self, ...)
                local args = {...}
                if args[2] == "IsA" and args[1] == game then
                    return false
                end
                return old(self, ...)
            end
            setreadonly(mt, true)
        end
    end
}

Gojo.GUI = function()
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
    local Window = Rayfield:CreateWindow({
        Name = "Gojo Script",
        LoadingTitle = "Loading...",
        KeySystem = false
    })
    
    local MainTab = Window:CreateTab("Main", 0)
    
    MainTab:CreateButton({
        Name = "Infinity (God Mode)",
        Callback = function()
            local p = game.Players.LocalPlayer
            local char = p.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.Health = 9e9
                char.Humanoid.MaxHealth = 9e9
            end
        end
    })
    
    MainTab:CreateSlider({
        Name = "Six Eyes (Speed)",
        Min = 16,
        Max = 200,
        Default = 16,
        Callback = function(Value)
            local p = game.Players.LocalPlayer
            local char = p.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = Value
            end
        end
    })
    
    MainTab:CreateSlider({
        Name = "Jump Power",
        Min = 50,
        Max = 500,
        Default = 50,
        Callback = function(Value)
            local p = game.Players.LocalPlayer
            local char = p.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.JumpPower = Value
            end
        end
    })
end

Gojo.Security.AntiDetect()
pcall(function() Gojo.GUI() end)

print("Gojo Script Loaded!")
return Gojo
