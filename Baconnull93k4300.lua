local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = Instance.new("RemoteEvent")
remote.Name = "BaconEvent"
remote.Parent = ReplicatedStorage

local function showError(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "BaconScreen"
    gui.ResetOnSpawn = false
    gui.Parent = player.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.1
    frame.Parent = gui
    
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(1, 0, 1, 0)
    img.Image = "rbxassetid://5005646572736531453"
    img.BackgroundTransparency = 1
    img.Parent = frame
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 0.3, 0)
    text.Position = UDim2.new(0, 0, 0.7, 0)
    text.Text = "ERROR 4300\nbaconnull93k"
    text.TextColor3 = Color3.new(1, 0, 0)
    text.TextScaled = true
    text.Font = Enum.Font.Bold
    text.BackgroundTransparency = 1
    text.Parent = frame
    
    local glitch = Instance.new("Frame")
    glitch.Size = UDim2.new(1, 0, 1, 0)
    glitch.BackgroundColor3 = Color3.new(1, 0, 0)
    glitch.BackgroundTransparency = 0.3
    glitch.Parent = gui
    
    coroutine.wrap(function()
        for i = 1, 40 do
            glitch.BackgroundTransparency = math.random(0, 5) / 10
            glitch.Position = UDim2.new(math.random(-5, 5) / 100, 0, math.random(-5, 5) / 100, 0)
            frame.Position = UDim2.new(math.random(-3, 3) / 100, 0, math.random(-3, 3) / 100, 0)
            text.Rotation = math.random(-5, 5)
            task.wait(0.03)
        end
        task.wait(5)
        gui:Destroy()
    end)()
end

remote.OnServerEvent:Connect(function(plr, targets)
    for _, target in ipairs(targets) do
        if target ~= plr then
            coroutine.wrap(function() showError(target) end)()
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "MainPanel"
    gui.ResetOnSpawn = false
    gui.Parent = player.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 400)
    frame.Position = UDim2.new(0.5, -110, 0.5, -200)
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
    
    local tools = {"BTools", "baconnull93k"}
    
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
        
        if v == "baconnull93k" then
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
                        local target = player:GetMouse().Target
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
                            c.Parent = Workspace
                        elseif b == "Anchor" then
                            target.Anchored = not target.Anchored
                        end
                    end)
                end
                
                return
            end
            
            if v == "baconnull93k" then
                local selectGui = Instance.new("ScreenGui")
                selectGui.Parent = player.PlayerGui
                
                local selectFrame = Instance.new("Frame")
                selectFrame.Size = UDim2.new(0, 350, 0, 400)
                selectFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
                selectFrame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
                selectFrame.BackgroundTransparency = 0.1
                selectFrame.BorderSizePixel = 2
                selectFrame.BorderColor3 = Color3.new(1, 0, 0)
                selectFrame.Active = true
                selectFrame.Draggable = true
                selectFrame.Parent = selectGui
                
                local title2 = Instance.new("TextLabel")
                title2.Size = UDim2.new(1, 0, 0, 40)
                title2.Text = "SELECT TARGETS"
                title2.TextColor3 = Color3.new(1, 0, 0)
                title2.TextScaled = true
                title2.Font = Enum.Font.Bold
                title2.BackgroundTransparency = 1
                title2.Parent = selectFrame
                
                local close2 = Instance.new("TextButton")
                close2.Size = UDim2.new(0, 30, 0, 30)
                close2.Position = UDim2.new(1, -35, 0, 5)
                close2.Text = "X"
                close2.TextColor3 = Color3.new(1, 1, 1)
                close2.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
                close2.Parent = selectFrame
                close2.MouseButton1Click:Connect(function() selectGui:Destroy() end)
                
                local scroll = Instance.new("ScrollingFrame")
                scroll.Size = UDim2.new(1, 0, 1, -110)
                scroll.Position = UDim2.new(0, 0, 0, 50)
                scroll.BackgroundTransparency = 1
                scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
                scroll.ScrollBarThickness = 8
                scroll.Parent = selectFrame
                
                local selected = {}
                
                local function updateList()
                    for _, child in ipairs(scroll:GetChildren()) do
                        if child:IsA("TextButton") then child:Destroy() end
                    end
                    
                    local y = 0
                    for _, plr in ipairs(Players:GetPlayers()) do
                        if plr ~= player then
                            local btn = Instance.new("TextButton")
                            btn.Size = UDim2.new(0.9, 0, 0, 35)
                            btn.Position = UDim2.new(0.05, 0, 0, y)
                            btn.Text = plr.Name
                            btn.TextColor3 = Color3.new(1, 1, 1)
                            btn.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
                            btn.BorderSizePixel = 1
                            btn.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
                            btn.Parent = scroll
                            
                            btn.MouseButton1Click:Connect(function()
                                if selected[plr] then
                                    selected[plr] = nil
                                    btn.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
                                    btn.Text = plr.Name
                                else
                                    selected[plr] = true
                                    btn.BackgroundColor3 = Color3.new(0.3, 0, 0)
                                    btn.Text = plr.Name .. " ✅"
                                end
                            end)
                            
                            y = y + 40
                        end
                    end
                    scroll.CanvasSize = UDim2.new(0, 0, 0, y + 10)
                end
                
                updateList()
                
                local start = Instance.new("TextButton")
                start.Size = UDim2.new(0.8, 0, 0, 45)
                start.Position = UDim2.new(0.1, 0, 1, -55)
                start.Text = "START HACK"
                start.TextColor3 = Color3.new(1, 0, 0)
                start.TextScaled = true
                start.Font = Enum.Font.Bold
                start.BackgroundColor3 = Color3.new(0.2, 0, 0)
                start.BorderSizePixel = 2
                start.BorderColor3 = Color3.new(1, 0, 0)
                start.Parent = selectFrame
                
                start.MouseButton1Click:Connect(function()
                    local targets = {}
                    for plr, _ in pairs(selected) do
                        table.insert(targets, plr)
                    end
                    if #targets > 0 then
                        selectGui:Destroy()
                        remote:FireServer(targets)
                    end
                end)
            end
        end)
    end
end)
