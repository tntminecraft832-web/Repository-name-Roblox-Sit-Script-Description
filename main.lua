local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

game:GetService("RunService").Heartbeat:Connect(function()
    if not char or not hum then return end
    hum.WalkSpeed = 50
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") and string.lower(v.Name):find("treadmill") then
            hum:MoveTo(v.Position + Vector3.new(0, 5, 0))
            break
        end
    end
end)

plr.CharacterAdded:Connect(function(c)
    char = c
    hum = c:WaitForChild("Humanoid")
    task.wait(1)
    local rb = plr.PlayerGui:FindFirstChild("RebirthButton")
    if rb then rb:FireServer("Rebirth") end
end)

print("Loaded")
