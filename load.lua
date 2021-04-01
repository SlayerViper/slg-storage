local player = game.Players.LocalPlayer
local whitelist = {
   ["UserId"] = 1677188092;
   ["GroupId"] = 1782387;
}

local enable = false

for i, v in pairs(whitelist) do
   if i == "UserId" then
      if player.UserId == v then
         print("test")
         --enable = true
      end
   elseif i == "GroupId" then
      if player:IsInGroup(v) then
         print("test")
        --enable = true
      end
   end
end

--[[
if enable then
   LocalPlayer.PlayerGui:FindFirstChild("RadioComms").Enabled = true
end
--]]
