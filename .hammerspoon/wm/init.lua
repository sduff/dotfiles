positions = {
  maximized = hs.layout.maximized,
  centered = {x=0.15, y=0.15, w=0.7, h=0.7},

  left34 = {x=0, y=0, w=0.34, h=1},
  left50 = hs.layout.left50,
  left66 = {x=0, y=0, w=0.66, h=1},

  right34 = {x=0.66, y=0, w=0.34, h=1},
  right50 = hs.layout.right50,
  right66 = {x=0.34, y=0, w=0.66, h=1},

  upper50 = {x=0, y=0, w=1, h=0.5},
  upper50Left50 = {x=0, y=0, w=0.5, h=0.5},
  upper50Right50 = {x=0.5, y=0, w=0.5, h=0.5},

  lower50 = {x=0, y=0.5, w=1, h=0.5},
  lower50Left50 = {x=0, y=0.5, w=0.5, h=0.5},
  lower50Right50 = {x=0.5, y=0.5, w=0.5, h=0.5}
}

grid = {
  {key="y", units={positions.upper50Left50}},
  {key="u", units={positions.upper50}},
  {key="i", units={positions.upper50Right50}},

  {key="h", units={positions.left50, positions.left66, positions.left34}},
  {key="j", units={positions.centered, positions.maximized}},
  {key="k", units={positions.right50, positions.right66, positions.right34}},

  {key="n", units={positions.lower50Left50}},
  {key="m", units={positions.lower50}},
  {key=",", units={positions.lower50Right50}}
}

function bindKey(key, fn)
  hs.hotkey.bind(hyper, key, fn)
end

hs.fnutils.each(grid, function(entry)
  bindKey(entry.key, function()
    local units = entry.units
    local screen = hs.screen.mainScreen()
    local window = hs.window.focusedWindow()
    local windowGeo = window:frame()

    local index = 0
    hs.fnutils.find(units, function(unit)
      index = index + 1

      local geo = hs.geometry.new(unit):fromUnitRect(screen:frame()):floor()
      return windowGeo:equals(geo)
    end)
    if index == #units then index = 0 end

    window:moveToUnit(units[index + 1])
  end)
end)

-- multi screen capabilities
hs.hotkey.bind(shyper, 'h', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(shyper, 'l', hs.grid.pushWindowPrevScreen)
