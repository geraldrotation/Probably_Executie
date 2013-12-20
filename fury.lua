ProbablyEngine.rotation.register_custom(72, "|cFFC79C6EExecutie Fury|r", {

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
	{ "18499", {"player.buff(12880).duration < 1", "spell.cooldown(23881) > 1"} }, -- Berserker Rage
	--{ "20572" }, -- Blood Fury
-----------------------------------------------------------------------------------------------------------------------------
-- Interrupts / Disarm ------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
	{ "6552", "modifier.interrupts" }, -- Pummel
	{ "102060", "modifier.interrupts" }, -- Disrupting Shout
	{ "676", "modifier.interrupts"}, -- Disarm
-----------------------------------------------------------------------------------------------------------------------------
-- Defensive Cooldowns ------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
  	{ "103840" }, -- Impending Victory
  	{ "34428" }, -- Victory Rush
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
		{"1719", "spell.cooldown(86346) < 2"}, -- Reck
		{"1719", {"target.debuff(86346).duration >= 5"}},
		{"1719", "target.health < 20"},
		{"107574", "player.buff(1719)"}, -- Avatar
		{"114207", {"!player.buff(114206)", "spell.cooldown(86346) < 2", "toggle.autobanner"}}, -- Skull Banner
		{"114207", {"!player.buff(114206)", "target.debuff(86346) >= 5", "toggle.autobanner"}},
		{"114207", {"!player.buff(114206)", "player.buff(1719)", "toggle.autobanner"}},
		{ "20572", "player.buff(1719)" }, -- Orc Racial
		{ "26297", "player.buff(1719)" }, -- Troll Racial
	}, "modifier.cooldowns"},
