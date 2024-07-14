-- Function to load particle dictionary
function loadParticleDict(dict)
    RequestNamedPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        Wait(0)
    end
end

-- Function to start particle effects for a weapon
function startParticleEffects()
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)

    -- Check if the weapon has configured particle effects
    if Config.WeaponParticleEffects[weapon] then
        for _, effect in ipairs(Config.WeaponParticleEffects[weapon]) do
            -- Load particle dictionary
            loadParticleDict(effect.dict)

            -- Get weapon bone index
            local boneIndex = GetPedBoneIndex(ped, 57005) -- 57005 is the bone index for the weapon

            -- Play particle effect at the specified offset
            UseParticleFxAssetNextCall(effect.dict)
            StartParticleFxNonLoopedOnEntity(
                effect.name, 
                ped, 
                0.0, -- X offset
                effect.offset.y, -- Y offset (typically negative to be behind the weapon)
                effect.offset.z, -- Z offset
                0.0, 0.0, 0.0, -- Rotation offsets
                1.0, -- Scale
                false, -- Axis related
                false, -- Axis related
                false -- Unk
            )
        end
    end
end

-- Command to test particle effects
RegisterCommand('particleeffects', function()
    startParticleEffects()
end, false)

-- Optionally, you can trigger the particle effects when a weapon is fired
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsPedShooting(PlayerPedId()) then
            startParticleEffects()
        end
    end
end)
