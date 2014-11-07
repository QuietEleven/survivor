--打印方法的工具类
function PrintMsg(msg)
	if type(msg) == "string" then	
		print("[SURVIVOR]",msg)
	elseif type(msg) == "table" then
		print("[SURVIVOR]",unpack(msg))
	end 
end

function PrintTable(info)
	if type(info) == "table" then
		for k,v in pairs(table_name) do
			print(k,v)
		end
		PrintMsg(#info)
	end
end


