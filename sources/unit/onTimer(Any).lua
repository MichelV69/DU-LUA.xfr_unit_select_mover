--- unit.onTimer(*).lua
--- onTimer creates a param "tag" with the timer name in it
--- throw timer hits at library functions
if tag == TimerList[1].name then
  for i = 1, #XFRUList, 1 do
    local thisXFRU = XFRUList[i]
    if isUnitAvailable(thisXFRU) then
      thisXFRU.stop(false, false)
      local currentJobTable = thisXFRU.getInfo()

      --- local currentProductTable = currentJobTable[13]
      local currentProductTable = currentJobTable.currentProducts

      --- local currentProductID = currentProductTable[1][1]
      local currentProductID = currentProductTable[1].id

      local currentOre = RawMaterials.findByOreID(currentProductID)
      local currentPure = ""
      if currentOre == RawMaterials.errorNotFound then
        currentPure = RawMaterials.findByPureID(currentProductID)
      end

      local next_work_id = 0
      if currentPure == "" then
        -- we found an ore_id
        -- find *this* record in the data set, and get that pure_id
        next_work_id = currentOre.pure_id
      else
        -- we are working on a Pure material
        -- find the *next* record in the data set, and get that ore_id
        thisIndex = currentOre.index
        nextRecord = RawMaterials.data[thisIndex + 1]
        next_work_id = nextRecord.ore_id
      end

      thisXFRU.setOutput(next_work_id)

      local totalContainerSpace = 0
      for i = 1, #ContainerList, 1 do
        local thisContainer = ContainerList[i]
        totalContainerSpace = thisContainer.getMaxVolume()
      end
      local averageContainerLitres = roundDownToPrecision(totalContainerSpace / #ContainerList)
      thisXFRU.startMaintain(roundDownToPrecision(averageContainerLitres * 0.10))

    end
  end
end
--- eof ---
