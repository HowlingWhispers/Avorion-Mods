local RUtilityGenerator = {}

local function clamp01(value)
    if value < 0 then return 0 end
    if value > 1 then return 1 end
    return value
end

function RUtilityGenerator.create(seed, tech, rarity, material)
    tech = tech or 1
    rarity = rarity or Rarity(RarityType.Common)
    material = material or Material(MaterialType.Iron)

    local dps = Balancing_TechWeaponDPS(tech)
    local template = GenerateTurretTemplate(
        seed or random():createSeed(),
        WeaponType.RawMiningLaser,
        dps,
        tech,
        rarity,
        material
    )

    if not template then
        return nil
    end

    local weapons = {template:getWeapons()}
    template:clearWeapons()

    for _, weapon in pairs(weapons) do
        -- Keep the proven raw-mining behavior, then add raw-metal conversion
        -- and hull-focused utility so manual mining + salvaging both work.
        weapon.name = "R-Utility Laser /* Weapon Name */"%_t
        weapon.prefix = "R-Utility /* Weapon Prefix */"%_t
        weapon.icon = "data/textures/icons/mining-laser.png"

        weapon.stoneRawEfficiency = clamp01(math.max(weapon.stoneRawEfficiency or 0, 0.55))
        weapon.metalRawEfficiency = clamp01(math.max(weapon.metalRawEfficiency or 0, 0.45))

        weapon.hullDamageMultiplier = math.max(weapon.hullDamageMultiplier or 1, 7.5)
        weapon.shieldDamageMultiplier = 0

        template:addWeapon(weapon)
    end

    template.title = "Iron R-Utility Turret /* Turret Title */"%_t
    template.flavorText = "Howling Whispers prototype: mines stone and salvages metal."%_t
    template:updateStaticStats()

    return template
end

function RUtilityGenerator.createStarter(seed)
    return RUtilityGenerator.create(
        seed,
        1,
        Rarity(RarityType.Common),
        Material(MaterialType.Iron)
    )
end

return RUtilityGenerator
