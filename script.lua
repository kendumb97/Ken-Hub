-- KEN HUB | Roblox Script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local ScrollFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local OpenBtn = Instance.new("TextButton")

ScreenGui.Name = "KenHubGui"
ScreenGui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

OpenBtn.Name = "OpenBtn"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
OpenBtn.BorderColor3 = Color3.fromRGB(255, 50, 50)
OpenBtn.BorderSizePixel = 2
OpenBtn.Position = UDim2.new(0.02, 0, 0.4, 0)
OpenBtn.Size = UDim2.new(0, 80, 0, 35)
OpenBtn.Font = Enum.Font.SourceSansBold
OpenBtn.Text = "KEN HUB"
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.TextSize = 14
OpenBtn.Visible = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderColor3 = Color3.fromRGB(255, 50, 50)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 260, 0, 320)
MainFrame.Active = true
MainFrame.Draggable = true

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(1, -30, 0, 35)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Text = "  KEN HUB - Emote Picker"
TitleLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Size = UDim2.new(0, 30, 0, 35)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16

ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 5, 0, 40)
ScrollFrame.Size = UDim2.new(1, -10, 1, -45)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
ScrollFrame.ScrollBarThickness = 5

UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 6)

local currentTrack = nil

local function playAnimation(animId)
	if currentTrack then
		currentTrack:Stop()
	end
	
	local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local hum = char:FindFirstChildOfClass("Humanoid")
	
	if hum then
		local anim = Instance.new("Animation")
		anim.AnimationId = "rbxassetid://" .. tostring(animId)
		currentTrack = hum:LoadAnimation(anim)
		currentTrack:Play()
	end
end

local function stopAnimation()
	if currentTrack then
		currentTrack:Stop()
		currentTrack = nil
	end
end

local function createButton(text, onClick)
	local btn = Instance.new("TextButton")
	btn.Parent = ScrollFrame
	btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	btn.BorderColor3 = Color3.fromRGB(60, 60, 60)
	btn.Size = UDim2.new(1, -5, 0, 30)
	btn.Font = Enum.Font.SourceSansSemibold
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(240, 240, 240)
	btn.TextSize = 14
	btn.MouseButton1Click:Connect(onClick)
	return btn
end

CloseButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	OpenBtn.Visible = false
end)

createButton("Stop Current Emote", function() stopAnimation() end)
createButton("Dance (R15)", function() playAnimation(507771019) end)
createButton("Floss Emote", function() playAnimation(10714340543) end)
createButton("Zombie Walk", function() playAnimation(616158094) end)
createButton("Stadium Emote", function() playAnimation(3338083108) end)
createButton("Tilt Emote", function() playAnimation(3338097257) end)
createButton("Point Emote", function() playAnimation(3338050165) end)
createButton("Wave Emote", function() playAnimation(128777973) end)
createButton("Cheer Emote", function() playAnimation(128777973) end)

LocalPlayer.CharacterAdded:Connect(function(newChar)
	Character = newChar
	Humanoid = newChar:WaitForChild("Humanoid")
end)
