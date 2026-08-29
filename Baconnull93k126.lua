
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = Instance.new("RemoteEvent")
remote.Name = "HackEvent"
remote.Parent = ReplicatedStorage

local function hackPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local char = targetPlayer.Character
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    for i = 1, 50 do
        root.CFrame = root.CFrame + Vector3.new(math.random(-30,30), math.random(-30,30), math.random(-30,30))
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
    
    remote:FireClient(targetPlayer)
    task.wait(3.5)
    bill:Destroy()
    char:BreakJoints()
end

remote.OnServerEvent:Connect(function(plr, targets)
    for _, targetName in ipairs(targets) do
        local targetPlayer = Players:FindFirstChild(targetName)
        if targetPlayer and targetPlayer ~= plr then
            coroutine.wrap(function() hackPlayer(targetPlayer) end)()
        end
    end
end)
