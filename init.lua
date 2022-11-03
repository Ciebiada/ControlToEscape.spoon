local eventtap = require('hs.eventtap')

local getKeys = function(t)
  local keys = {}
  for k, v in pairs(t) do
    table.insert(keys, k)
  end
  return keys
end

local module = {
  name = 'ControlToEscape',
  version = '0.1',
  author = 'Michał Ciebiada',
  homepage = 'https://github.com/ciebiada/ControlToEscape.spoon',
  license = 'MIT - https://opensource.org/licenses/MIT'
}

local sendEscape = false
local prevMods = {}

module.start = function()
  module.modifierPressed = eventtap.new({ eventtap.event.types.flagsChanged }, function(e)
    local mods = e:getFlags()

    local events = {}

    if mods.ctrl and not prevMods.ctrl then
      sendEscape = true
    else
      if not mods.ctrl and prevMods.ctrl and sendEscape then
        local modKeys = getKeys(mods)
        events = {
          eventtap.event.newKeyEvent(modKeys, 'escape', true),
          eventtap.event.newKeyEvent(modKeys, 'escape', false),
        }
      end

      sendEscape = false
    end

    prevMods = mods

    return false, events
  end):start()

  module.keyPressed = eventtap.new({ eventtap.event.types.keyDown }, function(e)
    sendEscape = false
  end):start()

  return module
end

module.stop = function()
  if module.et then
    module.et:stop()
  end

  return module
end

return module
