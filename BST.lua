local profile = {};
local Settings = {
    PostCast = false, -- Setting to handle aftercast actions
    Gaudy = false, -- Setting to handle Gaudy Harness Idle
    Rune = false -- Setting to handle Rune Axes
};

-- Loads in common sets and functionality to all jobs
local Common = gFunc.LoadFile('Common.lua');

local sets = {
    LockStyle = {
        Main = 'Maneater',
        Head = 'Panther Mask',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens'
    },

    Idle_Priority = {
        Head = {
            'Panther Mask', 'Celata', 'Voyager sallet', 'Empress Hairpin',
            'Noble\'s Ribbon'
        },
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Spike Earring', 'Beetle Earring +1'},
        Ear2 = {'Spike Earring', 'Beetle Earring +1'},
        Body = {
            'Haubergeon', 'Scorpion Harness', 'Alumine Haubert',
            'Wonder Kaftan', 'Beetle harness +1'
        },
        Hands = {
            'Thick Mufflers', 'Ryl.Sqr. Mufflers', 'Wonder Mitts',
            'Ryl.Ftm. Gloves'
        },
        Ring1 = {'Toreador\'s Ring', 'Jaeger Ring', 'Balance Ring'},
        Ring2 = {'Rajas Ring', 'Balance Ring'},
        Back = {'Amemet Mantle +1'},
        Waist = {'Swift belt', 'Life belt', 'Tilt Belt', 'Warrior\'s Belt +1'},
        Legs = {
            'Byakko\'s Haidate', 'Ryl.Kgt. Breeches', 'Alumine Brayettes',
            'Republic Subligar', 'Brass Subligar'
        },
        Feet = {'Thick Sollerets', 'Bounding Boots'}
    },

    Tp_Priority = {
        Head = {
            'Panther Mask', 'Celata', 'Voyager sallet', 'Empress Hairpin',
            'Noble\'s Ribbon'
        },
        Neck = {'Peacock Amulet', 'Spike Necklace'},
        Ear1 = {'Spike Earring', 'Beetle Earring +1'},
        Ear2 = {'Spike Earring', 'Beetle Earring +1'},
        Body = {
            'Haubergeon', 'Scorpion Harness', 'Alumine Haubert',
            'Wonder Kaftan', 'Beetle harness +1'
        },
        Hands = {
            'Dusk Gloves', 'Thick Mufflers', 'Ryl.Sqr. Mufflers',
            'Wonder Mitts', 'Ryl.Ftm. Gloves'
        },
        Ring1 = {'Toreador\'s Ring', 'Jaeger Ring', 'Balance Ring'},
        Ring2 = {'Rajas Ring', 'Balance Ring'},
        Back = {'Amemet Mantle +1'},
        Waist = {'Swift belt', 'Life belt', 'Tilt Belt', 'Warrior\'s Belt +1'},
        Legs = {
            'Byakko\'s Haidate', 'Ryl.Kgt. Breeches', 'Alumine Brayettes',
            'Republic Subligar', 'Brass Subligar'
        },
        Feet = {'Dusk Ledelsens', 'Thick Sollerets', 'Bounding Boots'}
    },

    Resting = {},

    WS_Priority = {
        Head = {'Voyager sallet'},
        Neck = 'Spike Necklace',
        Ear1 = {'Bushinomimi'},
        Body = {
            'Hecatomb Harness', 'Haubergeon', 'Alumine Haubert', 'Wonder Kaftan'
        },
        Hands = {'Ogre gloves', 'Wonder Mitts'},
        Ring1 = {'Ruby Ring', 'Sun Ring', 'Courage Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Waist = {'Warwolf Belt', 'Brave belt'},
        Legs = {'Ryl.Kgt. Breeches', 'Alumine Brayettes', 'Wonder Braccae'},
        Feet = 'Wonder clomps'
    },

    WSAcc_Priority = {
        Head = {'Voyager sallet', 'Empress Hairpin'},
        Neck = 'Peacock Amulet',
        Ear1 = {'Bushinomimi'},
        Body = {
            'Hecatomb Harness', 'Haubergeon', 'Scorpion Harness',
            'Alumine Haubert', 'Wonder Kaftan'
        },
        Hands = {'Ogre gloves', 'Wonder Mitts'},
        Ring1 = {'Ruby Ring', 'Sun Ring', 'Courage Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Waist = {'Warwolf Belt', 'Life belt', 'Brave belt'},
        Legs = {
            'Byakko\'s Haidate', 'Ryl.Kgt. Breeches', 'Alumine Brayettes',
            'Wonder Braccae'
        },
        Feet = {'Wonder clomps'}
    },

    Charm = {
        Head = 'Beast Helm',
        Neck = 'Flower Necklace',
        Ear1 = 'Melody Earring',
        Ear2 = 'Melody Earring',
        Body = 'Beast Jackcoat',
        Hands = 'Beast Gloves',
        Ring1 = {'Angel\'s Ring', 'Moon Ring', 'Hope ring'},
        Ring2 = {'Angel\'s Ring', 'Moon Ring', 'Hope ring'},
        Waist = 'Corsette',
        Legs = 'Beast trousers',
        Feet = 'Beast Gaiters'
    },

    PetReady = {Head = 'Shep. Bonnet'},

    Reward_Priority = {
        Ammo = {
            'Pet Food Zeta', 'Pet Fd. Epsilon', 'Pet Food Delta',
            'Pet Fd. Gamma', 'Pet Food Beta', 'Pet Food Alpha'
        },
        Body = 'Beast Jackcoat',
        Hands = 'Ogre gloves',
        Feet = 'Beast Gaiters'
    },

    Precast = {
        Hands = 'Dusk Gloves',
        Waist = 'Swift belt',
        Feet = 'Dusk Ledelsens'
    }
};
profile.Sets = sets

profile.Packer = {};

local function ChangeSub(Job)
    --[[if Job == "WHM" then
		AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
	end--]]
    gFunc.LockStyle(sets.LockStyle);
end

local function HandlePetAction(PetAction) gFunc.EquipSet(sets.PetReady); end

local function PostCast()
    local player = gData.GetPlayer();
    if ((Common.Settings.SubJob == 'WHM' or Common.Settings.SubJob == 'RDM' or
        Common.Settings.SubJob == 'BLM') and player.MP < 50) then
        Settings.Gaudy = true;
    elseif (Common.Settings.SubJob ~= 'WHM' or Common.Settings.SubJob ~= 'RDM' or
        Common.Settings.SubJob ~= 'BLM' or player.MP >= 50) then
        Settings.Gaudy = false;
    end
    Settings.PostCast = false;
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 9');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    local player = gData.GetPlayer();
    if player.SubJob ~= Common.Settings.SubJob then
        ChangeSub(player.SubJob);
        Common.Settings.SubJob = player.SubJob;
    end

    local environment = gData.GetEnvironment();
    Common.Settings.Zone = environment.Area;

    gFunc.LockStyle(sets.LockStyle);
end

profile.OnUnload = function() end

profile.HandleCommand = function(args)
    -- Fowards handling to common command handler
    if ((string.lower(args[1]) == 'helm') or (string.lower(args[1]) == 'craft') or
        (string.lower(args[1]) == 'fish') or (string.lower(args[1]) == 'staves')) then
        Common.HandleCommand(args);
    end

    -- Toggles Rune setting. In-game use "/lac fwd Rune" to toggle the setting.
    if (string.lower(args[1]) == 'rune') then
        Settings.Rune = not Settings.Rune;
        gFunc.Message(string.format('Rune Axe mode %s.',
                                    Settings.Rune and 'enabled' or 'disabled'));
        return;
    end
end

profile.HandleDefault = function()
    -- Handles level sync gear
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Common.Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Common.Settings.CurrentLevel = myLevel;
    end

    local pet = gData.GetPet();
    local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end

    -- Handles subjob changes
    local player = gData.GetPlayer();
    if (player.SubJob ~= 'NON' and player.SubJob ~= Common.Settings.SubJob) then
        ChangeSub(player.SubJob);
        Common.Settings.SubJob = player.SubJob;
    end

    -- Handles player status, Helm, and Craft settings
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);

        if (Settings.Rune) then gFunc.Equip('Body', 'Gaudy Harness'); end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        if Common.Settings.Staves then
            gFunc.Equip('main', Common.ElementalStaffTable['Dark']);
        end
    else
        gFunc.EquipSet(sets.Idle);
        if (Settings.Gaudy or Settings.Rune) then
            gFunc.Equip('Body', 'Gaudy Harness');
        end

        if Common.Settings.Staves then
            gFunc.Equip('main', Common.ElementalStaffTable['Earth']);
        end

        Common.HandleAketon();

        if Common.Settings.Helm then gFunc.EquipSet(Common.Sets.Helm); end
        if Common.Settings.Fish then gFunc.EquipSet(Common.Sets.Fish); end
        if Common.Settings.Craft then gFunc.EquipSet(Common.Sets.Craft); end
    end

    if (Settings.PostCast) then PostCast(); end
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
    if string.match(ability.Name, 'Reward') then
        gFunc.EquipSet(sets.Reward);
    elseif string.match(ability.Name, 'Charm') then
        gFunc.EquipSet(sets.Charm);
        if Common.Settings.Staves then
            gFunc.Equip('main', 'Light Staff');
        end
    elseif string.match(ability.Name, 'Tame') then
        gFunc.Equip('head', 'Beast Helm');
    elseif string.match(ability.Name, 'Call Beast') then
        gFunc.Equip('hands', 'Monster Gloves');
    end
end

profile.HandleItem = function() end

profile.HandlePrecast = function() gFunc.EquipSet(sets.Precast); end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (Common.SupportedSpells:contains(spell.Name)) then
        Common.HandleMidcast(spell);
    end

    Settings.PostCast = true;
end

profile.HandlePreshot = function() end

profile.HandleMidshot = function() end

profile.HandleWeaponskill = function()
    local ws = gData.GetAction();
    gFunc.EquipSet(sets.WS);

    if ws.Name == 'Rampage' then gFunc.EquipSet(sets.WSAcc); end

    -- WS Gorgets HorizonXI versions
    if Common.SoilGorgetTable:contains(ws.Name) then
        gFunc.Equip('Neck', 'Soil Gorget');
    end
end

return profile;
