-----------------------------------------------------------------------------------------------------------------------------
-- Initialize Tables -------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
local cutie = {} 

cutie.queueSpell = nil
cutie.queueTime = 0
-----------------------------------------------------------------------------------------------------------------------------
-- Notify Frame -- (c)xrn overlay for pqr -----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.5 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    ecn = CreateFrame("Frame",nil,ChatFrame1) 
    ecn:SetSize(ChatFrame1:GetWidth(),30)
    ecn:Hide()
    ecn:SetScript("OnUpdate",onUpdate)
    ecn:SetPoint("TOPLEFT",0,150)
    ecn.text = ecn:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    ecn.text:SetAllPoints()
    ecn.texture = ecn:CreateTexture()
    ecn.texture:SetAllPoints()
    ecn.texture:SetTexture(0,0,0,.50) 
    ecn.time = 0
    function ecn:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
    
    local function onUpdate(self,elapsed) 
      if self.time < GetTime() - 2.8 then
        if self:GetAlpha() == 0 then self:Hide() else self:SetAlpha(self:GetAlpha() - .05) end
      end
    end
    ecn = CreateFrame("Frame",nil,ChatFrame1) 
    ecn:SetSize(ChatFrame1:GetWidth(),30)
    ecn:Hide()
    ecn:SetScript("OnUpdate",onUpdate)
    ecn:SetPoint("TOP",0,0)
    ecn.text = ecn:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
    ecn.text:SetAllPoints()
    ecn.texture = ecn:CreateTexture()
    ecn.texture:SetAllPoints()
    ecn.texture:SetTexture(0,0,0,.50) 
    ecn.time = 0
    function ecn:message(message) 
      self.text:SetText(message)
      self:SetAlpha(1)
      self.time = GetTime() 
      self:Show() 
    end
