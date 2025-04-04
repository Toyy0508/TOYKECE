-- TOYKECE Hub - Menu Fishing dengan fitur Auto Catch, Auto Cast, Auto Shake & Instant Reel

-- Auto Catch Script
local isAutoCatchActive = false

local function autoCatch()
    print("Auto Catch toggled: " .. tostring(isAutoCatchActive))
    while isAutoCatchActive do
        task.wait(1) -- Delay untuk menghindari spam
        local fishEvent = game:GetService("ReplicatedStorage"):FindFirstChild("CatchFish")
        if fishEvent then
            fishEvent:FireServer() -- Menjalankan event menangkap ikan
        end
    end
end

local function toggleAutoCatch()
    isAutoCatchActive = not isAutoCatchActive
    print("Auto Catch: " .. (isAutoCatchActive and "ON" or "OFF"))
    if isAutoCatchActive then
        task.spawn(autoCatch)
    end
end

-- Auto Cast Script
local isAutoCastActive = false

local function toggleAutoCast()
    isAutoCastActive = not isAutoCastActive
    print("Auto Cast: " .. (isAutoCastActive and "ON" or "OFF"))
    local castEvent = game:GetService("ReplicatedStorage"):FindFirstChild("CastRod")
    if isAutoCastActive and castEvent then
        castEvent:FireServer()
    end
end

-- Auto Shake Script
local isAutoShakeActive = false

local function autoShake()
    print("Auto Shake toggled: " .. tostring(isAutoShakeActive))
    while isAutoShakeActive do
        task.wait(0.5) -- Delay untuk menghindari spam
        local shakeEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ShakeRod")
        if shakeEvent then
            shakeEvent:FireServer() -- Menggoyangkan pancing otomatis
        end
    end
end

local function toggleAutoShake()
    isAutoShakeActive = not isAutoShakeActive
    print("Auto Shake: " .. (isAutoShakeActive and "ON" or "OFF"))
    if isAutoShakeActive then
        task.spawn(autoShake)
    end
end

-- Instant Reel Script
local isInstantReelActive = false

local function toggleInstantReel()
    isInstantReelActive = not isInstantReelActive
    print("Instant Reel: " .. (isInstantReelActive and "ON" or "OFF"))
    local reelEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ReelFish")
    if isInstantReelActive and reelEvent then
        reelEvent:FireServer()
    end
end

-- UI TOYKECE Menu Fishing
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AutoCatchButton = Instance.new("TextButton")
local AutoCastButton = Instance.new("TextButton")
local AutoShakeButton = Instance.new("TextButton")
local InstantReelButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Size = UDim2.new(0, 300, 0, 350)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Text = "TOYKECE - Fishing Menu"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20

AutoCatchButton.Parent = MainFrame
AutoCatchButton.Text = "Auto Catch: OFF"
AutoCatchButton.Size = UDim2.new(0.8, 0, 0, 40)
AutoCatchButton.Position = UDim2.new(0.1, 0, 0.3, 0)
AutoCatchButton.BackgroundColor3 = Color3.fromRGB(70, 100, 200)
AutoCatchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoCatchButton.Font = Enum.Font.SourceSans
AutoCatchButton.TextSize = 18

AutoCastButton.Parent = MainFrame
AutoCastButton.Text = "Auto Cast: OFF"
AutoCastButton.Size = UDim2.new(0.8, 0, 0, 40)
AutoCastButton.Position = UDim2.new(0.1, 0, 0.45, 0)
AutoCastButton.BackgroundColor3 = Color3.fromRGB(100, 200, 70)
AutoCastButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoCastButton.Font = Enum.Font.SourceSans
AutoCastButton.TextSize = 18

AutoShakeButton.Parent = MainFrame
AutoShakeButton.Text = "Auto Shake: OFF"
AutoShakeButton.Size = UDim2.new(0.8, 0, 0, 40)
AutoShakeButton.Position = UDim2.new(0.1, 0, 0.6, 0)
AutoShakeButton.BackgroundColor3 = Color3.fromRGB(200, 100, 70)
AutoShakeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoShakeButton.Font = Enum.Font.SourceSans
AutoShakeButton.TextSize = 18

InstantReelButton.Parent = MainFrame
InstantReelButton.Text = "Instant Reel: OFF"
InstantReelButton.Size = UDim2.new(0.8, 0, 0, 40)
InstantReelButton.Position = UDim2.new(0.1, 0, 0.75, 0)
InstantReelButton.BackgroundColor3 = Color3.fromRGB(255, 150, 50)
InstantReelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InstantReelButton.Font = Enum.Font.SourceSans
InstantReelButton.TextSize = 18

AutoCatchButton.MouseButton1Click:Connect(function()
    toggleAutoCatch()
    AutoCatchButton.Text = "Auto Catch: " .. (isAutoCatchActive and "ON" or "OFF")
    AutoCatchButton.BackgroundColor3 = isAutoCatchActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(70, 100, 200)
end)

AutoCastButton.MouseButton1Click:Connect(function()
    toggleAutoCast()
    AutoCastButton.Text = "Auto Cast: " .. (isAutoCastActive and "ON" or "OFF")
    AutoCastButton.BackgroundColor3 = isAutoCastActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 200, 70)
end)

AutoShakeButton.MouseButton1Click:Connect(function()
    toggleAutoShake()
    AutoShakeButton.Text = "Auto Shake: " .. (isAutoShakeActive and "ON" or "OFF")
    AutoShakeButton.BackgroundColor3 = isAutoShakeActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 100, 70)
end)

InstantReelButton.MouseButton1Click:Connect(function()
    toggleInstantReel()
    InstantReelButton.Text = "Instant Reel: " .. (isInstantReelActive and "ON" or "OFF")
    InstantReelButton.BackgroundColor3 = isInstantReelActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 150, 50)
end)
