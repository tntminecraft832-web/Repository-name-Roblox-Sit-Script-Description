local Players=game:GetService("Players")
local LocalPlayer=Players.LocalPlayer
local RS=game:GetService("ReplicatedStorage")

local remote=Instance.new("RemoteEvent")
remote.Name="BaconTools"
remote.Parent=RS

local gui=Instance.new("ScreenGui")
gui.Name="BaconNullGUI"
gui.Parent=LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn=false

local frame=Instance.new("Frame")
frame.Parent=gui
frame.Size=UDim2.new(0,350,0,450)
frame.Position=UDim2.new(0.5,-175,0.5,-225)
frame.BackgroundColor3=Color3.fromRGB(10,10,20)
frame.BorderSizePixel=0
frame.Active=true
frame.Draggable=true

local corner=Instance.new("UICorner")
corner.Parent=frame
corner.CornerRadius=UDim.new(0,10)

local title=Instance.new("TextLabel")
title.Parent=frame
title.Size=UDim2.new(1,0,0.12,0)
title.Text="BACONNULL93K"
title.TextColor3=Color3.fromRGB(255,0,100)
title.TextScaled=true
title.BackgroundTransparency=1
title.Font=Enum.Font.GothamBold

local close=Instance.new("TextButton")
close.Parent=frame
close.Size=UDim2.new(0,30,0,30)
close.Position=UDim2.new(0.9,0,0.02,0)
close.Text="✕"
close.TextColor3=Color3.fromRGB(255,0,0)
close.TextScaled=true
close.BackgroundTransparency=1
close.Font=Enum.Font.GothamBold
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local btn1=Instance.new("TextButton")
btn1.Parent=frame
btn1.Size=UDim2.new(0.8,0,0.12,0)
btn1.Position=UDim2.new(0.1,0,0.18,0)
btn1.Text="BACONNULL93K BTOOLS"
btn1.BackgroundColor3=Color3.fromRGB(255,0,100)
btn1.TextColor3=Color3.fromRGB(255,255,255)
btn1.TextScaled=true
btn1.Font=Enum.Font.GothamBold
local c1=Instance.new("UICorner")
c1.Parent=btn1
c1.CornerRadius=UDim.new(0,5)

local btn2=Instance.new("TextButton")
btn2.Parent=frame
btn2.Size=UDim2.new(0.8,0,0.12,0)
btn2.Position=UDim2.new(0.1,0,0.38,0)
btn2.Text="SLAP 10000000000"
btn2.BackgroundColor3=Color3.fromRGB(0,200,255)
btn2.TextColor3=Color3.fromRGB(255,255,255)
btn2.TextScaled=true
btn2.Font=Enum.Font.GothamBold
local c2=Instance.new("UICorner")
c2.Parent=btn2
c2.CornerRadius=UDim.new(0,5)

local status=Instance.new("TextLabel")
status.Parent=frame
status.Size=UDim2.new(1,0,0.08,0)
status.Position=UDim2.new(0,0,0.55,0)
status.Text="STATUS: READY"
status.TextColor3=Color3.fromRGB(150,150,150)
status.TextScaled=true
status.BackgroundTransparency=1
status.Font=Enum.Font.Gotham

local credits=Instance.new("TextLabel")
credits.Parent=frame
credits.Size=UDim2.new(1,0,0.08,0)
credits.Position=UDim2.new(0,0,0.85,0)
credits.Text="BY BACONNULL93K"
credits.TextColor3=Color3.fromRGB(255,0,100)
credits.TextScaled=true
credits.BackgroundTransparency=1
credits.Font=Enum.Font.GothamBold

btn1.MouseButton1Click:Connect(function()
    status.Text="⚡ EXECUTING BTOOLS ⚡"
    status.TextColor3=Color3.fromRGB(255,0,100)
    remote:FireServer("btools")
    status.Text="✅ BTOOLS ACTIVATED"
    status.TextColor3=Color3.fromRGB(0,255,0)
end)

btn2.MouseButton1Click:Connect(function()
    remote:FireServer("slap")
    status.Text="👊 SLAPPED!"
    status.TextColor3=Color3.fromRGB(255,200,0)
    task.wait(0.5)
    status.Text="STATUS: READY"
    status.TextColor3=Color3.fromRGB(150,150,150)
end)

local ss=Instance.new("Script")
ss.Parent=RS
ss.Source=[[
local r=script.Parent.BaconTools
local plrs=game:GetService("Players")
local ts=game:GetService("TweenService")
local sg=game:GetService("SoundService")

r.OnServerEvent:Connect(function(plr,action)
    if action=="btools" then
        for _,p in pairs(plrs:GetPlayers()) do
            if p~=plr then
                local gui=Instance.new("ScreenGui")
                gui.Parent=p.PlayerGui
                gui.ResetOnSpawn=false
                
                local black=Instance.new("Frame")
                black.Parent=gui
                black.Size=UDim2.new(1,0,1,0)
                black.BackgroundColor3=Color3.fromRGB(0,0,0)
                black.ZIndex=1000
                
                task.wait(0.3)
                
                for i=1,100 do
                    local glitch=Instance.new("Frame")
                    glitch.Parent=gui
                    glitch.Size=UDim2.new(math.random(10,200)/100,0,math.random(5,50)/100,0)
                    glitch.Position=UDim2.new(math.random(),0,math.random(),0)
                    glitch.BackgroundColor3=Color3.fromRGB(255,0,100)
                    glitch.BackgroundTransparency=math.random(30,80)/100
                    glitch.ZIndex=1002
                end
                
                local err=Instance.new("TextLabel")
                err.Parent=gui
                err.Size=UDim2.new(1,0,0.2,0)
                err.Position=UDim2.new(0,0,0.4,0)
                err.Text="BACONNULL93K HACK"
                err.TextColor3=Color3.fromRGB(255,0,0)
                err.TextScaled=true
                err.BackgroundTransparency=1
                err.ZIndex=1003
                
                local code=Instance.new("TextLabel")
                code.Parent=gui
                code.Size=UDim2.new(1,0,0.1,0)
                code.Position=UDim2.new(0,0,0.65,0)
                code.Text="ERROR 2679"
                code.TextColor3=Color3.fromRGB(255,0,255)
                code.TextScaled=true
                code.BackgroundTransparency=1
                code.ZIndex=1003
                
                local sound=Instance.new("Sound")
                sound.Parent=gui
                sound.SoundId="rbxassetid://9120384626"
                sound.Volume=10
                sound:Play()
                
                ts:Create(err,{Duration=0.5,Style="Bounce"},{Size=UDim2.new(1.5,0,0.3,0)}):Play()
                ts:Create(code,{Duration=0.5,Style="Bounce"},{Size=UDim2.new(1.5,0,0.15,0)}):Play()
                
                task.wait(3)
                p:Kick("BACONNULL93K HACK DETECTED [ERROR 2679]")
            end
        end
    elseif action=="slap" then
        for _,p in pairs(plrs:GetPlayers()) do
            if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hrp=p.Character.HumanoidRootPart
                local v=Vector3.new(math.random(-100000,-50000),math.random(50000,100000),math.random(-100000,-50000))
                hrp.Velocity=v
                hrp:ApplyImpulse(v*50)
            end
        end
    end
end)
]]