-----------------------------------------------------------------------------------------------------------------------------
-- Macros ------------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
ProbablyEngine.command.register('cutie', function(msg, box)
  local command, text = msg:match("^(%S*)%s*(.-)$")
-- Toggle -------------------------------------------------------------------------------------------------------------------
  if command == 'toggle' then
    if ProbablyEngine.toggle.states.MasterToggle then
        --ProbablyEngine.buttons.toggle('MasterToggle')
        ProbablyEngine.buttons.buttons['MasterToggle']:Click()
        ecn:message("|cFFB30000Executie off")
    else
        --ProbablyEngine.buttons.toggle('MasterToggle')
        ProbablyEngine.buttons.buttons['MasterToggle']:Click()
        ecn:message("|cFF00B34AExecutie on")
    end
  end
  if command == 'kick' then
    if ProbablyEngine.toggle.states.interrupt then
      --ProbablyEngine.buttons.toggle('interrupt')
      ProbablyEngine.buttons.buttons['interrupt']:Click()
      ecn:message("|cFFB30000Interrupts off")
    else
      --ProbablyEngine.buttons.toggle('interrupt')
      ProbablyEngine.buttons.buttons['interrupt']:Click()
      ecn:message("|cFF00B34AInterrupts on")
    end
  end

  if command == 'cds' then
    if ProbablyEngine.toggle.states.cooldowns then
      --ProbablyEngine.buttons.toggle('cooldowns')
      ProbablyEngine.buttons.buttons['cooldowns']:Click()
      ecn:message("|cFFB30000Offensive Cooldowns off")
    else
      --ProbablyEngine.buttons.toggle('cooldowns')
      ProbablyEngine.buttons.buttons['cooldowns']:Click()
      ecn:message("|cFF00B34AOffensive Cooldowns on")
    end
  end

  if command == 'aoe' then
    if ProbablyEngine.toggle.states.multitarget then
      --ProbablyEngine.buttons.toggle('multitarget')
      ProbablyEngine.buttons.buttons['multitarget']:Click()
      ecn:message("|cFFB30000AoE off")
    else
      --ProbablyEngine.buttons.toggle('multitarget')
      ProbablyEngine.buttons.buttons['multitarget']:Click()
      ecn:message("|cFF00B34AAoE on")
    end
  end
  
  if command == 'autobanner' then
    if ProbablyEngine.toggle.states.autobanner then
      --ProbablyEngine.buttons.toggle('autobanner')
      ProbablyEngine.buttons.buttons['autobanner']:Click()
      ecn:message("|cFFB30000SoO Auto Skull Banner off")
    else
      --ProbablyEngine.buttons.toggle('autobanner')
      ProbablyEngine.buttons.buttons['autobanner']:Click()
      ecn:message("|cFF00B34ASoO Auto Skull Banner on")
    end
  end

  if command == 'def' then
    if ProbablyEngine.toggle.states.def then
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['def']:Click()
      ecn:message("|cFFB30000Defensive Cooldowns off")
    else
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['def']:Click()
      ecn:message("|cFF00B34ADefensive Cooldowns on")
    end
  end

    if command == 'twotar' then
    if ProbablyEngine.toggle.states.twotargets then
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['twotargets']:Click()
      ecn:message("|cFFB300002 Target Rotation off")
    else
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['twotargets']:Click()
      ecn:message("|cFF00B34A2 Target Rotation on")
    end
  end

    if command == 'threetar' then
    if ProbablyEngine.toggle.states.threetargets then
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['threetargets']:Click()
      ecn:message("|cFFB300003 Target Rotation off")
    else
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['threetargets']:Click()
      ecn:message("|cFF00B34A3 Target Rotation on")
    end
  end

    if command == 'fourtar' then
    if ProbablyEngine.toggle.states.fourplustargets then
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['fourplustargets']:Click()
      ecn:message("|cFFB300004+ Targets Rotation off")
    else
      --ProbablyEngine.buttons.toggle('def')
      ProbablyEngine.buttons.buttons['fourplustargets']:Click()
      ecn:message("|cFF00B34A4+ Targets Rotation on")
    end
  end

  if command == 'armsmacros' then
    cutie.createArmsMacros()
  end

  if command == 'furymacros' then
    cutie.createFuryMacros()
  end

  if command == 'help' then
    cutie.macroHelp()
  end

-- Spell Queue -- thank you merq for basic code -----------------------------------------------------------------------------
  if command == "qSkullb" or command == 114207 then
    cutie.queueSpell = 114207
    ecn:message("Skull Banner queued")
  elseif command == "qShieldWall" or command == 871 then
    cutie.queueSpell = 871
    ecn:message("Shield Wall queued")
  elseif command == "qDiebtSw" or command == 118038 then
    cutie.queueSpell = 118038
    ecn:message("Die by the Sword queued")
  elseif command == "qDemob" or command == 114203 then
    cutie.queueSpell = 114203
    ecn:message("Demoralizing Banner queued")
  elseif command == "qRally" or command == 97462 then
    cutie.queueSpell = 97462
    ecn:message("Rallying Cry queued")
  elseif command == "qTfour" then
    if select(2,GetTalentRowSelectionInfo(4)) == 10 then
        cutie.queueSpell = 46924
        ecn:message("Bladestorm queued") 
    elseif select(2,GetTalentRowSelectionInfo(4)) == 11 then
        cutie.queueSpell = 46968
        ecn:message("Shockwave queued") 
    elseif select(2,GetTalentRowSelectionInfo(4)) == 12 then
        cutie.queueSpell = 118000
        ecn:message("Dragon Roar queued") 
    end
  elseif command == "qTfive" then
    if select(2,GetTalentRowSelectionInfo(5)) == 13 then
        cutie.queueSpell = 114028
        ecn:message("Mass Spell Reflection queued") 
    elseif select(2,GetTalentRowSelectionInfo(5)) == 14 then
        cutie.queueSpell = 114029
        ecn:message("Safeguard queued")
    elseif select(2,GetTalentRowSelectionInfo(5)) == 15 then
        cutie.queueSpell = 114030
        ecn:message("Vigilance queued")  
    end
  else
    cutie.queueSpell = nil
  end
  if cutie.queueSpell ~= nil then cutie.queueTime = GetTime() end
end)
-----------------------------------------------------------------------------------------------------------------------------
-- Spell Queue Check -- thank you merq for basic code ----------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
cutie.checkQueue = function (spellId)
    if (GetTime() - cutie.queueTime) > 4 then
        cutie.queueTime = 0
        cutie.queueSpell = nil
    return false
    else
    if cutie.queueSpell then
        if cutie.queueSpell == spellId then
            if ProbablyEngine.parser.lastCast == GetSpellName(spellId) then
                cutie.queueSpell = nil
                cutie.queueTime = 0
            end
        return true
        end
    end
    end
    return false
end
-----------------------------------------------------------------------------------------------------------------------------
-- Create Arms Macros ----------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
function cutie.createArmsMacros( ... )
  local usedslots = select(2,GetNumMacros())
  if usedslots <= 5 then
    CreateMacro("toggle", "Inv_sword_01", "/cutie toggle", 1, 1)
    CreateMacro("kick", "inv_gauntlets_04", "#showtooltip Pummel\n/cutie kick", 1, 1)
    CreateMacro("cds", "ability_criticalstrike", "/cutie cds", 1, 1)
    CreateMacro("aoe", "Ability_warlock_jinx", "/cutie aoe", 1, 1)
    CreateMacro("autobanner", "inv_banner_03", "/cutie autobanner", 1, 1)
    CreateMacro("def", "Inv_shield_08", "/cutie def", 1, 1)
    CreateMacro("qSkullb", "warrior_skullbanner", "#showtooltip Skull Banner\n/cutie qSkullb", 1, 1)
    CreateMacro("qShieldWall", "ability_warrior_shieldwall", "#showtooltip Shield Wall\n/cutie qShieldWall", 1, 1)
    CreateMacro("qDiebtSw", "ability_warrior_challange", "#showtooltip Die by the Sword\n/cutie qDiebtSw", 1, 1)
    CreateMacro("qDemob", "demoralizing_banner", "#showtooltip Demoralizing Banner\n/cutie qDemob", 1, 1)
    CreateMacro("qRally", "ability_toughness", "#showtooltip Rallying Cry\n/cutie qRally", 1, 1)
    CreateMacro("qTfour", "ability_parry", "/cutie qTfour", 1, 1)
    CreateMacro("qTfive", "ability_parry", "/cutie qTfive", 1, 1)
  else
    print("You don't have enough free Macroslots")
  end
