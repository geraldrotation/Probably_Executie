ProbablyEngine.rotation.register_custom(71, "|cFFC79C6EExecutie Arms|r", {

-----------------------------------------------------------------------------------------------------------------------------
-- Hotkeys ------------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
	{ "pause", "modifier.lshift"}, 
	{ "6544", "modifier.lcontrol", "ground" }, -- Heroic Leap
-----------------------------------------------------------------------------------------------------------------------------
-- Queued Spells ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
	{ "!114207", "@cutie.checkQueue(114207)" }, -- Skull Banner
	{ "!871", "@cutie.checkQueue(871)" }, -- Shield Wall
	{ "!118038", "@cutie.checkQueue(118038)" }, -- Die by the Sword
	{ "!114203", "@cutie.checkQueue(114203)", "ground" }, -- Demo Banner
	{ "!97462", "@cutie.checkQueue(97462)" }, -- Rallying Cry
	{ "!46924", "@cutie.checkQueue(46924)" }, -- Bladestorm
	{ "!46968", "@cutie.checkQueue(46968)" }, -- Shockwave
	{ "!118000", "@cutie.checkQueue(118000)" }, -- Dragon Roar
	{ "!114028", "@cutie.checkQueue(114028)" }, -- Mass Spell Reflection
	{ "!114029", "@cutie.checkQueue(114029)", "focus" }, -- Safeguard on focus
	{ "!114030", "@cutie.checkQueue(114030)", "focus" }, -- Vigilance on focus
-----------------------------------------------------------------------------------------------------------------------------
-- Buffs -------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
	{ "18499", "!player.buff(12880)" }, -- Berserker Rage
	{ "18499", {"player.buff(12880).duration < 1", "player.spell(23881).cooldown > 1"} }, -- Berserker Rage
	{ "20572" }, -- Blood Fury
-----------------------------------------------------------------------------------------------------------------------------
-- Interrupts / Disarm ------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
	{{
    { "102060", { -- Shout if Pummel on CD
       "player.spell(6552).cooldown > 0",
    }},
    { "6552" }, -- Pummel
  }, "target.interruptAt(50)" },

	{ "676", "target.disarmable"}, -- Disarm
-----------------------------------------------------------------------------------------------------------------------------
-- Defensive Cooldowns ------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
  	--{ "34428" }, -- Victory Rush
  	{ "871", {"player.health < 25", "toggle.def"}}, -- Shield Wall
  	{ "118038", {"player.health < 35", "toggle.def"}}, -- Die by the Sword
  	{ "97462", {"player.health < 35", "toggle.def"}}, -- Rallying Cry
  	{ "!/run UseItemByName(5512)", "@cutie.Healthstone"}, --Healthstone
-- Stance Dance-------------------------------------------------------------------------------------------------------------- 
	{ "71", {
		"player.health <= 25",
        "player.seal != 2"
    }},
	{ "2457", {
		"player.health >= 26",
        "player.seal != 1"
    }},
-----------------------------------------------------------------------------------------------------------------------------
-- Offensive Cooldowns ------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
	--{ "107574", "modifier.cooldowns"}, -- Avatar
	--{ "1719", "modifier.cooldowns"}, -- Recklessness
	--{ "114207", {"modifier.cooldowns", "toggle.autobanner"}}, -- Skull Banner
	{{ 
		{"1719", "player.spell(86346).cooldown < 2"}, -- Reck
		{"1719", {"target.debuff(86346).duration >= 5"}},
		{"1719", "target.health < 20"},
		{"107574", "player.buff(1719)"}, -- Avatar
		{"114207", {"!player.buff(114206)", "player.spell(86346).cooldown < 2", "toggle.autobanner"}}, -- Skull Banner
		{"114207", {"!player.buff(114206)", "target.debuff(86346) >= 5", "toggle.autobanner"}},
		{"114207", {"!player.buff(114206)", "player.buff(1719)", "toggle.autobanner"}},
		{ "20572", "player.buff(1719)" }, -- Orc Racial
		{ "26297", "player.buff(1719)" }, -- Troll Racial
	}, "modifier.cooldowns"},
	{ "#gloves" },
-----------------------------------------------------------------------------------------------------------------------------
-- Main Rotation ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
	{"12292", "player.buff(12880)"}, -- BBath
--actions.single_target=heroic_strike,if=rage>115|(debuff.colossus_smash.up&rage>60&set_bonus.tier16_2pc_melee)
	{"78", "player.rage > 115"},
	{"78", {"target.debuff(86346)", "player.rage >= 60"}},
--actions.single_target+=/mortal_strike,if=dot.deep_wounds.remains<1.0|buff.enrage.down|rage<10
	{"12294", "target.debuff(115767).duration < 1"},
	{"12294", "!player.buff(12880)"},
	{"12294", "player.rage < 10"},
--actions.single_target+=/colossus_smash,if=debuff.colossus_smash.remains<1.0
	{"86346", "target.debuff(86346).duration < 1"},
--actions.single_target+=/mortal_strike
	{"12294"},
--actions.single_target+=/storm_bolt,if=enabled&debuff.colossus_smash.up
	{"107570", "target.debuff(86346)"},
--actions.single_target+=/dragon_roar,if=enabled&debuff.colossus_smash.down
	{"118000", {"!target.debuff(86346)", "target.spell(78).range"}},
--actions.single_target+=/execute,if=buff.sudden_execute.down|buff.taste_for_blood.down|rage>90|target.time_to_die<12
	{"5308", "!player.buff(139958)"},
	{"5308", "!player.buff(60503)"},
	{"5308", "player.rage > 90"},
--actions.single_target+=/slam,if=target.health.pct>=20&(stat.crit>25000|buff.recklessness.up)
	{"1464", {"target.health >= 20", "player.mcrit > 25000"}},
	{"1464", {"target.health >= 20", "player.buff(1719)"}},
--actions.single_target+=/overpower,if=target.health.pct>=20&rage<100|buff.sudden_execute.up
	{"7384", {"target.health >= 20", "player.rage < 100", "player.mcrit < 25000"}},
	{"7384", {"player.buff(139958)", "player.mcrit < 25000"}},
	--{"7384", {"player.buff(60503).count >= 3", "player.mcrit < 25000"}},
--actions.single_target+=/slam,if=target.health.pct>=20
	{"1464", {"target.health >= 20", "player.rage >= 40", "target.debuff(86346)"}},
	{"1464", {"target.health >= 20", "player.rage >= 80", "!target.debuff(86346)"}},
--actions.single_target+=/battle_shout
	{ "6673"},
--actions.single_target+=/heroic_throw
	{"57755"},
-----------------------------------------------------------------------------------------------------------------------------
-- Multitarget Rotation -------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
	{{ 
--actions.aoe=sweeping_strikes
	{"12328"},
	{"12292", "player.buff(12880)"}, -- BBath
--actions.aoe+=/cleave,if=rage>110&active_enemies<=4
	{"845", {"player.rage > 110", "modifier.enemies <= 4"}},
--actions.aoe+=/bladestorm,if=enabled&(buff.bloodbath.up|!talent.bloodbath.enabled)
	{ "46924", { "player.buff(12880)", "!player.spell(46924).exists"} },
	{ "46924", { "player.buff(12880)", "player.buff(12292)"} },
--actions.aoe+=/dragon_roar,if=enabled&debuff.colossus_smash.down
	{ "118000", {"!target.debuff(86346)", "player.buff(12880)", "!player.spell(46924).exists", "target.spell(78).range"} },
	{ "118000", {"!target.debuff(86346)", "player.buff(12880)", "player.buff(12292)", "target.spell(78).range"} },
--actions.aoe+=/colossus_smash,if=debuff.colossus_smash.remains<1
	{"86346", "target.debuff(86346).duration < 1"},	
--actions.aoe+=/thunder_clap,target=2,if=dot.deep_wounds.attack_power*1.1<stat.attack_power
	{"6343", "target.spell(78).range"},
--actions.aoe+=/mortal_strike,if=active_enemies=2|rage<50
	{"12294", "modifier.enemies = 2"},
	{"12294", "player.rage < 50"},
--actions.aoe+=/execute,if=buff.sudden_execute.down&active_enemies=2
	{"5308", {"!player.buff(139958)", "modifier.enemies = 2"}},
--actions.aoe+=/slam,if=buff.sweeping_strikes.up&debuff.colossus_smash.up
	{"1464", {"player.buff(12328)", "target.debuff(86346)"}},
--actions.aoe+=/overpower,if=active_enemies=2
	{"7384", "modifier.enemies = 2"},
--actions.aoe+=/slam,if=buff.sweeping_strikes.up
	{"1464", "player.buff(12328)"},
--actions.aoe+=/battle_shout
	{ "6673"},
	}, "modifier.multitarget"},
-----------------------------------------------------------------------------------------------------------------------------
-- OOC Hotkeys -------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
},	{
	{ "6544", "modifier.lcontrol", "ground" }, -- Heroic Leap
	},
-----------------------------------------------------------------------------------------------------------------------------
-- Custom Toggle ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
function()
ProbablyEngine.toggle.create(
    'def',
    'Interface\\Icons\\ability_warrior_shieldwall.png‎',
    'Defensive CDs Toggle',
	'Enable or Disable usage of Defensive Cooldowns')
ProbablyEngine.toggle.create(
    'autobanner',
    'Interface\\Icons\\warrior_skullbanner.png‎',
    'Auto Skull Banner',
	'Enable or Disable Auto Skull Banner\nUse /arma qSkullb if disabled')
end)