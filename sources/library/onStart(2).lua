-- library.onStart(2)
--- tables library
--- "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

-- R  G  B
ColoursRGB                 = {}
ColoursRGB.redPure         = { 1.0, 0.0, 0.0 }
ColoursRGB.greenPure       = { 0.0, 1.0, 0.0 }
ColoursRGB.greenPureBright = { 0.0, 2.0, 0.0 }
ColoursRGB.bluePure        = { 0.0, 0.0, 1.0 }
ColoursRGB.yellowPure      = { 1.0, 1.0, 0.0 }
--
ColoursRGB.greenTinted     = { 0.5, 1.0, 0.5 }
ColoursRGB.blueTinted      = { 0.5, 0.5, 1.0 }
--
ColoursRGB.orange          = { 1.0, 0.5, 0.5 }
ColoursRGB.black           = { 0.02, 0.02, 0.04 }
ColoursRGB.cyan            = { 0.0, 0.69, 1.0 }

---
ScreenPulseTable           = {}
ScreenPulseTable[1]        = "[-=+     ]"
ScreenPulseTable[2]        = "[ -=+    ]"
ScreenPulseTable[3]        = "[  -=+   ]"
ScreenPulseTable[4]        = "[   -=+  ]"
ScreenPulseTable[5]        = "[    -=+ ]"
ScreenPulseTable[6]        = "[     -=+]"
ScreenPulseTable[7]        = "[     -+=]"
ScreenPulseTable[8]        = "[     +=-]"
ScreenPulseTable[9]        = "[    +=- ]"
ScreenPulseTable[10]       = "[   +=-  ]"
ScreenPulseTable[11]       = "[  +=-   ]"
ScreenPulseTable[12]       = "[ +=-    ]"
ScreenPulseTable[13]       = "[+=-     ]"
ScreenPulseTable[14]       = "[=+-     ]"
ScreenPulseTable[15]       = "[=-+     ]"
AnimationPulseIndex        = 1

--- Industry Units
IndustryStateCode          = {}
IndustryStateCode[1]       = { nq = "Stopped", alt = "Stopped", color = ColoursRGB.cyan }
IndustryStateCode[2]       = { nq = "Running", alt = "Waiting", color = ColoursRGB.bluePure }
IndustryStateCode[3]       = { nq = "Jammed missing ingredient", alt = "Jammed", color = ColoursRGB.redPure }
IndustryStateCode[4]       = { nq = "Jammed output full", alt = "Jammed", color = ColoursRGB.redPure }
IndustryStateCode[5]       = { nq = "Jammed no output container", alt = "Jammed", color = ColoursRGB.redPure }
IndustryStateCode[6]       = { nq = "Pending", alt = "Working", color = ColoursRGB.greenPure }
IndustryStateCode[7]       = { nq = "Jammed missing schematics", alt = "Jammed", color = ColoursRGB.redPure }

--- Ores and Pures
RawMaterials               = {}
RawMaterials.errorNotFound = "((not found))"

RawMaterials.data = {}
table.insert(RawMaterials.data, { tier = 1, ore_id = 262147665, ore = "Bauxite",   pure_id = 2240749601, pure = "Aluminium" })
table.insert(RawMaterials.data, { tier = 1, ore_id = 299255727, ore = "Coal",      pure_id = 159858782, pure = "Carbon" })
table.insert(RawMaterials.data, { tier = 1, ore_id = 4234772167, ore = "Hematite", pure_id = 198782496, pure = "Iron" })
table.insert(RawMaterials.data, { tier = 1, ore_id = 3724036288, ore = "Quartz",   pure_id = 2589986891, pure = "Silicon" })

table.insert(RawMaterials.data, { tier = 2, ore_id = 3086347393, ore = "Limestone", pure_id = 2112763718, pure = "Calcium" })
table.insert(RawMaterials.data, { tier = 2, ore_id = 2289641763, ore = "Malachite", pure_id = 1466453887, pure = "Copper" })

function RawMaterials:findByPureID(pure_id)
  local rawMaterialData = {RawMaterials.errorNotFound}
  for index, record in next, RawMaterials do
    if record == pure_id then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end

function RawMaterials:findByOreID(ore_id)
  local rawMaterialData = {RawMaterials.errorNotFound}
  for index, record in next, RawMaterials do
    if record == ore_id then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end

function RawMaterials:findByOreName(oreName)
  local rawMaterialData = {RawMaterials.errorNotFound}
  for index, record in next, RawMaterials do
    if record == oreName then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end

function RawMaterials:findByPureNamefunction(pureName)
  local rawMaterialData = {RawMaterialsself.errorNotFound}
  for index, record in next, RawMaterials do
    if record.pure == pureName then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end
--- eof ---
