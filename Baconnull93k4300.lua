local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local replicatedStorage = game:GetService("ReplicatedStorage")
local remote = replicatedStorage:FindFirstChild("BaconEvent")

if not remote then return end

local gui = Instance.new("ScreenGui")
gui.Name = "MainPanel"
gui.ResetOnSpawn = false
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 450)
frame.Position = UDim2.new(0.5, -110, 0.5, -225)
frame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "baconnull93k Panel"
title.TextColor3 = Color3.new(1, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.Bold
title.BackgroundTransparency = 1
title.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 30, 0, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.TextColor3 = Color3.new(1, 1, 1)
close.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
close.Parent = frame
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local tools = {"BTools", "baconnull93k hack"}

for i, v in ipairs(tools) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 40)
    btn.Position = UDim2.new(0.075, 0, 0, (i-1)*50 + 50)
    btn.Text = v
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
    btn.Parent = frame
    
    if v == "baconnull93k hack" then
        btn.TextColor3 = Color3.new(1, 0, 0)
        btn.BackgroundColor3 = Color3.new(0.2, 0, 0)
        btn.BorderColor3 = Color3.new(1, 0, 0)
    end
    
    btn.MouseButton1Click:Connect(function()
        if v == "BTools" then
            local btools = Instance.new("ScreenGui")
            btools.Name = "BTools"
            btools.Parent = player.PlayerGui
            
            local bframe = Instance.new("Frame")
            bframe.Size = UDim2.new(0, 200, 0, 350)
            bframe.Position = UDim2.new(0, 10, 0.5, -175)
            bframe.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
            bframe.Active = true
            bframe.Draggable = true
            bframe.Parent = btools
            
            local btitle = Instance.new("TextLabel")
            btitle.Size = UDim2.new(1, 0, 0, 40)
            btitle.Text = "BTools"
            btitle.TextColor3 = Color3.new(1, 1, 1)
            btitle.TextScaled = true
            btitle.Font = Enum.Font.Bold
            btitle.BackgroundTransparency = 1
            btitle.Parent = bframe
            
            local bclose = Instance.new("TextButton")
            bclose.Size = UDim2.new(0, 30, 0, 30)
            bclose.Position = UDim2.new(1, -35, 0, 5)
            bclose.Text = "X"
            bclose.TextColor3 = Color3.new(1, 1, 1)
            bclose.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
            bclose.Parent = bframe
            bclose.MouseButton1Click:Connect(function() btools:Destroy() end)
            
            local btns = {"Move","Resize","Paint","Delete","Clone","Anchor"}
            
            for j, b in ipairs(btns) do
                local bbtn = Instance.new("TextButton")
                bbtn.Size = UDim2.new(0.85, 0, 0, 35)
                bbtn.Position = UDim2.new(0.075, 0, 0, (j-1)*45 + 50)
                bbtn.Text = b
                bbtn.TextColor3 = Color3.new(1, 1, 1)
                bbtn.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
                bbtn.Parent = bframe
                
                bbtn.MouseButton1Click:Connect(function()
                    local target = mouse.Target
                    if not target or not target:IsA("BasePart") then return end
                    
                    if b == "Move" then
                        target.Anchored = true
                        target.CFrame = target.CFrame + Vector3.new(0, 5, 0)
                    elseif b == "Resize" then
                        target.Size = target.Size * 1.5
                    elseif b == "Paint" then
                        target.BrickColor = BrickColor.Random()
                    elseif b == "Delete" then
                        target:Destroy()
                    elseif b == "Clone" then
                        local c = target:Clone()
                        c.Position = target.Position + Vector3.new(5, 0, 0)
                        c.Parent = workspace
                    elseif b == "Anchor" then
                        target.Anchored = not target.Anchored
                    end
                end)
            end
            
            return
        end
        
        if v == "baconnull93k hack" then
            remote:FireServer()
        end
    end)
end
