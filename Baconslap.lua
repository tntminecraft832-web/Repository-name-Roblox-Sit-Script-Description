local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        task.wait(1)
        
        local humanoid = char:FindFirstChild("Humanoid")
        if not humanoid then return end
        
        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            for _, part in ipairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Touched:Connect(function(hit)
                        local hitChar = hit.Parent
                        if hitChar and hitChar:FindFirstChild("Humanoid") and hitChar ~= char then
                            local root = hitChar:FindFirstChild("HumanoidRootPart")
                            if root then
                                root.CFrame = root.CFrame + Vector3.new(1000, 0, 1000)
                                task.wait(0.5)
                                hitChar:BreakJoints()
                            end
                        end
                    end)
                end
            end
        end
    end)
end)ض
