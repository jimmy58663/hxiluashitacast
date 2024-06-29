local Common = T {};

Common.Settings = T {
    CurrentLevel = 0, -- Setting for Level Sync detection
    SubJob = '', -- Setting for subjob detection to change macros
    Helm = false, -- Setting for toggling Field Set over your idle set
    Craft = false, -- Setting for toggling Craft Set over your idle set
    Fish = false, -- Setting for toggling Fishing set over your idle set
    Zone = '', -- Setting for zone detection with Nation Aketons
    Staves = false -- Setting for toggling elemental staff usage
}

Common.ElementalStaffTable = {
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Dark Staff'
}

Common.SoilGorgetTable = T {
    'Asuran Fists', 'Stringing Pummel', 'Dancing Edge', 'Evisceration',
    'Mercy Stroke', 'Pyrrhic Kleos', 'Viper Bite', 'Wasp Sting', 'Aeolian Edge',
    'Extenerator', 'Expiacion', 'Fast Blade', 'Savage Blade', 'Seraph Blade',
    'Shining Blade', 'Switch Blade', 'Vorpal Blade', 'Requiescat',
    'Crescent Moon', 'Hard Slash', 'Sickle Moon', 'Resolution', 'Avalanche Axe',
    'Calamity', 'Primal Rend', 'Rampage', 'Onslaught', 'Spinning Axe',
    'Iron Tempest', 'King\'s Justice', 'Sturmwind', 'Fell Cleave',
    'Catastrophe', 'Nightmare Scythe', 'Slice', 'Spinning Scythe',
    'Spiral Hell', 'Vorpal Scythe', 'Entropy', 'Impulse Drive', 'Sonic Thrust',
    'Stardiver', 'Blade: Ku', 'Blade: Retsu', 'Blade: Ten', 'Blade: Hi',
    'Tachi: Enpi', 'Tachi: Jinpu', 'Tachi: Rana', 'Omniscience', 'Retribution',
    'Shattersoul', 'Leaden Salute', 'Trueflight', 'Wildfire'
}

Common.AquaGorgetTable = T {
    'Shoulder Tackle', 'Shijin Spiral', 'Mordant Rime', 'Pyrrhic Kleos',
    'Shadowstitch', 'Rudra\'s Storm', 'Atonement', 'Circle Blade',
    'Death Blossom', 'Expiacion', 'Ground Strike', 'Shockwave', 'Decimation',
    'Primal Rend', 'Smash Axe', 'Ruinator', 'Full Break', 'Raging Rush',
    'Steel Cyclone', 'Sturmwind', 'Cross Reaper', 'Dark Harvest',
    'Shadow of Death', 'Spinning Scythe', 'Spiral Hell', 'Quietus', 'Entropy',
    'Geirskogul', 'Vorpal Thrust', 'Blade: Teki', 'Blade: Yu', 'Tachi: Gekko',
    'Tachi: Koki', 'Tachi: Fudo', 'Brainshaker', 'Skullbreaker',
    'Garland of Bliss', 'Gate of Tartarus', 'Retribution', 'Starburst',
    'Sunburst', 'Vidohunir', 'Namas Arrow', 'Piercing Arrow', 'Sidewinder',
    'Refulgent Arrow', 'Slug Shot', 'Split Shot', 'Last Stand'
}

Common.LightGorgetTable = T {
    'Ascetic\'s Fury', 'Final Heaven', 'Howling Fist', 'Victory Smite',
    'Shijin Spiral', 'Evisceration', 'Mandalic Stab', 'Atonement',
    'Chant du Cygne', 'Knights of Round', 'Power Slash', 'Scourge',
    'Torcleaver', 'Decimation', 'Mistral Axe', 'Metatron Torment',
    'Ukko\'s Fury', 'Upheaval', 'Insurgency', 'Vorpal Scythe',
    'Camlann\'s Torment', 'Double Thrust', 'Drakesbane', 'Raiden Thrust',
    'Skewer', 'Thunder Thrust', 'Vorpal Thrust', 'Wheeling Thrust',
    'Sonic Thrust', 'Blade: Chi', 'Blade: Ku', 'Blade: Rin', 'Blade: Shun',
    'Tachi: Enpi', 'Tachi: Goten', 'Tachi: Kaiten', 'Tachi: Kasha',
    'Tachi: Fudo', 'Hexa Strike', 'Garland of Bliss', 'Omniscience',
    'Arching Arrow', 'Blast Arrow', 'Dulling Arrow', 'Empyreal Arrow',
    'Flaming Arrow', 'Namas Arrow', 'Piercing Arrow', 'Sidewinder',
    'Refulgent Arrow', 'Jishnu\'s Radiance', 'Blast Shot', 'Detonator',
    'Heavy Shot', 'Hot Shot', 'Leaden Salute', 'Last Stand', 'Slug Shot',
    'Sniper Shot', 'Split Shot'
}

