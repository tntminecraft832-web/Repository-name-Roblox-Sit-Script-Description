local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local LocalPlayer=Players.LocalPlayer
local RS=game:GetService("ReplicatedStorage")

local remote=Instance.new("RemoteEvent")
remote.Name="Fling"
remote.Parent=RS

local gui=Instance.new("ScreenGui")
local frame=Instance.new("Frame")
local btn=Instance.new("TextButton")

gui.Parent=LocalPlayer:WaitForChild("PlayerGui")
frame.Parent=gui
frame.Size=UDim2.new(0,150,0,100)
frame.Position=UDim2.new(0.8,0,0.3,0)
frame.BackgroundColor3=Color3.fromRGB(30,30,30)
frame.Active=true
frame.Draggable=true

btn.Parent=frame
btn.Size=UDim2.new(0.8,0,0.4,0)
btn.Position=UDim2.new(0.1,0,0.4,0)
btn.Text="OFF"
btn.BackgroundColor3=Color3.fromRGB(255,0,0)
btn.TextColor3=Color3.fromRGB(255,255,255)
btn.TextScaled=true

local on=false
btn.MouseButton1Click:Connect(function()
    on=not on
    btn.Text=on and "ON" or "OFF"
    btn.BackgroundColor3=on and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
    remote:FireServer(on)
end)

local ss=Instance.new("Script")
ss.Parent=RS
ss.Source=[=[
    local r=script.Parent.Fling
    local plrs=game:GetService("Players")
    local rs=game:GetService("RunService")
    local a=false
    r.OnServerEvent:Connect(function(_,s)a=s end)
    rs.RenderStepped:Connect(function()
        if a then
            for _,p in pairs(plrs:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp=p.Character.HumanoidRootPart
                    local v=Vector3.new(math.random(-400,400),math.random(150,300),math.random(-400,400))
                    hrp.Velocity=v
                    hrp:ApplyImpulse(v*25)
                end
            end
        end
    end)
]=]
