--资源的工具类
require('utils/printUtil')

config_files = {"scripts/npc/npc_units_custom.txt",
				"scripts/npc/npc_abilities_custom.txt",
				"scripts/npc/npc_heroes_custom.txt",
				"scripts/npc/npc_abilities_override.txt",
				"npc_items_custom.txt"} 

function PrecacheResourceByFile(context)
	for _,value in ipairs(config_files) do
		local kv = LoadKeyValues(value)
			if kv ~= nil then
				PrecacheResourceByTable(context,kv)
		end
	end
end

function PrecacheResourceByTable(context,kv)
	for key,value in ipairs(kv) do
		if type(value) == "table" then
			PrecacheResourceByTable(context,value)
		elseif string.find(value, "vpcf")	then
			PrecacheResource( "particle",  value, context)
			PrintMsg({"PRECACHE PARTICLE RESOURCE", value})
		elseif string.find(value, "vmdl")	then
			PrecacheResource( "model",  value, context)
			PrintMsg({"PRECACHE MODEL RESOURCE", value})
		elseif string.find(value, "vsndevts")	then
			PrecacheResource( "soundfile",  value, context)
			PrintMsg({"PRECACHE SOUND RESOURCE", value})
		end
	end
end
