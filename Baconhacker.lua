local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local character = player.Character or player.CharacterAdded:Wait()

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0, 10, 0.5, -125)
frame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
frame.BackgroundTransparency = 0.1
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local buttons = {"Move", "Resize", "Paint", "Delete", "Glitch", "Kick"}

for i, btnName in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.8, 0, 0, 30)
    btn.Position = UDim2.new(0.1, 0, 0, (i-1) * 35 + 10)
    btn.Text = btnName
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    btn.Parent = frame
    
    btn.MouseButton1Click:Connect(function()
        if btnName == "Glitch" then
            local target = mouse.Target
            if target and target:IsA("BasePart") then
                local char = target.Parent
                if char and char:FindFirstChild("Humanoid") then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        for i = 1, 30 do
                            root.CFrame = root.CFrame + Vector3.new(math.random(-15, 15), math.random(-15, 15), math.random(-15, 15))
                            task.wait(0.01)
                        end
                        local bill = Instance.new("BillboardGui")
                        bill.Size = UDim2.new(0, 300, 0, 80)
                        bill.Adornee = char:FindFirstChild("Head") or root
                        bill.Parent = char
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.Text = "baconnull93k hack"
                        label.TextColor3 = Color3.new(1, 0, 0)
                        label.TextScaled = true
                        label.Font = Enum.Font.Bold
                        label.Parent = bill
                        task.wait(3)
                        bill:Destroy()
                    end
                end
            end
        elseif btnName == "Kick" then
            local target = mouse.Target
            if target and target:IsA("BasePart") then
                local char = target.Parent
                if char and char:FindFirstChild("Humanoid") then
                    local root = char:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = root.CFrame + Vector3.new(0, 5000, 0)
                        task.wait(0.5)
                        local bill = Instance.new("BillboardGui")
                        bill.Size = UDim2.new(0, 300, 0, 80)
                        bill.Adornee = char:FindFirstChild("Head") or root
                        bill.Parent = char
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.Text = "baconnull93k hack"
                        label.TextColor3 = Color3.new(1, 0, 0)
                        label.TextScaled = true
                        label.Font = Enum.Font.Bold
                        label.Parent = bill
                        task.wait(2)
                        char:BreakJoints()
                    end
                end
            end
        elseif btnName == "Move" then
            local target = mouse.Target
            if target and target:IsA("BasePart") then
                target.Anchored = true
                target.CFrame = target.CFrame + Vector3.new(0, 5, 0)
            end
        elseif btnName == "Delete" then
            local target = mouse.Target
            if target and target:IsA("BasePart") then
                target:Destroy()
            end
        elseif btnName == "Paint" then
            local target = mouse.Target
            if target and target:IsA("BasePart") then
                target.BrickColor = BrickColor.Random()
            end
        elseif btnName == "Resize" then
            local target = mouse.Target
            if target and target:IsA("BasePart") then
                target.Size = target.Size * 1.5
            end
        end
    end)
end
