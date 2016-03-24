if hs.caffeinate.get("disaplayIdle") == nil then
	hs.caffeinate.set("displayIdle",true,true)
end

-- Hyper L mapped to toggle idleSleep
hs.hotkey.bind(hyper,"l",function()
	if hs.caffeinate.get("displayIdle") then
		hs.caffeinate.set("displayIdle",false,true)
		hs.alert.show("😀 Let's Party")
	else
		hs.caffeinate.set("displayIdle",true,true)
		hs.alert.show("😴 Let me rest")
	end
end)
