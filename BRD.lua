local profile = {};
local Settings = {
    Ballad = 'wind', -- Setting for toggling Ballad to wind or string instruments
    Lullaby = 'wind', -- Setting for toggling Lullaby to wind or string instruments
    PostCast = false, -- Setting to handle aftercast actions
    Gaudy = false, -- Setting to handle Gaudy Harness Idle
    Minstrel = true -- Setting to toggle use of minstrel ring hp sets
};

local Common = gFunc.LoadFile('Common.lua');

local sets = {
    LockStyle = {
        Main = 'Joyeuse',
        Range = 'Royal Spearman\'s horn',
        Head = 'Opo-opo Crown',
        Body = 'Sha\'ir Manteel',
        Hands = 'Seiryu\'s Kote',
        Legs = 'Bard\'s Cannions',
        Feet = 'Choral Slippers'
    },

    Idle_Priority = {
        -- Main = 'Brass Xiphos',
        Range = 'Ryl.Spr. Horn',
        Head = {
            'Bard\'s Roundlet', 'Opo-opo Crown', 'Silver hairpin',
            'Noble\'s ribbon'
        },
        Neck = 'Flower Necklace',
        Ear1 = {'Melody Earring', 'Onyx earring'},
        Ear2 = {'Magnetic Earring', 'Melody Earring', 'Onyx earring'},
        Body = {
            'Sha\'ir Manteel', 'Bard\'s Jstcorps', 'Choral Jstcorps',
            'Gaudy Harness', 'Wonder kaftan', 'Beetle harness'
        },
        Hands = {'Chl. Cuffs +1', 'Wonder mitts'},
        Ring1 = {'Astral Ring', 'Hope ring'},
        Ring2 = {'Astral Ring', 'Hope ring'},
        Back = {'Bard\'s Cape', 'Jester\'s Cape'},
        Waist = {'Gleeman\'s Belt', 'Corsette', 'Friar\'s rope'},
        Legs = {
            'Bard\'s Cannions', 'Choral Cannions', 'Wonder braccae',
            'Black Slacks'
        },
        Feet = {'Errant Pigaches', 'Choral slippers', 'Wonder Clomps'}
    },

    Tp_Priority = {
        -- Main = 'Brass Xiphos',
        Range = 'Frenzy Fife',
        Head = {
            'Bard\'s Roundlet', 'Opo-opo Crown', 'Silver hairpin',
            'Noble\'s ribbon'
        },
        Neck = {'Peacock Amulet', 'Flower Necklace'},
        Ear1 = {'Melody Earring', 'Onyx earring'},
        Ear2 = {'Magnetic Earring', 'Melody Earring', 'Onyx earring'},
        Body = {
            'Sha\'ir Manteel', 'Bard\'s Jstcorps', 'Choral Jstcorps',
            'Gaudy Harness', 'Wonder kaftan', 'Beetle harness'
        },
        Hands = {'Dusk Gloves', 'Wonder mitts'},
        Ring1 = {'Toreador\'s Ring', 'Jaeger Ring'},
        Ring2 = {'Rajas Ring'},
        Back = {'Bard\'s Cape', 'Jester\'s Cape'},
        Waist = {'Swift belt'},
        Legs = {
            'Byakko\'s Haidate', 'Choral Cannions', 'Wonder braccae',
            'Black Slacks'
        },
        Feet = {
            'Dusk Ledelsens', 'Errant Pigaches', 'Choral slippers',
            'Wonder Clomps'
        }
    },

    Resting = {},

    WS_Priority = {
        Range = 'Frenzy Fife',
        Neck = 'Spike Necklace',
        Ear1 = 'Bushinomimi',
        Body = {'Hecatomb Harness', 'Wonder kaftan'},
        Hands = 'Wonder mitts',
        Ring1 = {'Ruby Ring', 'Sun Ring', 'Courage Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Back = 'Amemet Mantle +1',
        Waist = {'Warwolf Belt', 'Brave belt'},
        Legs = 'Choral cannions',
        Feet = 'Wonder Clomps'
    },

    WSDex_Priority = {
        Range = 'Frenzy Fife',
        Head = 'Empress Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Bushinomimi',
        Body = {'Bard\'s Jstcorps', 'Hecatomb Harness', 'Wonder kaftan'},
        Hands = 'Wonder mitts',
        Ring1 = {'Ruby Ring', 'Sun Ring', 'Balance Ring'},
        Ring2 = {'Rajas Ring', 'Courage Ring'},
        Back = 'Amemet Mantle +1',
        Waist = {'Warwolf Belt', 'Life Belt'},
        Legs = {'Byakko\'s Haidate', 'Choral cannions'},
        Feet = 'Bounding Boots'
    },

    NinIdle_Priority = {
        Head = {'Bard\'s Roundlet', 'Opo-opo Crown'},
        Ear2 = {'Melody Earring'},
        Ring1 = {'Angel\'s Ring', 'Moon Ring', 'Hope Ring'},
        Ring2 = {'Angel\'s Ring', 'Moon Ring', 'Hope Ring'},
        Feet = {'Choral slippers'}
    },

    NinTp_Priority = {
        Ear2 = {'Melody Earring'},
        Ring1 = {'Angel\'s Ring', 'Moon Ring', 'Hope Ring'},
        Ring2 = {'Angel\'s Ring', 'Moon Ring', 'Hope Ring'}
    },

    Song_Skill = {Head = 'Bard\'s Roundlet', Hands = 'Chl. Cuffs +1'},

    Wind_Skill = {Body = 'Minstrel\'s Coat', Legs = 'Choral Cannions'},

    String_Skill = {Neck = 'String Torque', Body = 'Minstrel\'s Coat'},

    Minne = {Range = 'Harp +1'},

    Paeon_Priority = {Range = {'Ebony Harp +1', 'Harp +1'}},

    Minuet = {Range = 'Cornette +1'},

    Madrigal = {Range = 'Traversiere +1'},

    Threnody_Priority = {Range = 'Piccolo +1'},

    Mambo = {Range = 'Gemshorn +1'},

    March_Priority = {Range = {'Faerie Piccolo', 'Ryl.Spr. Horn'}},

    Requiem = {Range = 'Flute +1'},

    Etude = {Range = 'Rose harp +1'},

    Elegy_Priority = {Range = {'Horn +1', 'Ryl.Spr. Horn'}},

    Prelude = {Range = 'Angel\'s Flute +1'},

    Carol = {Range = 'Crumhorn +1'},

    Wind = {Range = 'Ryl.Spr. Horn'},

    Cure_Priority = {
        Ring1 = {'Astral Ring', 'Saintly ring'},
        Ring2 = {'Astral Ring', 'Saintly ring'}
    },

    Debuff_Priority = {
        Head = {'Bard\'s Roundlet', 'Opo-opo Crown', 'Noble\'s ribbon'},
        Ear1 = {'Melody Earring'},
        Ear2 = {'Melody Earring'},
        Neck = 'Flower Necklace',
        Ring1 = {'Angel\'s Ring', 'Moon Ring', 'Hope Ring'},
        Ring2 = {'Angel\'s Ring', 'Moon Ring', 'Hope Ring'},
        Waist = {'Gleeman\'s Belt', 'Corsette'},
        Legs = 'Bard\'s Cannions'
    },

    Stoneskin = {
        Neck = 'Justice Badge',
        Legs = 'Bard\'s Cannions',
        Feet = 'Errant Pigaches'
    },

    Precast = {},

    Song_Precast = {
        --[[ Taru /WHM 890 Base HP no merits, /NIN 908 Base HP no merits
			-- Ideal setup:
			Main = 'Chanter\'s Staff',
			Head = 'Genbu\'s Kabuto', -- +50 HP
			Back = 'Gigant Mantle', -- +80 HP
			Waist = 'Steppe Sash', -- +60 HP
		--]]
        -- /WHM HP 1113(834 = 75%).
        -- /NIN HP 1132(849 = 75%).
        Neck = 'Bloodbead Amulet',
        Body = 'Sha\'ir Manteel',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Bomb Queen Ring',
        -- Ring2 = {Name = 'Minstrel\'s Ring', Priority = -10},
        Ring2 = 'Minstrel\'s Ring',
        Back = 'Empwr. Mantle',
        Legs = 'Bard\'s Cannions',
        Feet = 'Root Sabots'
    },

    HPTrigger = {
        -- /WHM drops HP to 830 for Minstrel's ring trigger
        -- /NIN drops HP to 848 for Minstrel's ring trigger
        Neck = 'Flower Necklace', -- 0 HP
        Ear1 = 'Melody Earring', -- 0 HP
        Ear2 = 'Magnetic Earring', -- 0 HP
        Body = 'Sha\'ir Manteel', -- 0 HP
        Hands = 'Errant Cuffs', -- -20 HP
        Ring1 = 'Astral Ring', -- -25 HP
        Ring2 = 'Astral Ring', -- -25 HP
        Back = 'Bard\'s Cape', -- 0 HP
        Waist = 'Gleeman\'s Belt', -- 0 HP
        Legs = 'Bard\'s Cannions', -- 17 HP
        Feet = 'Errant Pigaches' -- -20 HP
    }
}
profile.Sets = sets

profile.Packer = {};

local function ChangeSub(Job)
    if Job == "WHM" then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
    elseif Job == "NIN" then
        AshitaCore:GetChatManager():QueueCommand(1, '/macro set 4');
    end
    gFunc.LockStyle(sets.LockStyle);
end

profile.OnLoad = function()
    gSettings.SpellOffset = 10; -- Fix for Prelude cast bar finishing before the song
    gSettings.AllowAddSet = true;

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 10');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');

    local player = gData.GetPlayer();
    if player.SubJob ~= Common.Settings.SubJob then
        ChangeSub(player.SubJob);
        Common.Settings.SubJob = player.SubJob;
    end

    Common.Settings.Staves = true;
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

    -- Toggles ballad to string or wind instrument
    if (string.lower(args[1]) == 'ballad') then
        if (Settings.Ballad == 'string') then
            Settings.Ballad = 'wind';
        elseif (Settings.Ballad == 'wind') then
            Settings.Ballad = 'string';
        end
        gFunc.Message(string.format('Ballad mode: %s.', Settings.Ballad));
    end

    -- Toggles lullaby to string or wind instrument
    if (string.lower(args[1]) == 'lullaby') then
        if (Settings.Lullaby == 'string') then
            Settings.Lullaby = 'wind';
        elseif (Settings.Lullaby == 'wind') then
            Settings.Lullaby = 'string';
        end
        gFunc.Message(string.format('Lullaby mode: %s.', Settings.Lullaby));
    end

    -- Toggles Minstrel setting. In-game use "/lac fwd Minstrel" to toggle the setting.
    if (string.lower(args[1]) == 'minstrel') then
        Settings.Minstrel = not Settings.Minstrel;
        gFunc.Message(string.format('Minstrel mode %s.', Settings.Minstrel and
                                        'enabled' or 'disabled'));
        return;
    end
