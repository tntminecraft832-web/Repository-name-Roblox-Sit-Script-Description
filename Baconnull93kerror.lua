local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local character = player.Character or player.CharacterAdded:Wait()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "F3X_Panel"
screenGui.Parent = player.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 450)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -225)
mainFrame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "F3X Btools"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.Bold
title.BackgroundTransparency = 1
title.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
closeBtn.BorderSizePixel = 0
closeBtn.Parent = mainFrame
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local tools = {
    {"Move", 0, 50},
    {"Resize", 0, 85},
    {"Rotate", 0, 120},
    {"Paint", 0, 155},
    {"Delete", 0, 190},
    {"Clone", 0, 225},
    {"Anchor", 0, 260},
    {"Glitch", 0, 295},
    {"Kick", 0, 330},
    {"Explode", 0, 365}
}

for i, data in ipairs(tools) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 30)
    btn.Position = UDim2.new(0.075, 0, 0, data[2] + 5)
    btn.Text = data[1]
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextScaled = true
    btn.Font = Enum.Font.SourceSansBold
    btn.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    btn.BorderSizePixel = 1
    btn.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
    btn.Parent = mainFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        if data[1] == "baconnull93k😈" then
            openPlayerSelect()
            return
        end
        
        local target = mouse.Target
        if not target or not target:IsA("BasePart") then
            return
        end
        
        if data[1] == "Move" then
            target.Anchored = true
            target.CFrame = target.CFrame + Vector3.new(0, 5, 0)
        elseif data[1] == "Resize" then
            target.Size = target.Size * 1.5
        elseif data[1] == "Rotate" then
            target.CFrame = target.CFrame * CFrame.Angles(0, math.rad(45), 0)
        elseif data[1] == "Paint" then
            target.BrickColor = BrickColor.Random()
        elseif data[1] == "Delete" then
            target:Destroy()
        elseif data[1] == "Clone" then
            local clone = target:Clone()
            clone.Position = target.Position + Vector3.new(5, 0, 0)
            clone.Parent = workspace
        elseif data[1] == "Anchor" then
            target.Anchored = not target.Anchored
        elseif data[1] == "Glitch" then
            local char = target.Parent
            if char and char:FindFirstChild("Humanoid") then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    for i = 1, 30 do
                        root.CFrame = root.CFrame + Vector3.new(math.random(-20, 20), math.random(-20, 20), math.random(-20, 20))
                        task.wait(0.01)
                    end
                end
            end
        elseif data[1] == "Kick" then
            local char = target.Parent
            if char and char:FindFirstChild("Humanoid") then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = root.CFrame + Vector3.new(0, 5000, 0)
                    task.wait(0.5)
                    char:BreakJoints()
                end
            end
        elseif data[1] == "Explode" then
            local explosion = Instance.new("Explosion")
            explosion.Position = target.Position
            explosion.BlastRadius = 20
            explosion.BlastPressure = 500000
            explosion.Parent = workspace
        end
    end)
end

local hackBtn = Instance.new("TextButton")
hackBtn.Size = UDim2.new(0.85, 0, 0, 35)
hackBtn.Position = UDim2.new(0.075, 0, 0, 405)
hackBtn.Text = "baconnull93k😈"
hackBtn.TextColor3 = Color3.new(1, 0, 0)
hackBtn.TextScaled = true
hackBtn.Font = Enum.Font.Bold
hackBtn.BackgroundColor3 = Color3.new(0.2, 0, 0)
hackBtn.BorderSizePixel = 2
hackBtn.BorderColor3 = Color3.new(1, 0, 0)
hackBtn.Parent = mainFrame

local hackCorner = Instance.new("UICorner")
hackCorner.CornerRadius = UDim.new(0, 6)
hackCorner.Parent = hackBtn

local hackFrame = nil

