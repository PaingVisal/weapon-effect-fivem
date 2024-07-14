Config = {}

Config.WeaponParticleEffects = {
    [`WEAPON_PISTOL`] = {
        { dict = "ltxlightbluefire_effect", name = "lightblue_fire", offset = {x = 0.0, y = -0.1, z = 0.0} },
        -- Add more particle effects for this weapon as needed
    },
    [`WEAPON_SMG`] = {
        { dict = "ltxorangefire_effect", name = "orange_fire", offset = {x = 0.0, y = -0.1, z = 0.0} },
        -- Add more particle effects for this weapon as needed
    }
    -- Add more weapons and their respective particle effects as needed
}

Config.BoneIndex = 0 -- Change this to the bone index of the weapon or where you want the particle effect
