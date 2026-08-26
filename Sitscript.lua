local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

game:GetService("RunService").RenderStepped:Connect(function()
    char.Humanoid.WalkSpeed = 100
end)

task.spawn(function()
    while true do
        local p = Instance.new("Part")
        p.Parent = workspace
        p.CFrame = root.CFrame
        task.wait(0.001)
    end
end)

task.spawn(function()
    while true do
        root.CFrame = root.CFrame * CFrame.Angles(0, 999, 0)
        task.wait()
    end
end)

task.spawn(function()
    for i = 1, 100 do
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ERROR 267", "All")
        task.wait(0.05)
    end
end)
