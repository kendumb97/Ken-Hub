-- ================================================
--                   KEN HUB
-- ================================================

-- Replace 'YOUR_ROBLOX_IMAGE_ID_HERE' with your actual Roblox Asset ID (e.g., 123456789)
local KEN_HUB_IMAGE_ID = "rbxassetid://6023426926" 

-- Notification Header
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "KEN HUB",
        Text = "Successfully loaded KEN HUB Emote Picker!",
        Icon = KEN_HUB_IMAGE_ID,
        Duration = 5
    })
end)

-- Execute Original Emote Picker Script
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"))()

-- Rebrand UI Text & Images to KEN HUB
task.spawn(function()
    local CoreGui = game:GetService("CoreGui")
    local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    task.wait(1.5) -- Wait for 7yd7 GUI to fully load
    
    for _, gui in ipairs({CoreGui, PlayerGui}) do
        for _, desc in ipairs(gui:GetDescendants()) do
            -- Rename UI Titles
            if desc:IsA("TextLabel") and (desc.Text:find("Emote") or desc.Text:find("7yd7")) then
                desc.Text = "KEN HUB - Emote Picker"
            end
            
            -- Replace Icons/Logos with KEN HUB Image
            if desc:IsA("ImageLabel") or desc:IsA("ImageButton") then
                desc.Image = KEN_HUB_IMAGE_ID
            end
        end
    end
end)
