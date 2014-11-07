--刷怪类

require("utils/printUtil")

--在正方形的地图上随机点刷怪，刷怪成功函数才会停止
function RandomSpawnInMap(unitName)
	local spawnPosition = RandomVector(GetWorldMaxX() - GetWorldMinX())
	if spawnPosition then
		PrintMsg("系统要刷出怪物？？？？？？？？？？？？？？？？？？？")
		--刷怪点是否被阻挡
		if not GridNav:IsBlocked(spawnPosition) then
			PrintMsg("成功刷出怪物！！！！！！！！！！！！！！！！！")
			CreateUnitByName(unitName,spawnPosition:GetOrigin(),false,nil,nil,DOTA_TEAM_BADGUYS)
			return nil
		end
	end
	RandomSpawnInMap()
end