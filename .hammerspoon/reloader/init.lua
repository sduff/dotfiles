-- watch for changes to config and auto reload 

function reloadConfig(paths)
	doReload = false
	for _,file in pairs(paths) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.notify.new({title="Hammerspoon", informativeText="Config reloaded"}):send()
		hs.reload()
	end
end

configFileWatcher = hs.pathwatcher.new(hs.configdir, reloadConfig):start()
