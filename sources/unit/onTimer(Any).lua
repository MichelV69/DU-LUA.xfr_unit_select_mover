--- unit.onTimer(*).lua
--- onTimer creates a param "tag" with the timer name in it
--- throw timer hits at library functions
if tag == TimerList[1].name then
  for i = 1, #XFRUList, 1 do
    local thisXFRU = XFRUList[i]
    if isUnitAvailable(thisXFRU) then
      configXFRU(thisXFRU)
    end
  end
end
--- eof ---
