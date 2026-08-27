local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local SoundService = game:GetService("SoundService")

task.spawn(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9116670439"
    sound.Volume = 10
    sound.Looped = true
    sound.Parent = SoundService
    for i = 1, 50 do
        local clone = sound:Clone()
        clone.Parent = SoundService
        clone:Play()
        task.wait(0.05)
    end
end)

task.spawn(function()
    local cam = workspace.CurrentCamera
    while true do
        cam.CFrame = cam.CFrame * CFrame.Angles(math.rad(math.random(-50,50)), math.rad(math.random(-50,50)), math.rad(math.random(-50,50)))
        cam.FieldOfView = math.random(1, 120)
        task.wait(0.01)
    end
end)

task.spawn(function()
    while true do
        for i = 1, 50 do
            local p = Instance.new("Part")
            p.Parent = workspace
            p.Size = Vector3.new(math.random(1,50), math.random(1,50), math.random(1,50))
            p.CFrame = root.CFrame * CFrame.new(math.random(-100,100), math.random(-100,100), math.random(-100,100))
            p.Material = Enum.Material.Neon
            p.BrickColor = BrickColor.Random()
            task.wait()
        end
        task.wait(0.001)
    end
end)

task.spawn(function()
    while true do
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("HELP ME", "All")
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ERROR 267 IN 5 SECONDS", "All")
        task.wait(0.1)
    end
end)

task.wait(5)

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
    while true do
        local newChar = char:Clone()
        newChar.Parent = workspace
        newChar.Name = "GHOST_EXPLOIT"
        task.wait(0.01)
    end
end)
