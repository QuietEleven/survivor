--SURIVIAL GAME MODE
--2014/11/5

require("utils/sourceUtil")

if SurivialGameMode == nil then
	SurivialGameMode = class({})
end

function Precache( context )
	PrecacheResourceByFile(context)
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = SurivialGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function SurivialGameMode:InitGameMode()
	PrintMsg("INITING SURIVIAL GAME MODE")
	ListenceCommand()
	-- GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
end

-- Evaluate the state of the game
-- function SurivialGameMode:OnThink()
-- 	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
-- 		--print( "Template addon script is running." )
-- 	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
-- 		return nil
-- 	end
-- 	return 1
-- end