-- Script توی StarterPack (ابزار)
local tool = script.Parent
local moveSpeed = 5

tool.Activated:Connect(function()
	local character = tool.Parent
	local humanoid = character:FindFirstChild("Humanoid")
	if not humanoid then return end
	
	local targetPart = character:FindFirstChild("RightHand")
	if not targetPart then return end
	
	-- یه آبجکت جدید میسازه جلوی بازیکن
	local part = Instance.new("Part")
	part.Size = Vector3.new(2, 2, 2)
	part.BrickColor = BrickColor.Random()
	part.Position = character.HumanoidRootPart.Position + character.HumanoidRootPart.CFrame.LookVector * 5
	part.Anchored = false
	part.Parent = workspace
	
	-- وقتی کلیک میکنی حرکت میده
	local connection
	connection = game:GetService("RunService").Heartbeat:Connect(function()
		if not tool.Parent then 
			connection:Disconnect()
			return 
		end
		part.Position = part.Position + character.HumanoidRootPart.CFrame.LookVector * moveSpeed * 0.016
	end)
end)
