--测试、调试游戏的命令类

function ListenceCommand()
	PrintMsg("ListenceCommanding")

	--侦听事件
	-- ListenToGameEvent("entity_killed",Dynamic_Warp("OnEntityKilled"), self)

	--增加调试命令
	Convars:RegisterCommand("item_culling_blade",CreateItem,"",0)
	Convars:RegisterCommand("boss_abaddon_template",
	function()
		local boss = CreateUnitByName("npc_dota_creature_gnoll_assassin",Convars:GetCommandClient():GetForwardVector()+100,false,nil,nil,DOTA_TEAM_BADGUYS)
	end, "",0)
end

-- function OnEntityKilled(keys)
-- 	local killedUnit =	EntIndexToHScript(keys.entindex_killed)
-- 	if killedUnit then
-- 		CreateItem(killedUnit)
-- 	end
-- end

function CreateItem(target)
	local player = Convars:GetCommandClient() or target
	local position = player:GetForwardVector()

	local item = CreateItem("item_culling_blade",nil,nil)
	local drop = CreateItemOnPositionSync(position,player)
	item:LaunchLoot(false, 0, 0, position)
end