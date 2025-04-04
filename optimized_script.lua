-- Script dengan optimasi ekstrem + Anti-Detection & Anti-Kick + Obfuscation

local function x1(o0)
    task.spawn(function()
        while true do
            o0.Position = o0.Position + Vector3.new(math.random(-1,1) * 1.5, math.random(-1,1) * 1.5, math.random(-1,1) * 1.5)
            task.wait(math.random(1,3) * 0.01)
        end
    end)
end

local function x2(t9)
    task.spawn(function()
        while t9 and t9.Position.Y > 0 do
            t9.Position = t9.Position + Vector3.new(0, -10, 0)
            task.wait(math.random(1,3) * 0.01)
        end
    end)
end

local plr = game:GetService("Players").LocalPlayer
plr.Idled:Connect(function()
    local vu = game:GetService("VirtualUser")
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- UI TOYKECE
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Text = "TOYKECE Hub"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
