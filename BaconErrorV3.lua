local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local LocalPlayer=Players.LocalPlayer
local RS=game:GetService("ReplicatedStorage")
local TS=game:GetService("TweenService")
local SG=game:GetService("SoundService")
local LC=game:GetService("Lighting")

local remote=Instance.new("RemoteEvent")
remote.Name="BaconFling"
remote.Parent=RS

local gui=Instance.new("ScreenGui")
gui.Name="BaconNullGUI"
gui.Parent=LocalPlayer:WaitForChild("PlayerGui")
gui.ResetOnSpawn=false

local frame=Instance.new("Frame")
frame.Parent=gui
frame.Size=UDim2.new(0,500,0,400)
frame.Position=UDim2.new(0.5,-250,0.5,-200)
frame.BackgroundColor3=Color3.fromRGB(10,10,20)
frame.BackgroundTransparency=0.1
frame.BorderSizePixel=0

local corner=Instance.new("UICorner")
corner.Parent=frame
corner.CornerRadius=UDim.new(0,15)

local glow=Instance.new("UIGradient")
glow.Parent=frame
glow.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,100)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,200)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,100))}
glow.Rotation=45

local title=Instance.new("TextLabel")
title.Parent=frame
title.Size=UDim2.new(1,0,0.15,0)
title.Position=UDim2.new(0,0,0,0)
title.Text="BACONNULL93K"
title.TextColor3=Color3.fromRGB(255,0,100)
title.TextScaled=true
title.BackgroundTransparency=1
title.Font=Enum.Font.GothamBold

local sub=Instance.new("TextLabel")
sub.Parent=frame
sub.Size=UDim2.new(1,0,0.08,0)
sub.Position=UDim2.new(0,0,0.12,0)
sub.Text="⚡ SYSTEM OVERDRIVE ⚡"
sub.TextColor3=Color3.fromRGB(0,255,200)
sub.TextScaled=true
sub.BackgroundTransparency=1
sub.Font=Enum.Font.Gotham

local avatar=Instance.new("ImageLabel")
avatar.Parent=frame
avatar.Size=UDim2.new(0,100,0,100)
avatar.Position=UDim2.new(0.5,-50,0.25,0)
avatar.BackgroundTransparency=1
avatar.Image="rbxassetid://5374744288"

local toggle=Instance.new("TextButton")
toggle.Parent=frame
toggle.Size=UDim2.new(0.6,0,0.12,0)
toggle.Position=UDim2.new(0.2,0,0.55,0)
toggle.Text="🔴 OFFLINE"
toggle.BackgroundColor3=Color3.fromRGB(255,0,50)
toggle.TextColor3=Color3.fromRGB(255,255,255)
toggle.TextScaled=true
toggle.Font=Enum.Font.GothamBold
local tcorner=Instance.new("UICorner")
tcorner.Parent=toggle
tcorner.CornerRadius=UDim.new(0,8)

local status=Instance.new("TextLabel")
status.Parent=frame
status.Size=UDim2.new(1,0,0.08,0)
status.Position=UDim2.new(0,0,0.72,0)
status.Text="STATUS: STANDING BY"
status.TextColor3=Color3.fromRGB(150,150,150)
status.TextScaled=true
status.BackgroundTransparency=1
status.Font=Enum.Font.Gotham

local credits=Instance.new("TextLabel")
credits.Parent=frame
credits.Size=UDim2.new(1,0,0.08,0)
credits.Position=UDim2.new(0,0,0.85,0)
credits.Text="BY BACONNULL93K | 93 ARMY"
credits.TextColor3=Color3.fromRGB(255,0,100)
credits.TextScaled=true
credits.BackgroundTransparency=1
credits.Font=Enum.Font.GothamBold

local glitchFrame=Instance.new("Frame")
glitchFrame.Parent=gui
glitchFrame.Size=UDim2.new(1,0,1,0)
glitchFrame.BackgroundColor3=Color3.fromRGB(0,0,0)
glitchFrame.BackgroundTransparency=1
glitchFrame.Visible=false
glitchFrame.ZIndex=999

local glitchImg=Instance.new("ImageLabel")
glitchImg.Parent=glitchFrame
glitchImg.Size=UDim2.new(1,0,1,0)
glitchImg.BackgroundTransparency=1
glitchImg.Image="rbxassetid://5374744288"
glitchImg.ImageTransparency=0.3

local glitchImg2=Instance.new("ImageLabel")
glitchImg2.Parent=glitchFrame
glitchImg2.Size=UDim2.new(1,0,1,0)
glitchImg2.BackgroundTransparency=1
glitchImg2.Image="rbxassetid://5374744288"
glitchImg2.ImageTransparency=0.5
glitchImg2.Position=UDim2.new(0.02,0,0.02,0)

