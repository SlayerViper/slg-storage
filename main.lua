repeat wait() until game:IsLoaded()

--variables
local player = game.Players.LocalPlayer
SelectedItem = "Feather"
SelectedItem2 = "Feather"
select1 = false
select2 = false
Items = {}

for i,v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
    if v.Name == "DraggableItems" then
        for i,v1 in pairs(v:GetChildren()) do
            if v1.ClassName == "MeshPart" or v1.ClassName == "Part" then
                table.insert(Items,v1.Title.Value)
            end
        end
    end
end

--UI Lib Loading
local ScorpionName = "Scorpion Hub | SlayerViper#3097 /SS"


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/main/library.lua"))()
local scorpion = library.new(ScorpionName, 5013109572)

--Themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),
TextColor = Color3.fromRGB(255, 255, 255)
}

--First page

local page1 = scorpion:addPage("AutoFarm", 5012544693)
local StrengthSec = page1:addSection("Strength")
local EnergySec = page1:addSection("Energy")

local StrengthBool = false
local EnergyTakeBool = false
local EnergyFinishBool = false

local EnergyActive1Bool = false
local EnergyActive2Bool = false

StrengthSec:addToggle("AutoFarm", nil, function(bool)
	StrengthBool = bool
end)



EnergySec:addDropdown("Select Item #1",Items,function(SI1)
	print("Selected: " .. SI1)
	SelectedItem = SI1
end)

EnergySec:addToggle("Active Item #1", true, function(bool)
	EnergyActive1Bool = bool
end)

EnergySec:addDropdown("Select Item #2",Items,function(SI2)
	print("Selected: " .. SI2)
	SelectedItem2 = SI2
end)

EnergySec:addToggle("Active Item #2", nil, function(bool)
	EnergyActive2Bool = bool
end)

EnergySec:addToggle("Auto Take Item", nil, function(bool)
	EnergyTakeBool = bool
end)

EnergySec:addToggle("Auto Finish", nil, function(bool)
	EnergyFinishBool = bool
end)


--Two page
local page2 = scorpion:addPage("AutoBuy", 5012544693)
local RebirthSec = page2:addSection("Rebirth")
local RebirthBool

RebirthSec:addToggle("Rebirth", nil, function(bool)
	RebirthBool = bool
end)


--Three page
local page3 = scorpion:addPage("Misc", 5012544693)
local OtherSec = page3:addSection("Others")

local AntiAfk

--local WalkSpeedBool
--local walkspeedd
--getgenv().WalkSpeed = 50

--[[
OtherSec:addToggle("Walkspeed", nil, function(bool)
    WalkSpeedBool = bool 

    if WalkSpeedBool == true then
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = walkspeedd
        else
        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 50
    end
end)

OtherSec:addSliderS("WalkSpeed", 50, 50, 300, function(autofarmspeed)
	walkspeedd = autofarmspeed
	getgenv().WalkSpeed = walkspeedd
end)
--]]

OtherSec:addToggle("Anti Afk", nil, function(bool)
    AntiAfk = bool
end)

OtherSec:addButton("Delete Doors",function()
    for i,v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
        if string.find(v.Name,"Exit") then
            v:Destroy()
        end
    end
end)

OtherSec:addButton("Be Smaller",function()
    while wait() do
        pcall(function()
            for i,v in pairs(game:GetService("Workspace")[game.Players.LocalPlayer.Name].Humanoid:GetChildren()) do
                if v.ClassName == "NumberValue" then
                    v.Value = 0.5
                end
            end
        end)
    end
end)
    
-- Settings page
local settings = scorpion:addPage("Settings", 5012544693)
local colors = settings:addSection("Colors")
local setting = settings:addSection("Settings")
local ServerS = settings:addSection("Server")
local Discord = settings:addSection("SlayerShop")
	
setting:addKeybind("Show/Hide Settings", Enum.KeyCode.Q, function()
print("Activated Keybind")
scorpion:toggle()
end, function()
print("Changed Keybind")
end)

Discord:addButton("Copy Discord Link", function()
    setclipboard("https://discord.gg/slayershop")
	scorpion:Notify("Scorpion Hub", "Link Copied!")
end)

setting:addButton("Destroy GUI",function()
    game.CoreGui[ScorpionName]:Destroy() 
end)

