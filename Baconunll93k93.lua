local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = Instance.new("RemoteEvent")
remote.Name = "HackEvent"
remote.Parent = ReplicatedStorage

local function hackPlayer(target)
    local char = target.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local humanoid = char:FindFirstChild("Humanoid")
    if not root or not humanoid then return end
    
    for i = 1, 60 do
        root.CFrame = root.CFrame + Vector3.new(math.random(-40,40), math.random(-40,40), math.random(-40,40))
        humanoid.WalkSpeed = math.random(0, 100)
        humanoid.JumpPower = math.random(0, 200)
        task.wait(0.01)
    end
    
    local head = char:FindFirstChild("Head") or root
    local bill = Instance.new("BillboardGui")
    bill.Size = UDim2.new(0, 500, 0, 150)
    bill.Adornee = head
    bill.Parent = char
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "baconnull93k"
    label.TextColor3 = Color3.new(1, 0, 0)
    label.TextScaled = true
    label.Font = Enum.Font.Bold
    label.Parent = bill
    
    for i = 1, 20 do
        label.TextColor3 = Color3.new(math.random(), 0, 0)
        label.Rotation = math.random(-10, 10)
        bill.Size = UDim2.new(0, math.random(300, 600), 0, math.random(100, 200))
        task.wait(0.05)
    end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "ErrorScreen"
    gui.ResetOnSpawn = false
    gui.Parent = target.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.2
    frame.Parent = gui
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.Text = "ERROR 267\npla play hacker (baconnull93k)"
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
        for i = 1, 50 do
            glitch.BackgroundTransparency = math.random(0, 5) / 10
            glitch.Position = UDim2.new(math.random(-8, 8) / 100, 0, math.random(-8, 8) / 100, 0)
            frame.Position = UDim2.new(math.random(-5, 5) / 100, 0, math.random(-5, 5) / 100, 0)
            text.Rotation = math.random(-5, 5)
            text.TextColor3 = Color3.new(math.random(), 0, 0)
            task.wait(0.03)
        end
        task.wait(4)
        gui:Destroy()
    end)()
    
    task.wait(4)
    bill:Destroy()
    char:BreakJoints()
end

remote.OnServerEvent:Connect(function(plr, targets)
    for _, target in ipairs(targets) do
        if target ~= plr then
            coroutine.wrap(function() hackPlayer(target) end)()
        end
    end
end)

Players.PlayerAdded:Connect(function(player)
    local gui = Instance.new("ScreenGui")
    gui.Name = "F3X_Panel"
    gui.ResetOnSpawn = false
    gui.Parent = player.PlayerGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 220, 0, 470)
    frame.Position = UDim2.new(0.5, -110, 0.5, -235)
    frame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
    frame.BackgroundTransparency = 0.1
    frame.Active = true
    frame.Draggable = true
    frame.Parent = gui
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "F3X Btools"
    title.TextColor3 = Color3.new(1, 1, 1)
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
    
    local tools = {"Move","Resize","Paint","Delete","Clone","Anchor","Glitch","Kick","Explode","baconnull93k"}
    
    for i, v in ipairs(tools) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.85, 0, 0, 30)
        btn.Position = UDim2.new(0.075, 0, 0, (i-1)*35 + 45)
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
                                else
                                    selected[plr] = true
                                    btn.BackgroundColor3 = Color3.new(0.3, 0, 0)
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
                
                return
            end
            
            local target = player:GetMouse().Target
            if not target or not target:IsA("BasePart") then return end
            
            if v == "Move" then
                target.Anchored = true
                target.CFrame = target.CFrame + Vector3.new(0, 5, 0)
            elseif v == "Resize" then
                target.Size = target.Size * 1.5
            elseif v == "Paint" then
                target.BrickColor = BrickColor.Random()
            elseif v == "Delete" then
                target:Destroy()
            elseif v == "Clone" then
                local c = target:Clone()
                c.Position = target.Position + Vector3.new(5, 0, 0)
                c.Parent = Workspace
            elseif v == "Anchor" then
                target.Anchored = not target.Anchored
            else
                local char = target.Parent
                if char and char:FindFirstChild("Humanoid") then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        if v == "Glitch" then
                            for i = 1, 30 do
                                root.CFrame = root.CFrame + Vector3.new(math.random(-20,20), math.random(-20,20), math.random(-20,20))
                                task.wait(0.01)
                            end
                        elseif v == "Kick" then
                            root.CFrame = root.CFrame + Vector3.new(0, 5000, 0)
                            task.wait(0.5)
                            char:BreakJoints()
                        elseif v == "Explode" then
                            local e = Instance.new("Explosion")
                            e.Position = root.Position
                            e.BlastRadius = 20
                            e.BlastPressure = 500000
                            e.Parent = Workspace
                        end
                    end
                end
            end
        end)
    end
end)
