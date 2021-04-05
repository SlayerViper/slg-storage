repeat wait() until game:IsLoaded()
--old-antitp bypass
if workspace:FindFirstChild("CCoff") then
    game:GetService("Workspace").CCoff:Destroy()
end
--antiafk
local VirtualUser=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
	warn("anti-afk")
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)
--variables
local player = game.Players.LocalPlayer
function toTarget(pos, targetPos, targetCFrame)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/getgenv().speed, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        local tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(90))})
        tween:Play()
    end)
    if not tween then return err end
end

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback
local partname

--UI Lib Loading

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/main/library.lua"))()
local scorpion = library.new("Scorpion Hub | SlayerViper#3097 /UD", 5013109572)

--Themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),
TextColor = Color3.fromRGB(255, 255, 255)
}

--First Page
local page = scorpion:addPage("Main", 5012544693)
local autofarmspd
getgenv().speed = 500

page:addSliderS("Teleport Speed", 500, 100, 1000, function(autofarmspeed)
		autofarmspd = autofarmspeed
		getgenv().speed = autofarmspd
	end)

--Two Page
local page2 = scorpion:addPage("Autofarm", 5012544693)
local Farm = page2:addSection("Auto Farm")
local EFarm = page2:addSection("Event Farm")

local function callback(Text)
	if Text == "Yes" then
		toTarget(player.Character.HumanoidRootPart.Position,partname.Part.Position,CFrame.new(game:GetService("Workspace")[partname].Part.Position))
	elseif Text == "No" then
		print("false")
	end
end

	local autofarm
	Farm:addToggle("Auto Farm", nil, function(bool)
		autofarm = bool
	end)

	local eventfarm
	EFarm:addToggle("Event Farm", nil, function(bool)
		eventfarm = bool
      
      if eventfarm == true then
        game.Workspace.ChildAdded:Connect(function(added)
	     print(added,"Part Added")
	
	     partname = added
	
	     game.StarterGui:SetCore("SendNotification", {
	     	Title = "Part Added! (Random Name = Easter Egg)";
	     	Text = "Part Name:", added;
	     	Icon = "";
	     	Duration = 5;
	     	Button1 = "Yes";
	     	Button2 = "No";
	     	Callback = NotificationBindable;
	     })
       end)
         
      end
	end)

EFarm:addButton("if not send notify (teleport egg)", function()
	player.Character:WaitForChild("HumanoidRootPart").Position = partname.Position
	scorpion:Notify("Scorpion Hub", "Teleported!")
end)

--Three page
local page5 = scorpion:addPage("Discord", 5012544693)
local Discord = page5:addSection("SlayerShop")

Discord:addButton("Copy Discord Link", function()
    setclipboard("https://discord.gg/q8ppJ8D")
	scorpion:Notify("Scorpion Hub", "Link Copied!")
end)
    
-- Settings page
local settings = scorpion:addPage("Settings", 5012544693)
local colors = settings:addSection("Colors")
local setting = settings:addSection("Settings")
local ServerS = settings:addSection("Server")
	
setting:addKeybind("Show/Hide Settings", Enum.KeyCode.Backquote, function()
print("Activated Keybind")
scorpion:toggle()
end, function()
print("Changed Keybind")
end)

setting:addButton("Destroy GUI",function()
    game.CoreGui["Scorpion Hub | SlayerViper#3097 /UD"]:Destroy() 
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