function openPlayerSelect()
    if hackFrame then
        hackFrame:Destroy()
        hackFrame = nil
        return
    end
    
    hackFrame = Instance.new("Frame")
    hackFrame.Size = UDim2.new(0, 300, 0, 350)
    hackFrame.Position = UDim2.new(0.5, -150, 0.5, -175)
    hackFrame.BackgroundColor3 = Color3.new(0.05, 0.05, 0.05)
    hackFrame.BackgroundTransparency = 0.1
    hackFrame.BorderSizePixel = 2
    hackFrame.BorderColor3 = Color3.new(1, 0, 0)
    hackFrame.Active = true
    hackFrame.Draggable = true
    hackFrame.Parent = screenGui
    
    local hCorner = Instance.new("UICorner")
    hCorner.CornerRadius = UDim.new(0, 12)
    hCorner.Parent = hackFrame
    
    local hTitle = Instance.new("TextLabel")
    hTitle.Size = UDim2.new(1, 0, 0, 40)
    hTitle.Text = "SELECT TARGET"
    hTitle.TextColor3 = Color3.new(1, 0, 0)
    hTitle.TextScaled = true
    hTitle.Font = Enum.Font.Bold
    hTitle.BackgroundTransparency = 1
    hTitle.Parent = hackFrame
    
    local hClose = Instance.new("TextButton")
    hClose.Size = UDim2.new(0, 30, 0, 30)
    hClose.Position = UDim2.new(1, -35, 0, 5)
    hClose.Text = "X"
    hClose.TextColor3 = Color3.new(1, 1, 1)
    hClose.BackgroundColor3 = Color3.new(0.3, 0.1, 0.1)
    hClose.BorderSizePixel = 0
    hClose.Parent = hackFrame
    hClose.MouseButton1Click:Connect(function()
        hackFrame:Destroy()
        hackFrame = nil
    end)
    
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, 0, 1, -100)
    scroll.Position = UDim2.new(0, 0, 0, 50)
    scroll.BackgroundTransparency = 1
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.ScrollBarThickness = 8
    scroll.Parent = hackFrame
    
    local selectedPlayers = {}
    
    local function updateList()
        for _, v in ipairs(scroll:GetChildren()) do
            if v:IsA("TextButton") then
                v:Destroy()
            end
        end
        
        local y = 0
        for _, plr in ipairs(game.Players:GetPlayers()) do
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
                
                local bCorner = Instance.new("UICorner")
                bCorner.CornerRadius = UDim.new(0, 6)
                bCorner.Parent = btn
                
                btn.MouseButton1Click:Connect(function()
                    if selectedPlayers[plr] then
                        selectedPlayers[plr] = nil
                        btn.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
                    else
                        selectedPlayers[plr] = true
                        btn.BackgroundColor3 = Color3.new(0.3, 0, 0)
                    end
                end)
                
                y = y + 40
            end
        end
        scroll.CanvasSize = UDim2.new(0, 0, 0, y + 10)
    end
    
    updateList()
    
    game.Players.PlayerAdded:Connect(updateList)
    game.Players.PlayerRemoving:Connect(updateList)
    
    local startBtn = Instance.new("TextButton")
    startBtn.Size = UDim2.new(0.8, 0, 0, 40)
    startBtn.Position = UDim2.new(0.1, 0, 1, -50)
    startBtn.Text = "START HACK"
    startBtn.TextColor3 = Color3.new(1, 0, 0)
    startBtn.TextScaled = true
    startBtn.Font = Enum.Font.Bold
    startBtn.BackgroundColor3 = Color3.new(0.2, 0, 0)
    startBtn.BorderSizePixel = 2
    startBtn.BorderColor3 = Color3.new(1, 0, 0)
    startBtn.Parent = hackFrame
    
    local sCorner = Instance.new("UICorner")
    sCorner.CornerRadius = UDim.new(0, 8)
    sCorner.Parent = startBtn
    
    startBtn.MouseButton1Click:Connect(function()
        local targets = {}
        for plr, _ in pairs(selectedPlayers) do
            table.insert(targets, plr)
        end
        
        if #targets == 0 then
            return
        end
        
        hackFrame:Destroy()
        hackFrame = nil
        
        for _, target in ipairs(targets) do
            local char = target.Character
            if char then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    for i = 1, 50 do
                        root.CFrame = root.CFrame + Vector3.new(math.random(-30, 30), math.random(-30, 30), math.random(-30, 30))
                        task.wait(0.01)
                    end
                    
                    local head = char:FindFirstChild("Head") or root
                    local bill = Instance.new("BillboardGui")
                    bill.Size = UDim2.new(0, 400, 0, 120)
                    bill.Adornee = head
                    bill.Parent = char
                    
                    local label = Instance.new("TextLabel")
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.Text = "baconnull93k hack"
                    label.TextColor3 = Color3.new(1, 0, 0)
                    label.TextScaled = true
                    label.Font = Enum.Font.Bold
                    label.Parent = bill
                    
                    local glitchFrame = Instance.new("Frame")
                    glitchFrame.Size = UDim2.new(1, 0, 1, 0)
                    glitchFrame.BackgroundColor3 = Color3.new(1, 0, 0)
                    glitchFrame.BackgroundTransparency = 0.5
                    glitchFrame.Parent = char
                    
                    for i = 1, 20 do
                        glitchFrame.BackgroundTransparency = math.random(0, 5) / 10
                        glitchFrame.Position = UDim2.new(math.random(-5, 5) / 100, 0, math.random(-5, 5) / 100, 0)
                        task.wait(0.05)
                    end
                    
                    glitchFrame:Destroy()
                    
                    task.wait(1)
                    
                    local errorGui = Instance.new("ScreenGui")
                    errorGui.Parent = target.PlayerGui
                    
                    local errorFrame = Instance.new("Frame")
                    errorFrame.Size = UDim2.new(1, 0, 1, 0)
                    errorFrame.BackgroundColor3 = Color3.new(0, 0, 0)
                    errorFrame.Parent = errorGui
                    
                    local errorText = Instance.new("TextLabel")
                    errorText.Size = UDim2.new(1, 0, 1, 0)
                    errorText.Text = "ERROR 267\nbaconnull93k hack"
                    errorText.TextColor3 = Color3.new(1, 0, 0)
                    errorText.TextScaled = true
                    errorText.Font = Enum.Font.Bold
                    errorText.BackgroundTransparency = 1
                    errorText.Parent = errorFrame
                    
                    for i = 1, 30 do
                        errorFrame.Position = UDim2.new(math.random(-10, 10) / 100, 0, math.random(-10, 10) / 100, 0)
                        task.wait(0.05)
                    end
                    
                    task.wait(3)
                    errorGui:Destroy()
                    bill:Destroy()
                    
                    char:BreakJoints()
                end
            end
        end
    end)
end
