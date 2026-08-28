-- TSB_Power_Script.lua

local TSB = {}

TSB.Security = {
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

TSB.GUI = function()
    local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
    local Window = Rayfield:CreateWindow({
        Name = "TSB Power Script",
        LoadingTitle = "Loading...",
        LoadingSubtitle = "By TSB",
        KeySystem = false
    })
    
    local MainTab = Window:CreateTab("Main", 0)
    MainTab:CreateSection("Combat")
    
    local AutoBlock = false
    MainTab:CreateToggle({
        Name = "Auto Block",
        CurrentValue = false,
        Callback = function(Value)
            AutoBlock = Value
            if Value then
                TSB.Features.AutoBlock:Start()
            else
                TSB.Features.AutoBlock:Stop()
            end
        end
    })
    
    MainTab:CreateButton({
        Name = "God Mode",
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
        Name = "Walk Speed",
        Min = 16,
        Max = 120,
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
    
    MainTab:CreateToggle({
        Name = "Infinite Stamina",
        CurrentValue = false,
        Callback = function(Value)
            if Value then
                TSB.Features.InfiniteStamina:Start()
            else
                TSB.Features.InfiniteStamina:Stop()
            end
        end
    })
end

TSB.Features = {
    AutoBlock = {
        Running = false,
        Connection = nil,
        Start = function()
            if TSB.Features.AutoBlock.Running then return end
            TSB.Features.AutoBlock.Running = true
            
            TSB.Features.AutoBlock.Connection = game:GetService("RunService").Heartbeat:Connect(function()
                if not TSB.Features.AutoBlock.Running then
                    TSB.Features.AutoBlock.Connection:Disconnect()
                    return
                end
                
                local p = game.Players.LocalPlayer
                local char = p.Character
                if not char then return end
                
                local root = char:FindFirstChild("HumanoidRootPart")
                if not root then return end
                
                local nearestEnemy = nil
                local nearestDist = 30
                
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= p then
                        local enemyChar = player.Character
                        if enemyChar and enemyChar:FindFirstChild("HumanoidRootPart") then
                            local dist = (root.Position - enemyChar.HumanoidRootPart.Position).Magnitude
                            if dist < nearestDist then
                                nearestDist = dist
                                nearestEnemy = enemyChar
                            end
                        end
                    end
                end
                
                if nearestEnemy then
                    local input = game:GetService("VirtualInputManager")
                    input:SendKeyEvent(true, "F", false, game)
                    task.wait(0.05)
                    input:SendKeyEvent(false, "F", false, game)
                end
            end)
        end,
        Stop = function()
            TSB.Features.AutoBlock.Running = false
            if TSB.Features.AutoBlock.Connection then
                TSB.Features.AutoBlock.Connection:Disconnect()
                TSB.Features.AutoBlock.Connection = nil
            end
        end
    },
    
    InfiniteStamina = {
        Running = false,
        Connection = nil,
        Start = function()
            if TSB.Features.InfiniteStamina.Running then return end
            TSB.Features.InfiniteStamina.Running = true
            
            TSB.Features.InfiniteStamina.Connection = game:GetService("RunService").Heartbeat:Connect(function()
                if not TSB.Features.InfiniteStamina.Running then
                    TSB.Features.InfiniteStamina.Connection:Disconnect()
                    return
                end
                
                local p = game.Players.LocalPlayer
                local char = p.Character
                if not char then return end
                
                local stamina = char:FindFirstChild("Stamina")
                if stamina then
                    stamina.Value = stamina.MaxValue
                end
            end)
        end,
        Stop = function()
            TSB.Features.InfiniteStamina.Running = false
            if TSB.Features.InfiniteStamina.Connection then
                TSB.Features.InfiniteStamina.Connection:Disconnect()
                TSB.Features.InfiniteStamina.Connection = nil
            end
        end
    }
}

TSB.Security.AntiDetect()
pcall(function() TSB.GUI() end)

print("TSB Script Loaded Successfully!")
return TSB
