-- LocalScript for Delta
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local rootPart = character:FindFirstChild("HumanoidRootPart")
if not rootPart then return end

local part = Instance.new("Part")
part.Size = Vector3.new(4, 4, 1)
part.BrickColor = BrickColor.new("Bright red")
part.Position = rootPart.Position + rootPart.CFrame.LookVector * 6
part.Anchored = true
part.Parent = workspace

local billboard = Instance.new("BillboardGui")
billboard.Size = UDim2.new(0, 300, 0, 80)
billboard.Adornee = part
billboard.Parent = part

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "baconnull93k hack"
label.TextColor3 = Color3.new(1, 0, 0)
label.TextScaled = true
label.Font = Enum.Font.Bold
label.Parent = billboard

game:GetService("RunService").Heartbeat:Connect(function(dt)
    if not part.Parent then return end
    part.Position = part.Position + rootPart.CFrame.LookVector * 5 * dt
end)
