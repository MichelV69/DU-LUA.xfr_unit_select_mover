--- library.onStart(1)
--- standard start pieces
---  "Michel Vaillancourt <902pe_gaming@wolfstar.ca>"

WS2_Software               = {}
WS2_Software.id            = "xfr_unit_select_mover"
WS2_Software.title         = "XFR Unit Select Mover"
WS2_Software.version       = "0.0.1"
WS2_Software.created       = "11 Jun 2023 21h05 AST"
WS2_Software.revision      = "12 Jun 2023 10h24 AST"
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
system.print("\n --------------- \n")
local msgTitleAndVersion = WS2_Software.title .. "\n" .. WS2_Software.version
system.print(msgTitleAndVersion)
--- eof ---
