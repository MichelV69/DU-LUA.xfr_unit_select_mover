--- library.onStart(4).lua ---
--- core application functions
--- "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

function isUnitAvailable(thisXFRU)
  local isUnitAvailable = true
  local stateCode =  thisXFRU.getState()
  if IndustryStateCode[stateCode].alt == "Jammed"  then
    isUnitAvailable = false
  end
  return isUnitAvailable
end
--- eof ---