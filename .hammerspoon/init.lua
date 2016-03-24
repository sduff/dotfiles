--[[

Mapped the CapsLock key to F19 when tapped, and Hyper when held
Refer to http://brettterpstra.com/2012/12/08/a-useful-caps-lock-key/

Seil
Karabiner
]]

-- Hyper key 
hyper = {'⌘', '⌥', 'ctrl'}
-- Shift Hyper
shyper = {'⌘', '⌥', '⇧', 'ctrl'}

-- Load additional modules
require('reloader')	-- watch for changes to .hammerspoon
require('caffeine')	-- allow user control of sleep
require('pomodoro')	-- inbuilt pomodoro timer
require('mouse')	-- mouse highlighter
require('wm')		-- window manager controls
require('cheaphints')	-- WindowsHints

-- Key Bindings
-- Pomodoro timer
hs.hotkey.bind(hyper, '9', function() pom_enable() end)
hs.hotkey.bind(hyper, '0', function() pom_disable() end)
hs.hotkey.bind(shyper, '0', function() pom_reset_work() end)
-- mouse highlighter
hs.hotkey.bind(hyper,"d", mouseHighlight)

-- Application Launchers
hs.hotkey.bind(hyper,"a",function()
	os.execute("open /Applications/iTerm.app -n")
end)
hs.hotkey.bind(hyper,"q",function()
	ffox = hs.appfinder.appFromName("Firefox")
	ffox:selectMenuItem({"File","New Window"})
	ffox:activate()
end)

-- Other hammersponn configuration items
hs.window.animationDuration = 0 -- no animations
