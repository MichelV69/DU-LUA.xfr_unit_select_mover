--- library.onStart(1)
--- standard start pieces
---  "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

WS2_Software          = {}
WS2_Software.id       = "xfr_unit_select_mover"
WS2_Software.title    = "XFR Unit Select Mover"
WS2_Software.version  = "0.0.1"
WS2_Software.created  = "11 Jun 2023 21h05 AST"
WS2_Software.revision = "11 Jun 2023 22h38 AST"
WS2_Software.author   = "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

---
PrecisionDigits      = 2
PrecisionValue       = 10 ^ PrecisionDigits
GramsToKG            = 1000
Minutes              = {}
Minutes[1]           = 60
Minutes[2]           = Minutes[1] * 2
Minutes[5]           = Minutes[1] * 5

---
ScreenPulseTable     = {}
ScreenPulseTable[1]  = "[-=+     ]"
ScreenPulseTable[2]  = "[ -=+    ]"
ScreenPulseTable[3]  = "[  -=+   ]"
ScreenPulseTable[4]  = "[   -=+  ]"
ScreenPulseTable[5]  = "[    -=+ ]"
ScreenPulseTable[6]  = "[     -=+]"
ScreenPulseTable[7]  = "[     -+=]"
ScreenPulseTable[8]  = "[     +=-]"
ScreenPulseTable[9]  = "[    +=- ]"
ScreenPulseTable[10] = "[   +=-  ]"
ScreenPulseTable[11] = "[  +=-   ]"
ScreenPulseTable[12] = "[ +=-    ]"
ScreenPulseTable[13] = "[+=-     ]"
ScreenPulseTable[14] = "[=+-     ]"
ScreenPulseTable[15] = "[=-+     ]"
AnimationPulseIndex  = 1

---
IndustryStateCode = {}
IndustryStateCode[1] = {nq = "Stopped", alt = "Stopped", color = ColoursRGB.cyan}
IndustryStateCode[2] = {nq = "Running", alt = "Waiting", color = ColoursRGB.bluePure}
IndustryStateCode[3] = {nq = "Jammed missing ingredient", alt = "Jammed", color = ColoursRGB.redPure}
IndustryStateCode[4] = {nq = "Jammed output full", alt = "Jammed", color = ColoursRGB.redPure}
IndustryStateCode[5] = {nq = "Jammed no output container", alt = "Jammed", color = ColoursRGB.redPure}
IndustryStateCode[6] = {nq = "Pending", alt = "Working", color = ColoursRGB.greenPure}
IndustryStateCode[7] = {nq = "Jammed missing schematics", alt = "Jammed", color = ColoursRGB.redPure}

---
RawMaterials = {}
RawMaterials.T1 = {}
RawMaterials.T1[1] = {ore = "Bauxite", pure = "Aluminium"}
RawMaterials.T1[2] = {ore = "Coal", pure = "Carbon"}
RawMaterials.T1[3] = {ore = "Hematite", pure = "Iron"}
RawMaterials.T1[4] = {ore = "Quartz", pure = "Silicon"}

RawMaterials.T2 = {}
RawMaterials.T2[1] = {ore = "Limestone", pure = "Calcium"}
RawMaterials.T2[2] = {ore = "Malachite", pure = "Copper"}

RawMaterials.findPure = function (oreName)
  local pureName = "((not found))"
  
  for i = 1, #RawMaterials.T1, 1 do
    if RawMaterials.T1[i].ore:lower() == oreName:lower() then
      pureName = RawMaterials.T1[i].pure
    end
  end

  for i = 1, #RawMaterials.T2, 1 do
    if RawMaterials.T2[i].ore:lower() == oreName:lower() then
      pureName = RawMaterials.T2[i].pure
    end
  end

  return pureName
end
---
system.print("\n --------------- \n")
local msgTitleAndVersion = WS2_Software.title .. "\n" .. WS2_Software.version
system.print(msgTitleAndVersion)
--- eof ---
