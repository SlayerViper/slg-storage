local player = game.Players.LocalPlayer
local database = {'N3mes1s_Nyks','franklin19415'}
local groupid = {123456,6884747}

local shindo = {4616652839,4601350214,5447073001,5084678830,5431071837,5431069982,5943874201,5824792748}
local ud = {54865335,339152995,248366681,964167023,627471495}

local nTitle
local nText

function startLoad(nPlayer)
	for _,group in pairs(groupid) do
		for _,plr in pairs(database) do
			if player:IsInGroup(group) then 
				guiLoader()
			elseif plr == player.Name then
				guiLoader()
			else
				nTitle = "Whitelist Notify" nText = "You not Whitelisted!" SendNotify()
			end
		end
	end
end

function guiLoader()
    for i,shindoo in pairs(shindo) do
    	for i,udd in pairs(ud) do
			if game.PlaceId == shindoo then 
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/scorpionhub/main.lua", true))()
			elseif game.PlaceId == udd then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/scorpionhubforud/main.lua", true))()
			else
				nTitle = "Game List Notify" nText = "This game has not been added to the list!" SendNotify()
			end
		end
	end
end

function SendNotify()
	game.StarterGui:SetCore("SendNotification", {
	     	Title = nTitle;
	     	Text = nText;
	     	Icon = "";
	     	Duration = 5;
	})
end

startLoad()
