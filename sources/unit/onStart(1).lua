--- unit.OnStart(1)
--- user configuration options
ProcessT1             = false --export "Should the XFRU move ALL T1 Ores and Pures?"
ProcessT2             = false --export "Should the XFRU move ALL T2 Ores and Pures?"
OnlyMove              = "Copper,Calcium" --export "Comma delimited list of Pures to move. The corresponding Ores will also be moved."
PercentStoragePerItem = 1   --export "percentage of available liters in connected containers"

--- environment / globals
TimerList             = {}
Slotlist              = { slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10 }
ScreenList            = {}
LightList             = {}
XFRUList              = {}
ContainerList         = {}

local isConfigError   = false
--- sanity / configuration check
for i = 1, #Slotlist, 1 do
  local thisSlot = Slotlist[i]

  system.print(WS2_Software.id .. ": found [" .. thisSlot.getClass() .. "] in Slot [" .. i .. "].")

  if thisSlot.getClass() == "ScreenUnit" then
    table.insert(ScreenList, thisSlot)
  end
  if thisSlot.getClass() == "LightUnit" then
    table.insert(LightList, thisSlot)
  end

  if thisSlot.getClass() == "IndustryUnit" then
    table.insert(XFRUList, thisSlot)
  end

  if thisSlot.getClass() == "ContainerXLGroup" then
    table.insert(ContainerList, thisSlot)
  end
end

local thingName = "Screens"
if #ScreenList == 0 then
  error("No " .. thingName .. " connected.  Cannot continue.")
  isConfigError = true
else
  system.print(WS2_Software.id .. ": found [" .. #ScreenList .. "] connected " .. thingName .. ".")
end

thingName = "Transfer Units"
if #XFRUList == 0 then
  error("No " .. thingName .. " connected.  Cannot continue.")
  isConfigError = true
else
  system.print(WS2_Software.id .. ": found [" .. #XFRUList .. "] connected " .. thingName .. ".")
end

thingName = "Containers"
if #ContainerList == 0 then
  error("No " .. thingName .. " connected.  Cannot continue.")
  isConfigError = true
else
  system.print(WS2_Software.id .. ": found [" .. #ContainerList .. "] connected " .. thingName .. ".")
end

if isConfigError then
  unit.exit()
end

--- intitialization config
for i = 1, #ScreenList, 1 do
  local thisScreen = ScreenList[i]
  thisScreen.activate()
  thisScreen.setCenteredText(WS2_Software.title .. "((booting))")
end

for i = 1, #LightList, 1 do
  local thisLight = LightList[i]
  thisLight.setColor(ColoursRGB.black[1], ColoursRGB.black[2], ColoursRGB.black[3])
  thisLight.activate()
end

--- start running condition
--- --- n/a

--- start timers required
TimerList[1] = { name = WS2_Software.id, cycle_seconds = 6 }
for i = 1, #TimerList, 1 do
  unit.setTimer(TimerList[i].name, TimerList[i].cycle_seconds)
end

--- wrap up when done here.
system.print(WS2_Software.id .. ": ... done start up.")
--- eof ---