ServerS:addButton("Rejoin Server",function()
    game:GetService('TeleportService'):Teleport(game.PlaceId, player)
end)

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
scorpion:setTheme(theme, color3)
end)
end

-- load
scorpion:SelectPage(scorpion.pages[1], true) -- no default for more freedom

-- System Scripts

while wait() do
    if EnergyTakeBool == true then
        local a,b = pcall(function()
            for i,v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    if v.Parent.Parent.Parent.Name == "DraggableItems" then
                        if select1 == true then
                            if v.Parent.Parent.Title.Value == SelectedItem then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,0))
                                wait(.1)
                                fireproximityprompt(v,0)
                                fireproximityprompt(v,1)
                            end
                        end

                        if select2 == true then
                            if v.Parent.Parent.Title.Value == SelectedItem2 then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0,0,0))
                                wait(.1)
                                fireproximityprompt(v,0)
                                fireproximityprompt(v,1)
                            end
                        end
                    end
                end
            end
        end)
        --print(a,b)
    end
    
    if EnergyFinishBool == true then
        local a,b = pcall(function()
            for i,v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
                if v.ClassName == "StringValue" then
                    if select1 == true then
                        if v.Value == SelectedItem then
                            if v.Parent.Parent.Name == "DraggableItems" then
                                if v.Parent.Parent.Parent:FindFirstChild("Goal") then
                                    for i,v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                        for i,v1 in pairs(v:GetDescendants()) do
                                            if v1.ClassName == "Part" then
                                            v1:Destroy()
                                            end
                                        end
                                    end

                                    for i,v1 in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                        if v1.ClassName == "MeshPart" then
                                            v1.CFrame = CFrame.new(v.Parent.Parent.Parent.Goal.CFrame.Position + Vector3.new(0,0,0))
                                        end
                                    end
                                else
                                    if v.Parent.Parent.Parent:FindFirstChild("BlackWhiteTileTexture") then
                                        for i,v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                            for i,v1 in pairs(v:GetDescendants()) do
                                                if v1.ClassName == "Part" then
                                                    v1:Destroy()
                                                end
                                            end
                                        end

                                        for i,v1 in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                            if v1.ClassName == "MeshPart" then
                                                v1.CFrame = CFrame.new(v.Parent.Parent.Parent.BlackWhiteTileTexture.CFrame.Position + Vector3.new(0,0,0))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if select2 == true then
                        if v.Value == SelectedItem2 then
                            if v.Parent.Parent.Name == "DraggableItems" then
                                if v.Parent.Parent.Parent:FindFirstChild("Goal") then
                                    for i,v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                        for i,v1 in pairs(v:GetDescendants()) do
                                            if v1.ClassName == "Part" then
                                                v1:Destroy()
                                            end
                                        end
                                    end

                                    for i,v1 in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                        if v1.ClassName == "MeshPart" then
                                            v1.CFrame = CFrame.new(v.Parent.Parent.Parent.Goal.CFrame.Position + Vector3.new(0,0,0))
                                        end
                                    end
                                else
                                    if v.Parent.Parent.Parent:FindFirstChild("BlackWhiteTileTexture") then
                                        for i,v in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                            for i,v1 in pairs(v:GetDescendants()) do
                                                if v1.ClassName == "Part" then
                                                    v1:Destroy()
                                                end
                                            end
                                        end

                                        for i,v1 in pairs(game:GetService("Workspace").PlayerDraggables[game.Players.LocalPlayer.UserId]:GetChildren()) do
                                            if v1.ClassName == "MeshPart" then
                                                v1.CFrame = CFrame.new(v.Parent.Parent.Parent.BlackWhiteTileTexture.CFrame.Position + Vector3.new(0,0,0))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
        --print(a,b)
    end
    
    spawn(function()
        local t = game:GetService("ReplicatedStorage").StrongMan_UpgradeStrength

        if StrengthBool == true then
            t:InvokeServer()
        end
    end)
    
    spawn(function()
        if RebirthBool == true then
            game:GetService("ReplicatedStorage").StrongMan_Rebirth:FireServer()
        end
    end)
    
    spawn(function()
        if AntiAfk == true then
            local bb=game:service'VirtualUser'
            bb:CaptureController()
            bb:ClickButton2(Vector2.new())
        end
    end)
end