end  
-----------------------------------------------------------------------------------------------------------------------------
-- Create Fury Macros ----------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
function cutie.createFuryMacros( ... )
  local usedslots = select(2,GetNumMacros())
  if usedslots <= 3 then
    CreateMacro("toggle", "Inv_sword_01", "/cutie toggle", 1, 1)
    CreateMacro("kick", "inv_gauntlets_04", "#showtooltip Pummel\n/cutie kick", 1, 1)
    CreateMacro("cds", "ability_criticalstrike", "/cutie cds", 1, 1)
    CreateMacro("autobanner", "inv_banner_03", "/cutie autobanner", 1, 1)
    CreateMacro("def", "Inv_shield_08", "/cutie def", 1, 1)
    CreateMacro("qSkullb", "warrior_skullbanner", "#showtooltip Skull Banner\n/cutie qSkullb", 1, 1)
    CreateMacro("qShieldWall", "ability_warrior_shieldwall", "#showtooltip Shield Wall\n/cutie qShieldWall", 1, 1)
    CreateMacro("qDiebtSw", "ability_warrior_challange", "#showtooltip Die by the Sword\n/cutie qDiebtSw", 1, 1)
    CreateMacro("qDemob", "demoralizing_banner", "#showtooltip Demoralizing Banner\n/cutie qDemob", 1, 1)
    CreateMacro("qRally", "ability_toughness", "#showtooltip Rallying Cry\n/cutie qRally", 1, 1)
    CreateMacro("qTfour", "ability_parry", "/cutie qTfour", 1, 1)
    CreateMacro("qTfive", "ability_parry", "/cutie qTfive", 1, 1)
    CreateMacro("twotar", "ability_warrior_cleave", "/cutie twotar", 1, 1)
    CreateMacro("threetar", "ability_whirlwind", "/cutie threetar", 1, 1)
    CreateMacro("fourtar", "ability_warrior_bladestorm", "/cutie fourtar", 1, 1)

  else
    print("You don't have enough free Macroslots")
  end
end  
-----------------------------------------------------------------------------------------------------------------------------
-- Create Help Message ------------------------------------------------------------------------------------------------------------ 
-----------------------------------------------------------------------------------------------------------------------------
function cutie.macroHelp( ... )
  print("|cFFC79C6EExecutie |rv1.0")
  print("|cFFC79C6ECommands:|r\n/cutie armsmacros - Create all Toggle / Spellqueue Macros for Arms Rotation\n/cutie furymacros - Create all Toggle / Spellqueue Macros for Fury Rotation")
  print("|cFFC79C6EToggle Macros:|r\n/cutie toggle - Rotation on/off\n/cutie kick - Interrupt & Disarm on/off\n/cutie cds - Offensive Cooldowns on/off\n/cutie aoe - Multitarget-Rotation on/off\n/cutie autobanner - Auto Skull Banner on/off\n/cutie def - Auto Defensive Cooldowns on/off\n/cutie twotar - 2 Target Rotation on/off (Fury only)\n/cutie threetar - 3 Target Rotation on/off (Fury only)\n/cutie fourtar - 4+ Target Rotation on/off (Fury only)")
  print("|cFFC79C6EQueue Macros:|r\n/cutie qSkullb | qShieldWall | qDiebtSw | qDemob | qTfour | qTfive | qRally")
  print("|cFFC79C6EAdditional Help:|r\nhttp://tinyurl.com/pe-executie")
end  
-----------------------------------------------------------------------------------------------------------------------------
-- Healthstone -------------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
function cutie.Healthstone(...)
    local PlayerHP = 100 * UnitHealth("player") / UnitHealthMax("player")
    if PlayerHP < 40
    and GetItemCount(5512,false,false) > 0 
    and ( select(2, GetItemCooldown(5512)) == 0 ) then
        return true
    end
end 
-----------------------------------------------------------------------------------------------------------------------------
-- Register Library --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
ProbablyEngine.library.register("cutie", cutie)