end

local function PostCast()
    local player = gData.GetPlayer();
    if ((Common.Settings.SubJob == 'WHM' or Common.Settings.SubJob == 'RDM' or
        Common.Settings.SubJob == 'BLM') and player.MP < 50) then
        Settings.Gaudy = true
    elseif (Common.Settings.SubJob ~= 'WHM' or Common.Settings.SubJob ~= 'RDM' or
        Common.Settings.SubJob ~= 'BLM' or player.MP >= 50) then
        Settings.Gaudy = false
    end
    Settings.PostCast = false;
end

profile.HandleDefault = function()
    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Common.Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Common.Settings.CurrentLevel = myLevel;
    end

    local player = gData.GetPlayer();
    if (player.SubJob ~= Common.Settings.SubJob) then
        ChangeSub(player.SubJob);
        Common.Settings.SubJob = player.SubJob;
    end

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp);
        if Common.Settings.SubJob == 'NIN' then
            gFunc.EquipSet(sets.NinTp);
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        if Common.Settings.Staves then
            gFunc.Equip('main', Common.ElementalStaffTable['Dark']);
        end
    else
        gFunc.EquipSet(sets.Idle);

        if (Common.Settings.SubJob == 'NIN') then
            gFunc.EquipSet(sets.NinIdle);
        elseif (Settings.Gaudy) then
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

