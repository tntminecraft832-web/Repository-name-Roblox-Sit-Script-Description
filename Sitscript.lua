local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function sitDown()
    if humanoid then
        humanoid.Sit = true
        game:GetService("Chat"):Chat(character.Head, "Sitting down...", Enum.ChatColor.Red)
        task.wait(10)
        humanoid.Sit = false
        game:GetService("Chat"):Chat(character.Head, "Ready to go!", Enum.ChatColor.Green)
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then
        sitDown()
    end
end)

game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if msg:lower() == "/sit" or msg:lower() == "sit" then
        sitDown()
    end
end)

print("Script loaded! Press F or type /sit")