Common.SupportedSpells = T {'Sneak', 'Invisible'}

Common.Sets = T {
    Helm = {
        Body = 'Field tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Craft = {Body = 'Carpenter\'s apron', Hands = 'Carpenter\'s gloves'},

    Fish = {
        Range = 'Halcyon Rod',
        Ammo = 'Insect Ball',
        Body = 'Fsh. Tunica',
        Hands = 'Fsh. Gloves',
        Legs = 'Fisherman\'s Hose',
        Feet = 'Fisherman\'s Boots'
    },

    Aketon_Sandy = {Body = 'Kingdom Aketon'},

    Aketon_Bastok = {Body = 'Republic Aketon'},

    Aketon_Windy = {Body = 'Federation Aketon'},

    Aketon_All = {Body = 'Ducal Aketon'}
}

Common.HandleCommand = function(args)
    -- Toggles Helm setting. In-game use "/lac fwd Helm" to toggle the setting.
    if (string.lower(args[1]) == 'helm') then
        Common.Settings.Helm = not Common.Settings.Helm;
        gFunc.Message(string.format('Helm mode %s.', Common.Settings.Helm and
                                        'enabled' or 'disabled'));
        return;
    end

    -- Toggles Craft setting. In-game use "/lac fwd Craft" to toggle the setting.
    if (string.lower(args[1]) == 'craft') then
        Common.Settings.Craft = not Common.Settings.Craft;
        gFunc.Message(string.format('Craft mode %s.', Common.Settings.Craft and
                                        'enabled' or 'disabled'));
        return;
    end

    -- Toggles Fish setting. In-game use "/lac fwd Fish" to toggle the setting.
    if (string.lower(args[1]) == 'fish') then
        Common.Settings.Fish = not Common.Settings.Fish;
        gFunc.Message(string.format('Fish mode %s.', Common.Settings.Fish and
                                        'enabled' or 'disabled'));

        --[[if (Common.Settings.Fish) then
			gFunc.Disable('Range');
			gFunc.Disable('Ammo');
		else
			gFunc.Enable('Range');
			gFunc.Enable('Ammo');
		end--]]
        return;
    end

    -- Toggles Staves setting. In-game use "/lac fwd Staves" to toggle the setting.
    if (string.lower(args[1]) == 'staves') then
        Common.Settings.Staves = not Common.Settings.Staves;
        gFunc.Message(string.format('Ele Staff mode %s.',
                                    Common.Settings.Staves and 'enabled' or
                                        'disabled'));
        return;
    end
end

Common.HandleAketon = function(args)
    local environment = gData.GetEnvironment();
    if (environment.Area ~= nil) then
        if (environment.Area ~= Common.Settings.Zone) then
            Common.Settings.Zone = environment.Area;
        end
        if (string.contains(Common.Settings.Zone, 'San d\'Oria') or
            string.contains(Common.Settings.Zone, 'Chateau d\'Orag')) then
            -- gFunc.EquipSet(Common.Sets.Aketon_Sandy);
            gFunc.EquipSet(Common.Sets.Aketon_All);
        elseif (string.contains(Common.Settings.Zone, 'Bastok') or
            string.contains(Common.Settings.Zone, 'Metalwork')) then
            -- gFunc.EquipSet(Common.Sets.Aketon_Bastok);
            gFunc.EquipSet(Common.Sets.Aketon_All);
        elseif (string.contains(Common.Settings.Zone, 'Windurst') or
            string.contains(Common.Settings.Zone, 'Heavens Towe')) then
            -- gFunc.EquipSet(Common.Sets.Aketon_Windy);
            gFunc.EquipSet(Common.Sets.Aketon_All);
        elseif (string.contains(Common.Settings.Zone, 'Jeuno') or
            string.contains(Common.Settings.Zone, 'Lude Gardens')) then
            gFunc.EquipSet(Common.Sets.Aketon_All);
        end
    end
end

Common.HandleMidcast = function(spell)
    if (spell.Skill == 'Enhancing Magic') then
        if (string.contains(spell.Name, 'Sneak')) then
            gFunc.Equip('Feet', 'Dream Boots +1');
        elseif (string.contains(spell.Name, 'Invisible')) then
            gFunc.Equip('Hands', 'Dream Mittens +1');
        end
    end
end

return Common