profile.HandleAbility = function() local ability = gData.GetAction(); end

profile.HandleItem = function() local item = gData.GetAction(); end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);

    if (spell.Skill == 'Singing') then
        if (Settings.Minstrel) then
            local player = gData.GetPlayer();
            if (player.HP > 834) then
                gFunc.ForceEquipSet(sets.HPTrigger);
            end
        end
        gFunc.EquipSet(sets.Song_Precast);
    end
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (Common.SupportedSpells:contains(spell.Name)) then
        Common.HandleMidcast(spell);
    else
        if (spell.Skill == 'Singing') then
            gFunc.EquipSet(sets.Song_Skill);

            if (string.contains(spell.Name, 'Paeon') or
                string.contains(spell.Name, 'Minne') or
                string.contains(spell.Name, 'Etude')) then
                gFunc.EquipSet(sets.String_Skill);
            else
                gFunc.EquipSet(sets.Wind_Skill);
            end

            if (string.contains(spell.Name, 'Paeon')) then
                gFunc.EquipSet(sets.Paeon);
            elseif (string.contains(spell.Name, 'Ballad')) then
                if (Settings.Ballad == 'string') then
                    gFunc.EquipSet(sets.String_Skill);
                    gFunc.EquipSet(sets.Paeon);
                elseif (Settings.Ballad == 'wind') then
                    gFunc.EquipSet(sets.Wind);
                end
            elseif (string.contains(spell.Name, 'Mazurka')) then
                gFunc.EquipSet(sets.Paeon);
            elseif (string.contains(spell.Name, 'Minne')) then
                gFunc.EquipSet(sets.Minne);
            elseif (string.contains(spell.Name, 'Minuet')) then
                gFunc.EquipSet(sets.Minuet);
            elseif (string.contains(spell.Name, 'Madrigal')) then
                gFunc.EquipSet(sets.Madrigal);
            elseif (string.contains(spell.Name, 'Threnody')) then
                gFunc.EquipSet(sets.Threnody);
            elseif (string.contains(spell.Name, 'Mambo')) then
                gFunc.EquipSet(sets.Mambo);
            elseif (string.contains(spell.Name, 'March')) then
                gFunc.EquipSet(sets.March);
            elseif (string.contains(spell.Name, 'Requiem')) then
                gFunc.EquipSet(sets.Requiem);
            elseif (string.contains(spell.Name, 'Etude')) then
                gFunc.EquipSet(sets.Etude);
            elseif (string.contains(spell.Name, 'Elegy')) then
                gFunc.EquipSet(sets.Elegy);
            elseif (string.contains(spell.Name, 'Prelude')) then
                gFunc.EquipSet(sets.Prelude);
            elseif (string.contains(spell.Name, 'Carol')) then
                gFunc.EquipSet(sets.Carol);
            else
                gFunc.EquipSet(sets.Wind);
            end

            -- Debuff requires CHR gear
            if (string.contains(spell.Name, 'Threnody') or
                string.contains(spell.Name, 'Elegy') or
                string.contains(spell.Name, 'Requiem') or
                string.contains(spell.Name, 'Lullaby')) then
                if string.contains(spell.Name, 'Lullaby') then
                    if Settings.Lullaby == 'string' then
                        gFunc.EquipSet(sets.Paeon);
                    elseif Settings.Lullaby == 'wind' then
                        gFunc.EquipSet(sets.Wind);
                    end
                end

                if Common.Settings.Staves then
                    gFunc.Equip('main',
                                Common.ElementalStaffTable[spell.Element]);
                end
                gFunc.EquipSet(sets.Debuff);
            end

        elseif (spell.Skill == 'Healing Magic') then
            if (string.contains(spell.Name, 'Cure') or
                string.contains(spell.Name, 'Curaga')) then
                gFunc.EquipSet(sets.Cure);
                if Common.Settings.Staves then
                    gFunc.Equip('main', Common.ElementalStaffTable['Light']);
                end
            end
        elseif (spell.Skill == 'Enhancing Magic') then
            if (string.contains(spell.Name, 'Stoneskin')) then
                gFunc.EquipSet(sets.Stoneskin);
            end
        end
    end
    Settings.PostCast = true;
end

profile.HandlePreshot = function() end

profile.HandleMidshot = function() end

profile.HandleWeaponskill = function()
    local ws = gData.GetAction();
    gFunc.EquipSet(sets.WS);

    local DexWSList = T {
        'Wasp Sting', 'Gust Slash', 'Viper Bite', 'Cyclone', 'Dancing Edge',
        'Shark Bite', 'Evisceration', 'Aeolian Edge', 'Mandalic Stab',
        'Rudra\'s Storm', -- Dagger
        'Shijin Spiral', -- H2H
        'Chant du Cygne', -- Sword
        'Dimidiation', -- Great Sword
        'Bora Axe', 'Onslaught', -- Axe
        'Geirskogul', -- Polearm
        'Blade: Retsu', 'Blade: Yu', 'Blade: Metsu', 'Blade: Shun', -- Katana
        'Jishnu\'s Radiance', -- Archery
        'Coronach' -- Marksmanship
    };

    if (DexWSList:contains(ws.Name)) then gFunc.EquipSet(sets.WSDex); end
end

return profile;