local sound=Instance.new("Sound")
sound.Parent=SG
sound.SoundId="rbxassetid://9120384626"
sound.Volume=10
sound.PlayOnRemove=true

local on=false
toggle.MouseButton1Click:Connect(function()
    on=not on
    toggle.Text=on and "🟢 ONLINE" or "🔴 OFFLINE"
    toggle.BackgroundColor3=on and Color3.fromRGB(0,200,50) or Color3.fromRGB(255,0,50)
    status.Text=on and "STATUS: ⚡ HACKING ⚡" or "STATUS: STANDING BY"
    status.TextColor3=on and Color3.fromRGB(255,0,100) or Color3.fromRGB(150,150,150)
    remote:FireServer(on)
end)

local ss=Instance.new("Script")
ss.Parent=RS
ss.Source=[=[
    local r=script.Parent.BaconFling
    local plrs=game:GetService("Players")
    local rs=game:GetService("RunService")
    local l=game:GetService("Lighting")
    local sg=game:GetService("SoundService")
    local ts=game:GetService("TweenService")
    local a=false
    
    r.OnServerEvent:Connect(function(_,s)
        a=s
        if s then
            for _,p in pairs(plrs:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp=p.Character.HumanoidRootPart
                    local v=Vector3.new(math.random(-500,500),math.random(200,400),math.random(-500,500))
                    hrp.Velocity=v
                    hrp:ApplyImpulse(v*30)
                end
                if p.PlayerGui then
                    local gui=Instance.new("ScreenGui")
                    gui.Name="BaconGlitch"
                    gui.ResetOnSpawn=false
                    gui.Parent=p.PlayerGui
                    
                    local black=Instance.new("Frame")
                    black.Parent=gui
                    black.Size=UDim2.new(1,0,1,0)
                    black.BackgroundColor3=Color3.fromRGB(0,0,0)
                    black.ZIndex=1000
                    
                    task.wait(0.3)
                    
                    local gl=Instance.new("Frame")
                    gl.Parent=gui
                    gl.Size=UDim2.new(1,0,1,0)
                    gl.BackgroundColor3=Color3.fromRGB(0,0,0)
                    gl.BackgroundTransparency=0.1
                    gl.ZIndex=1001
                    
                    for i=1,50 do
                        local img=Instance.new("ImageLabel")
                        img.Parent=gl
                        img.Size=UDim2.new(math.random(50,200)/100,0,math.random(50,200)/100,0)
                        img.Position=UDim2.new(math.random(),0,math.random(),0)
                        img.BackgroundTransparency=1
                        img.Image="rbxassetid://5374744288"
                        img.ImageTransparency=math.random(0,50)/100
                        img.ZIndex=1002
                    end
                    
                    for i=1,30 do
                        local bar=Instance.new("Frame")
                        bar.Parent=gl
                        bar.Size=UDim2.new(math.random(20,80)/100,0,0.01,0)
                        bar.Position=UDim2.new(0,0,math.random(),0)
                        bar.BackgroundColor3=Color3.fromRGB(255,0,100)
                        bar.BackgroundTransparency=math.random(30,80)/100
                        bar.ZIndex=1003
                    end
                    
                    local err=Instance.new("TextLabel")
                    err.Parent=gui
                    err.Size=UDim2.new(1,0,0.1,0)
                    err.Position=UDim2.new(0,0,0.9,0)
                    err.Text="[ERROR] BACONNULL93K HACK DETECTED"
                    err.TextColor3=Color3.fromRGB(255,0,0)
                    err.TextScaled=true
                    err.BackgroundTransparency=1
                    err.ZIndex=1004
                    
                    local sound=Instance.new("Sound")
                    sound.Parent=gui
                    sound.SoundId="rbxassetid://9120384626"
                    sound.Volume=10
                    sound.PlayOnRemove=true
                    sound:Play()
                    
                    ts:Create(black,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
                    task.wait(0.5)
                    
                    ts:Create(err,TweenInfo.new(0.3,Enum.EasingStyle.Bounce),{Position=UDim2.new(0,0,0.8,0)}):Play()
                    
                    task.wait(0.5)
                    err.Text="⚠️ SYSTEM COMPROMISED BY BACONNULL93K ⚠️"
                    err.TextColor3=Color3.fromRGB(255,0,255)
                    
                    task.wait(1)
                    gui:Destroy()
                end
            end
        end
    end)
]=]
