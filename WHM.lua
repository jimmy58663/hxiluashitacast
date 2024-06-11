local profile = {};
local Settings = {
	--Put job local settings here
};

--Loads in common sets and functionality to all jobs
local Common = gFunc.LoadFile('Common.lua');

local sets = {
	LockStyle = {
	
	},
	
	--Default set that will be worn
	Idle_Priority = {
		Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Carpenter\'s Apron',
        Hands = 'Dream Mittens +1',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
        Waist = 'Friar\'s Rope',
        Legs = '',
        Feet = 'Dream Boots +1',
	},
	
	--Set that is worn while engaged with an enemy
	Tp_Priority = {
		Head = 'Silver Hairpin',
        Neck = 'Justice Badge',
        Ear1 = 'Onyx Earring',
        Ear2 = 'Onyx Earring',
        Body = 'Carpenter\'s Apron',
        Hands = 'Dream Mittens +1',
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
        Waist = 'Friar\'s Rope',
        Legs = '',
        Feet = 'Dream Boots +1',
	},
	
	--Set that is used while resting
	Resting = {},
	
	--Set that is used for weapon skills
	WS_Priority = {},
}
profile.Sets = sets

profile.Packer = {
};

local function ChangeSub(Job)
	--[[if Job == "WHM" then
		AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2');
	end--]]
	--gFunc.LockStyle(sets.LockStyle);
end

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
	
	AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
	AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
	
	local player = gData.GetPlayer();
	if player.SubJob ~= Common.Settings.SubJob then
		ChangeSub(player.SubJob);
		Common.Settings.SubJob = player.SubJob;
	end
	
	Common.Settings.Staves = true;
	local environment = gData.GetEnvironment();
	Common.Settings.Zone = environment.Area;
	
	--gFunc.LockStyle(sets.LockStyle);
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
	--Fowards handling to common command handler
	if ((string.lower(args[1]) == 'helm') or (string.lower(args[1]) == 'craft') or (string.lower(args[1]) == 'fish') or (string.lower(args[1]) == 'staves')) then
		Common.HandleCommand(args);
	end
end

profile.HandleDefault = function()
	--Handles level sync gear
	local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
	if (myLevel ~= Common.Settings.CurrentLevel) then
		gFunc.EvaluateLevels(profile.Sets, myLevel);
		Common.Settings.CurrentLevel = myLevel;
	end
	
	--Handles subjob changes
	local player = gData.GetPlayer();
	if player.SubJob ~= Common.Settings.SubJob then
		ChangeSub(player.SubJob);
		Common.Settings.SubJob = player.SubJob;
	end
	
	--Handles player status, Helm, and Craft settings
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
		
		if Common.Settings.Helm then
			gFunc.EquipSet(Common.Sets.Helm);
		end
		if Common.Settings.Fish then
			gFunc.EquipSet(Common.Sets.Fish);
		end
		if Common.Settings.Craft then
			gFunc.EquipSet(Common.Sets.Craft);
		end
    end
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
end

profile.HandleItem = function()
	local item = gData.GetAction();
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
	local weather = gData.GetEnvironment();
	local spell = gData.GetAction();
	local target = gData.GetActionTarget();
	local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
	
	if (Common.SupportedSpells:contains(spell.Name)) then
		Common.HandleMidcast(spell);
	end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
	local ws = gData.GetAction();
	gFunc.EquipSet(sets.WS);
end

return profile;