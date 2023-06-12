--- library.onStart(4).lua ---
--- core application functions
--- "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

function IsUnitAvailable(thisXFRU)
  local IsUnitAvailable = true
  local stateCode = thisXFRU.getState()
  if IndustryStateCode[stateCode].alt == "Jammed" then
    IsUnitAvailable = false
  end
  return IsUnitAvailable
end --- IsUnitAvailable

function ConfigXFRU(thisXFRU)
  thisXFRU.stop(false, false)
  local currentJobTable = thisXFRU.getInfo()
  local next_work_id = 0
  local currentProductID = 0

  if #currentJobTable > 0 then
    local currentProductTable = currentJobTable.currentProducts
    system.print(WS2_Software.id .. "DEBUG: [" .. #currentJobTable .. "]")
    system.print(WS2_Software.id .. "DEBUG: [" .. #currentProductTable .. "]")
    currentProductID = currentProductTable[1].id
    next_work_id = GetNextWorkID(currentProductID)
  else
    next_work_id = RawMaterials.data[1].ore_id
  end

  local totalContainerSpace = 0
  for i = 1, #ContainerList, 1 do
    local thisContainer = ContainerList[i]
    totalContainerSpace = thisContainer.getMaxVolume()
  end
  local averageContainerLitres = roundDownToPrecision(totalContainerSpace / #ContainerList)

  system.print(WS2_Software.id .. "DEBUG: next_work_id [" .. next_work_id .. "]")

  thisXFRU.setOutput(next_work_id)
  thisXFRU.startMaintain(roundDownToPrecision(averageContainerLitres * (PercentStoragePerItem/100)))
end --- function ConfigXFRU

function GetNextWorkID(currentProductID)
  local next_work_id = 0
  local filteredRawMaterialsTable = RawMaterials
  for i = 1, #filteredRawMaterialsTable.data, 1 do
    table.remove(filteredRawMaterialsTable.data)
  end

  filteredRawMaterialsTable.data = GetFilteredRawMaterialTable()

  local currentOre = filteredRawMaterialsTable:findByOreID(currentProductID)
  local currentPure = ""
  if currentOre == filteredRawMaterialsTable.errorNotFound then
    currentPure = filteredRawMaterialsTable:findByPureID(currentProductID)
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
    nextRecord = filteredRawMaterialsTable.data[thisIndex + 1]
    next_work_id = nextRecord.ore_id
  end

  return next_work_id
end --- function GetNextWorkID

function GetFilteredRawMaterialTable()
  local filteredRawMaterialTable = {}
  if not (ProcessT1 or ProcessT2) then
    for pureName in string.gmatch(OnlyMove, "([^,]+),%s*") do
      local rawMaterialData = RawMaterials:findByPureName(pureName)
      table.insert(filteredRawMaterialTable, rawMaterialData.record)
  end
  else 
    -- get materials by tier
  end

  return filteredRawMaterialTable
end --- function GetFilteredRawMaterialTable()

--- eof ---
