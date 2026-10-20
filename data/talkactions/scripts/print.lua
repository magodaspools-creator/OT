function print_r ( t ) 
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    sub_print_r(t,"  ")
end

function onSay(cid, words, param)
	local t,f,err = _G
	t.cid = cid
	t.printPlayer = function(...)
		local arg = {...}
		local str = "Print["..#arg.."]: "
		for i,b in pairs(arg) do
			str = str..tostring(b)..',  '
		end
		if (#arg > 0) then
			str = str:sub(1,#str-3)
		end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,str)
	end
	param = param:gsub("print%("," printPlayer%(");
	pcall(function()
		f , err = loadstring(param)
	end)
	if f then
		setfenv(f, t)
		local ret = {pcall(f)};
		if not ret[1] then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,(err or '')..(ret[2] or ''))
		else
			if ret[1] == true and ret[2] ~= nil then
				for i,b in pairs(ret) do
					if i >= 2 then
						doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,tostring(b))
					end
				end
			end
		end
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,err)
	end
return TRUE
end
