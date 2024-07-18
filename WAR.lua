local profile = {};
local Settings = {
    -- Put job local settings here
    DualWield = false
};

-- Loads in common sets and functionality to all jobs
local Common = gFunc.LoadFile('Common.lua');

local sets = {
    LockStyle = {
        Head = 'Voyager sallet',
        Body = 'Haubergeon',
        Hands = 'Ryl.Sqr. Mufflers',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Bounding Boots'
    },

    Idle_Priority = {
        Ammo = {'Bomb Core'},
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
        Ammo = {'Bomb Core'},
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
        Ammo = {'Bomb Core'},
        Head = {'Voyager sallet', 'Empress Hairpin'},
        Neck = {'Spike Necklace'},
        Ear1 = {'Bushinomimi'},
        Body = {
            'Hecatomb Harness', 'Haubergeon', 'Alumine Haubert', 'Wonder Kaftan'
        },
        Hands = {'Wonder Mitts'},
        Ring1 = {'Ruby Ring', 'Sun Ring', 'Courage Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Waist = {'Warwolf Belt', 'Brave belt'},
        Legs = {
            'Warrior\'s Cuisses', 'Ryl.Kgt. Breeches', 'Alumine Brayettes',
            'Wonder Braccae'
        },
        Feet = {'Fighter\'s Calligae', 'Wonder clomps'}
    },

    WSAcc_Priority = {
        Ammo = {'Bomb Core'},
        Head = {'Voyager sallet', 'Empress Hairpin'},
        Neck = {'Peacock Amulet'},
        Ear1 = {'Bushinomimi'},
        Body = {
            'Hecatomb Harness', 'Haubergeon', 'Scorpion Harness',
            'Alumine Haubert', 'Wonder Kaftan'
        },
        Hands = ('Wonder Mitts'),
        Ring1 = {'Ruby Ring', 'Sun Ring', 'Courage Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Waist = {'Warwolf Belt', 'Life belt', 'Brave belt'},
        Legs = {
            'Warrior\'s Cuisses', 'Ryl.Kgt. Breeches', 'Alumine Brayettes',
            'Wonder Braccae'
        },
        Feet = {'Fighter\'s Calligae', 'Wonder clomps'}
    },

    WSDex = {
        Ammo = {'Bomb Core'},
        Head = {'Voyager sallet', 'Empress Hairpin'},
        Neck = {'Spike Necklace'},
        Ear1 = {'Bushinomimi'},
        Body = {
            'Hecatomb Harness', 'Haubergeon', 'Alumine Haubert', 'Wonder Kaftan'
        },
        Hands = {'Wonder Mitts'},
        Ring1 = {'Balance Ring'},
        Ring2 = {'Rajas Ring', 'Balance Ring'},
        Waist = {'Warwolf Belt', 'Life belt'},
        Legs = {
            'Byakko\'s Haidate', 'Ryl.Kgt. Breeches', 'Alumine Brayettes',
            'Wonder Braccae'
        },
        Feet = {'Fighter\'s Calligae', 'Wonder clomps'}
    },

    Charm = {Head = 'Noble\'s Ribbon', Ring1 = 'Hope ring', Ring2 = 'Hope ring'},

    DualWield_Priority = {
        Main = {
            'Maneater', 'Tabarzin', 'Fransisca', 'Darksteel axe', 'Viking axe',
            'Barbaroi axe', 'Tomahawk'
        },
        Sub = {
            'Joyeuse', 'Darksteel axe', 'Viking axe', 'Mythril axe', 'Tomahawk'
        },
        Ear1 = {'Stealth earring', 'Spike earring'},
        Ear2 = {'Brutal earring', 'Spike earring'}
    },

    TwoHander_Priority = {
        Main = {'Byakko\'s axe', 'Demon\'s axe', 'Leucous voulge'},
        Sub = '',
        Ear1 = {'Attila\'s earring', 'Spike earring'},
        Ear2 = {'Brutal earring', 'Bushinomimi', 'Spike earring'}
    }
};
profile.Sets = sets

profile.Packer = {};

local function ChangeSub(Job)
    if Job == "NIN" then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
        Settings.DualWield = true;
    else
        Settings.DualWield = false;
    end

    if Job == "SAM" then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
    elseif Job == "THF" then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 3');
    end
    gFunc.Message(string.format('Dual Wield mode %s.',
                                Settings.DualWield and 'enabled' or 'disabled'));
    gFunc.LockStyle(sets.LockStyle);
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
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
        return;
    end

    -- Toggles DualWield setting. In-game use "/lac fwd DualWield" to toggle the setting.
    if (string.lower(args[1]) == 'dualwield') then
        Settings.DualWield = not Settings.DualWield;
        gFunc.Message(string.format('Dual Wield mode %s.',
                                    Settings.DualWield and 'enabled' or
                                        'disabled'));
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

    -- Handles subjob changes
    local player = gData.GetPlayer();
    if (player.SubJob ~= 'NON' and player.SubJob ~= Common.Settings.SubJob) then
        ChangeSub(player.SubJob);
        Common.Settings.SubJob = player.SubJob;
    end

    -- Handles player status, Helm, and Craft settings
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    else
        gFunc.EquipSet(sets.Idle);

        if Common.Settings.Staves then
            gFunc.Equip('main', Common.ElementalStaffTable['Earth']);
        end

        Common.HandleAketon();

        if Common.Settings.Helm then gFunc.EquipSet(Common.Sets.Helm); end
        if Common.Settings.Fish then gFunc.EquipSet(Common.Sets.Fish); end
        if Common.Settings.Craft then gFunc.EquipSet(Common.Sets.Craft); end
    end

    -- Handles weapons
    if (Settings.DualWield) then
        gFunc.EquipSet(sets.DualWield);
    else
        gFunc.EquipSet(sets.TwoHander);
    end
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Charm') then gFunc.EquipSet(sets.Charm); end
end

profile.HandleItem = function() local item = gData.GetAction(); end

profile.HandlePrecast = function() end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (Common.SupportedSpells:contains(spell.Name)) then
        Common.HandleMidcast(spell);
    end
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
