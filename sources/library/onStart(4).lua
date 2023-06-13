--- library.onStart(4).lua ---
--- core application functions
--- "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

-----
function FindByPureID(pure_id)
  local rawMaterialData = { 1, RawMaterials.errorNotFound }
  for index, record in next, RawMaterials.data do
    if record.pure_id == pure_id then
      rawMaterialData = { index, record }
    end
  end

  return rawMaterialData
end ---

function FindByOreID(ore_id)
  local rawMaterialData = { 1, RawMaterials.errorNotFound }
  for index, record in next, RawMaterials.data do
    if record.ore_id == ore_id then
      rawMaterialData = { index, record }
    end
  end

  return rawMaterialData
end ---

function FindByOreName(oreName)
  local rawMaterialData = { 1, RawMaterials.errorNotFound }
  for index, record in next, RawMaterials.data do
    if record.ore == oreName then
      rawMaterialData = { index, record }
    end
  end

  return rawMaterialData
end ---

function FindByPureName(pureName)
  pureName = string.lower(string.gsub(pureName, "%s+", ""))
  system.print(WS2_Software.id .. ":DEBUG:FindByPureName looking for [" .. pureName .. "]")

  local rawMaterialData = { 1, RawMaterials.errorNotFound }
  for index, record in pairs(RawMaterials.data) do
    if string.lower(record.pure) == pureName then
      system.print(WS2_Software.id .. ":DEBUG:FindByPureName FOUND [" .. record.pure .. "]")
      rawMaterialData = { index, record }
    end
  end

  return rawMaterialData
end ---

-----

function IsUnitAvailable(thisXFRU)
  local IsUnitAvailable = true
  local stateCode = thisXFRU.getState()
  if IndustryStateCode[stateCode].alt == "Jammed" or
      IndustryStateCode[stateCode].alt == "Pending" then
    IsUnitAvailable = false
  end
  return IsUnitAvailable
end --- IsUnitAvailable

function ConfigXFRU(thisXFRU)
  thisXFRU.stop(false, false)
  CurrentProductID = GetNextWorkID()
  system.print(WS2_Software.id .. ":DEBUG:ConfigXFRU CurrentProductID [" .. CurrentProductID .. "]")

  local totalContainerSpace = 0
  for i = 1, #ContainerList, 1 do
    local thisContainer = ContainerList[i]
    totalContainerSpace = thisContainer.getMaxVolume()
  end
  local averageContainerLitres = roundDownToPrecision(totalContainerSpace / #ContainerList)

  thisXFRU.setOutput(CurrentProductID)
  thisXFRU.startMaintain(roundDownToPrecision(averageContainerLitres * (PercentStoragePerItem / 100)))
end --- function ConfigXFRU

function GetNextWorkID()
  local next_work_id = 0
  local filtered = {}
  filtered = GetFilteredRawMaterialTable()

  if CurrentProductID == -1 then
    return filtered[1].ore_id
  end

  local currentOre = FindByOreID(CurrentProductID)
  local next_work_id = 0

  if currentOre.tier ~= nil then
    next_work_id = currentOre.pure_id
  else
    local currentPure = FindByPureID(CurrentProductID)
    local thisIndex = currentPure.index
    local nextRecord = filtered[thisIndex + 1]
    next_work_id = nextRecord.ore_id
  end

  return next_work_id
end --- function GetNextWorkID

function GetFilteredRawMaterialTable()
  local filteredTable = {}
  if not (ProcessT1 or ProcessT2) then
    local onlyMoveTable = {}
    for w in string.gmatch(OnlyMove, "[^,]+") do
      table.insert(onlyMoveTable, w)
    end

    for i = 1, #onlyMoveTable, 1 do
      system.print(WS2_Software.id ..
      ":DEBUG:GetFilteredRawMaterialTable onlyMoveTable[" .. i .. "] [" .. onlyMoveTable[i] .. "]")
      local rawMaterialData = FindByPureName(onlyMoveTable[i])
      table.insert(filteredTable, rawMaterialData.record)
    end
  else
    for key, value in pairs(RawMaterials.data) do
      if ProcessT1 and
          value.tier == 1 then
        table.insert(filteredTable, value)
      end
      if ProcessT2 and
          value.tier == 2 then
        table.insert(filteredTable, value)
      end
    end
  end

  return filteredTable
end --- function GetFilteredRawMaterialTable()

--- eof ---
