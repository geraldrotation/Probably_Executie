if not cutie then cutie = {} end

--Melee Crit Rating
ProbablyEngine.condition.register("mcrit",function() 		
	local mcritvalue = GetCombatRating(CR_CRIT_MELEE)
	return mcritvalue
end)
--Range Crit Rating
ProbablyEngine.condition.register("rcrit",function() 		
	local rcritvalue = GetCombatRating(CR_CRIT_RANGED)
	return rcritvalue
end)
--Spell Crit Rating
ProbablyEngine.condition.register("scrit",function() 		
	local scritvalue = GetCombatRating(CR_CRIT_SPELL)
	return scritvalue
end)

--Melee Haste Rating
ProbablyEngine.condition.register("mhaste",function() 		
	local mhastevalue = GetCombatRating(CR_HASTE_MELEE)
	return mhastevalue
end)
--Range Haste Rating
ProbablyEngine.condition.register("rhaste",function() 		
	local rhastevalue = GetCombatRating(CR_HASTE_RANGED)
	return rhastevalue
end)
--Spell Haste Rating
ProbablyEngine.condition.register("shaste",function() 		
	local shastevalue = GetCombatRating(CR_HASTE_SPELL)
	return shastevalue
end)

--Mastery Rating
ProbablyEngine.condition.register("mastery",function() 		
	local masteryvalue = GetCombatRating(CR_MASTERY)
	return masteryvalue
end)