-----------------------------------------------------------------------------------------------------------------------------
-- Main Rotation ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
{{ 
--actions.single_target=bloodbath,if=enabled&(cooldown.colossus_smash.remains<2|debuff.colossus_smash.remains>=5|target.time_to_die<=20)
	{"12292", "spell.cooldown(86346) < 2"},
	{"12292", "target.debuff(86346).duration >= 5"},
--actions.single_target+=/heroic_strike,if=((debuff.colossus_smash.up&rage>=40)&target.health.pct>=20)|rage>=100&buff.enrage.up
	{{
		{"78", {"target.debuff(86346)", "player.rage >= 40"}},
	}, "target.health <= 20" },
	{"78", {"player.rage >= 90", "player.buff(12880)"}},
--actions.single_target+=/storm_bolt,if=enabled&buff.cooldown_reduction.up&debuff.colossus_smash.up
	{"107570", "target.debuff(86346)"},
--actions.single_target+=/raging_blow,if=buff.raging_blow.stack=2&debuff.colossus_smash.up&target.health.pct>=20
	{"85288", {"player.buff(131116).count = 2", "target.debuff(86346)", "target.health >= 20"}},
--actions.single_target+=/bloodthirst,if=!(target.health.pct<20&debuff.colossus_smash.up&rage>=30&buff.enrage.up)
	{ "23881" },
--actions.single_target+=/wild_strike,if=buff.bloodsurge.react&target.health.pct>=20&cooldown.bloodthirst.remains<=1
	{"100130", {"player.buff(46916)", "target.health >= 20", "spell(233881).cooldown <= 1"}},
--actions.single_target+=/wait,sec=cooldown.bloodthirst.remains,if=!(target.health.pct<20&debuff.colossus_smash.up&rage>=30&buff.enrage.up)&cooldown.bloodthirst.remains<=1&cooldown.bloodthirst.remains
--actions.single_target+=/dragon_roar,if=enabled&(!debuff.colossus_smash.up&(buff.bloodbath.up|!talent.bloodbath.enabled))
	{"118000", "!target.debuff(86346)"},
--actions.single_target+=/colossus_smash
	{"86346"},
--actions.single_target+=/execute,if=debuff.colossus_smash.up|rage>70|target.time_to_die<12
	{"5308", "target.debuff(86346)"},
	{"5308", "player.rage > 60"},
--actions.single_target+=/raging_blow,if=target.health.pct<20|buff.raging_blow.stack=2|(debuff.colossus_smash.up|(cooldown.bloodthirst.remains>=1&buff.raging_blow.remains<=3))
	{"85288", "target.health < 20"},
	{"85288", "player.buff(131116).count = 2"},
	{"85288", "target.debuff(86346)"},
	{"85288", "spell.cooldown(23881) >= 1"},
--actions.single_target+=/bladestorm,if=enabled
	--{"46924"},
--actions.single_target+=/wild_strike,if=buff.bloodsurge.up
	{ "100130", "player.buff(46915)" },
--actions.single_target+=/raging_blow,if=cooldown.colossus_smash.remains>=3
	{"85288", "spell.cooldown(86346) >= 3"},
--actions.single_target+=/heroic_throw,if=debuff.colossus_smash.down&rage<60
	{ "57755", {"!target.debuff(86346)", "player.rage < 50"} },
--actions.single_target+=/battle_shout,if=rage<70&!debuff.colossus_smash.up
	{ "6673", "player.rage < 50" },
--actions.single_target+=/wild_strike,if=debuff.colossus_smash.up&target.health.pct>=20
	{ "100130", {"target.debuff(86346)", "target.health >= 20"} },
--actions.single_target+=/wild_strike,if=cooldown.colossus_smash.remains>=2&rage>=70&target.health.pct>=20
	{ "100130", {"spell.cooldown(86346) >= 2", "target.health >= 20", "player.rage >= 60"} },
--actions.single_target+=/impending_victory,if=enabled&target.health.pct>=20&cooldown.colossus_smash.remains>=2
	{ "103840", {"target.health >= 20", "spell.cooldown(86346) >= 2"}},
}, {"!toggle.twotargets", "!toggle.threetargets", "!toggle.fourplustargets"}},
-----------------------------------------------------------------------------------------------------------------------------
-- 2 Target Rotation -------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
	{{ 
--actions.two_targets=bloodbath,if=enabled&buff.enrage.up
		{"12292", "player.buff(12880)"},
--actions.two_targets+=/cleave,if=(rage>=60&debuff.colossus_smash.up)|rage>90
		{"845", {"player.rage >= 50", "target.debuff(86346)"}},
		{"845", "player.rage > 90"},
--actions.two_targets+=/dragon_roar,if=enabled&(!debuff.colossus_smash.up&(buff.bloodbath.up|!talent.bloodbath.enabled))
		--{"118000",{"!target.debuff(86346)","player.spell(12292).exists", "player.buff(12292)"}},
		--{"118000",{"!target.debuff(86346)","!player.spell(12292).exists"}},
--actions.two_targets+=/bladestorm,if=enabled&buff.enrage.up&(buff.bloodbath.up|!talent.bloodbath.enabled)
		--{"46924", {"player.buff(12880)", "!player.spell(12292).exists"}},
		--{"46924", {"player.buff(12880)", "player.spell(12292).exists", "player.buff(12292)"}},
--actions.two_targets+=/colossus_smash
		{"86346"},
--actions.two_targets+=/bloodthirst,if=!(target.health.pct<20&debuff.colossus_smash.up&rage>=30&buff.enrage.up)
		{ "23881"},
--actions.two_targets+=/storm_bolt,if=enabled&debuff.colossus_smash.up
		{"107570", "target.debuff(86346)"},
--actions.two_targets+=/execute,if=debuff.colossus_smash.up
		{"5308", "target.debuff(86346)"},
--actions.two_targets+=/raging_blow,if=buff.meat_cleaver.up|target.health.pct<20
		{"85288", "player.buff(85739)"},
		{"85288", "target.health < 20"},
--actions.two_targets+=/whirlwind,if=!buff.meat_cleaver.up
		{"1680", "!player.buff(85739)"},
--actions.two_targets+=/battle_shout,if=rage<70
		{ "6673", "player.rage < 50" },
--actions.two_targets+=/heroic_throw
		{ "57755"},
	}, "toggle.twotargets"},
