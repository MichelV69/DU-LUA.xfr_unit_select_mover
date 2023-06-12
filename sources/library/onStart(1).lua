--- library.onStart(1)
--- standard start pieces
---  "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

WS2_Software               = {}
WS2_Software.id            = "xfr_unit_select_mover"
WS2_Software.title         = "XFR Unit Select Mover"
WS2_Software.version       = "0.0.1"
WS2_Software.created       = "11 Jun 2023 21h05 AST"
WS2_Software.revision      = "11 Jun 2023 22h38 AST"
WS2_Software.author        = "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

---
PrecisionDigits            = 2
PrecisionValue             = 10 ^ PrecisionDigits
GramsToKG                  = 1000
Minutes                    = {}
Minutes[1]                 = 60
Minutes[2]                 = Minutes[1] * 2
Minutes[5]                 = Minutes[1] * 5

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

---
IndustryStateCode          = {}
IndustryStateCode[1]       = { nq = "Stopped", alt = "Stopped", color = ColoursRGB.cyan }
IndustryStateCode[2]       = { nq = "Running", alt = "Waiting", color = ColoursRGB.bluePure }
IndustryStateCode[3]       = { nq = "Jammed missing ingredient", alt = "Jammed", color = ColoursRGB.redPure }
IndustryStateCode[4]       = { nq = "Jammed output full", alt = "Jammed", color = ColoursRGB.redPure }
IndustryStateCode[5]       = { nq = "Jammed no output container", alt = "Jammed", color = ColoursRGB.redPure }
IndustryStateCode[6]       = { nq = "Pending", alt = "Working", color = ColoursRGB.greenPure }
IndustryStateCode[7]       = { nq = "Jammed missing schematics", alt = "Jammed", color = ColoursRGB.redPure }

---
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
  local rawMaterialData = {self.errorNotFound}
  for index, record in next, RawMaterials do
    if record == pure_id then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end

function RawMaterials:findByOreID(ore_id)
  local rawMaterialData = {self.errorNotFound}
  for index, record in next, RawMaterials do
    if record == ore_id then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end

function RawMaterials:findByOreName(oreName)
  local rawMaterialData = {self.errorNotFound}
  for index, record in next, RawMaterials do
    if record == oreName then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end

function RawMaterials:findByPureNamefunction(pureName)
  local rawMaterialData = {self.errorNotFound}
  for index, record in next, RawMaterials do
    if record.pure == pureName then
      rawMaterialData = {index, record}
    end
  end

  return rawMaterialData
end

---
system.print("\n --------------- \n")
local msgTitleAndVersion = WS2_Software.title .. "\n" .. WS2_Software.version
system.print(msgTitleAndVersion)
--- eof ---
