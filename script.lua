-- ================================================
--                   KEN HUB
-- ================================================

-- Notification Header
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "KEN HUB",
        Text = "Successfully loaded Emote Picker!",
        Icon = "rbxassetid://6023426926",
        Duration = 5
    })
end)

-- Execute Emote Picker Script
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"))()

-- Rename GUI Title to KEN HUB (if present)
task.spawn(function()
    local CoreGui = game:GetService("CoreGui")
    local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    
    task.wait(1)
    for _, gui in ipairs({CoreGui, PlayerGui}) do
        for _, desc in ipairs(gui:GetDescendants()) do
            if desc:IsA("TextLabel") and (desc.Text:find("Emote") or desc.Text:find("7yd7")) then
                desc.Text = "KEN HUB - Emote Picker"
            end
        end
    end
end)