-----------------------------------------------------------------------------------------------------------------------------
-- 3 Target Rotation -------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
	{{ 
--actions.three_targets=bloodbath,if=enabled&buff.enrage.up
		{"12292", "player.buff(12880)"},
--actions.three_targets+=/cleave,if=(rage>=60&debuff.colossus_smash.up)|rage>90
		{"845", {"player.rage >= 50", "target.debuff(86346)"}},
		{"845", "player.rage > 90"},
--actions.three_targets+=/dragon_roar,if=enabled&(!debuff.colossus_smash.up&(buff.bloodbath.up|!talent.bloodbath.enabled))
		--{"118000",{"!target.debuff(86346)","player.spell(12292).exists", "player.buff(12292)"}},
		--{"118000",{"!target.debuff(86346)","!player.spell(12292).exists"}},
--actions.three_targets+=/bladestorm,if=enabled&buff.enrage.up&(buff.bloodbath.up|!talent.bloodbath.enabled)
		--{"46924", {"player.buff(12880)", "!player.spell(12292).exists"}},
		--{"46924", {"player.buff(12880)", "player.spell(12292).exists", "player.buff(12292)"}},
--actions.three_targets+=/colossus_smash
		{"86346"},
--actions.three_targets+=/storm_bolt,if=enabled&debuff.colossus_smash.up
		{"107570", "target.debuff(86346)"},
--actions.three_targets+=/raging_blow,if=buff.meat_cleaver.stack=2
		{"85288", "player.buff(85739).count = 2"},
--actions.three_targets+=/bloodthirst,cycle_targets=1,if=!dot.deep_wounds.ticking
		{ "23881"},
--actions.three_targets+=/whirlwind
		{"1680"},
--actions.three_targets+=/raging_blow
		{"85288"},
--actions.three_targets+=/battle_shout,if=rage<70
		{ "6673", "player.rage < 50" },
--actions.three_targets+=/heroic_throw
		{ "57755"},
	}, "toggle.threetargets"},
-----------------------------------------------------------------------------------------------------------------------------
-- 4+ Target Rotation -------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
	{{ 
--actions.aoe=bloodbath,if=enabled&buff.enrage.up
		{"12292", "player.buff(12880)"},
--actions.aoe+=/cleave,if=rage>110
		{"845", "player.rage > 100"},
--actions.aoe+=/dragon_roar,if=enabled&debuff.colossus_smash.down&(buff.bloodbath.up|!talent.bloodbath.enabled)
		--{"118000",{"!target.debuff(86346)","player.spell(12292).exists", "player.buff(12292)"}},
		--{"118000",{"!target.debuff(86346)","!player.spell(12292).exists"}},
--actions.aoe+=/bladestorm,if=enabled&buff.enrage.up&(buff.bloodbath.up|!talent.bloodbath.enabled)
		--{"46924", {"player.buff(12880)", "!player.spell(12292).exists"}},
		--{"46924", {"player.buff(12880)", "player.spell(12292).exists", "player.buff(12292)"}},
--actions.aoe+=/storm_bolt,if=enabled&debuff.colossus_smash.up
		{"107570", "target.debuff(86346)"},
--actions.aoe+=/bloodthirst,cycle_targets=1,if=!dot.deep_wounds.ticking&buff.enrage.down
		{ "23881", "!player.buff(12880)"},
--actions.aoe+=/raging_blow,if=buff.meat_cleaver.stack=3
		{"85288", "player.buff(85739).count = 3"},
--actions.aoe+=/whirlwind
		{"1680"},
--actions.aoe+=/bloodthirst,cycle_targets=1,if=!dot.deep_wounds.ticking
		{ "23881"},
--actions.aoe+=/colossus_smash
		{"86346"},
--actions.aoe+=/battle_shout,if=rage<70
		{ "6673", "player.rage < 50" },
	}, "toggle.fourplustargets"},
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
ProbablyEngine.toggle.create(
    'twotargets',
    'Interface\\Icons\\ability_warrior_cleave.png‎',
    '2 Target Rotation',
	'Enable or Disable 2 Target Rotation')
ProbablyEngine.toggle.create(
    'threetargets',
    'Interface\\Icons\\ability_whirlwind.png‎',
    '3 Target Rotation',
	'Enable or Disable 3 Target Rotation')
ProbablyEngine.toggle.create(
    'fourplustargets',
    'Interface\\Icons\\ability_warrior_bladestorm.png‎',
    '4+ Target Rotation',
	'Enable or Disable 4+ Target Rotation')
end)