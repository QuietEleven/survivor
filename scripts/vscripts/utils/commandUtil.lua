--测试、调试游戏的命令类

require("utils/printUtil")

function ListenceCommand()
	PrintMsg("ListenceCommanding")
	Convars:RegisterCommand("item_culling_blade",CreateItem,"",0)
end

Convars:RegisterCommand("boss_abaddon_template",
	function()
		local item = CreateItem("item_culling_blade", nil, nil)	
		local boss = CreateUnitByName(unitName,Convars:GetCommandClient():GetForwardVector()+100,false,nil,nil,DOTA_TEAM_BADGUYS)
		boss:AddItemDrop(item)
	end, "",0)

function CreateItem()
	local player = Convars:GetCommandClient()
	local position = player:GetForwardVector()
	local item = CreateItemOnPositionSync(position,player)
end