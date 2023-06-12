--- unit.onTimer(*).lua
--- throw timer hits at library functions
if tag == TimerList[1].name then

  for i = 1, #XFRUList, 1 do
    local thisXFRU = XFRUList[i]
    if isUnitAvailable(thisXFRU) then
      thisXFRU.stop(false,false)
    end   
  end



end
--- eof --- 