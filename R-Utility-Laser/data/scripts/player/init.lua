-- Howling Whispers R-Utility Laser
-- Player init extension: attach the one-shot starter grant script.

if onServer() then
    local player = Player()
    if player then
        player:addScriptOnce("player/hw_rutility_starter.lua")
    end
end
