-- namespace HWRUtilityStarter
HWRUtilityStarter = {}

local RUtilityGenerator = include("hw/rutilitygenerator")
local grantMarker = "howlingwhispers.rutilitylaser.starter.v1"
local starterCount = 4

function HWRUtilityStarter.initialize()
    if not onServer() then return end

    local player = Player()
    if not player then
        terminate()
        return
    end

    if player:getValue(grantMarker) then
        terminate()
        return
    end

    local inventory = player:getInventory()
    if not inventory then
        print("[R-Utility] Could not access inventory for player %s", player.name)
        terminate()
        return
    end

    local granted = 0

    for i = 1, starterCount do
        local turret = RUtilityGenerator.createStarter(random():createSeed())
        if turret then
            inventory:add(InventoryTurret(turret))
            granted = granted + 1
        end
    end

    if granted == starterCount then
        player:setValue(grantMarker, true)
        player:sendChatMessage("Howling Whispers", 0,
            "Starter equipment received: 4 Iron R-Utility Turrets.")
        print("[R-Utility] Granted %i starter turrets to %s", granted, player.name)
    else
        print("[R-Utility] Starter grant incomplete for %s: %i/%i", player.name, granted, starterCount)
    end

    terminate()
end
