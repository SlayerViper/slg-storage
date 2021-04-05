local restricted = true
local loaded = true
local player = game.Players.LocalPlayer
local database = {'Player Name'}
local groupid = {123456,6884747}

local shindo = {4616652839,4601350214,5447073001,5084678830,5431071837,5431069982,5943874201,5824792748}
local ud = {54865335,339152995,248366681,964167023,627471495}

function IsAllowed(player)
	if restricted then
		for i,v in pairs(groupid) do
			if player:IsInGroup(v) then return true end
		end
		return false
	else
		return true
	end
end

if loaded then
    if (not IsAllowed(player)) then return end
	
    	for i,shindoo in pairs(shindo) do
		if game.PlaceId == shindoo then 
			loadstring(game:HttpGet("https://raw.githubusercontent.com/SlayerViper/storage/scorpionhub/main", true))()
		elseif game.PlaceId == ud then
			print("Coming Soon")
		end
	end
	
	
	
end
   
