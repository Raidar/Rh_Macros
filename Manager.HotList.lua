--[[ HotList macros ]]--

----------------------------------------
--[[ description:
  -- Macros for hot items from User menu.
  -- Макросы для "горячих" пунктов из Пользовательского меню.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/UserMenu.
--]]
--------------------------------------------------------------------------------

----------------------------------------
--[[
local dbg = require "context.utils.useDebugs"
local logShow = dbg.Show
--]]

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
--local guids = {}
--unit.guids = guids

local Macro = Macro or function () end

---------------------------------------- 1 -- Users
-- [[
Macro {
  area = "Shell",
  key = "Ctrl1",
  flags = "DisableOutput",
  description = "HList: Users",
  action = function () return Keys"F2 H Z" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift1",
  flags = "DisableOutput",
  description = "HList: Users/Current",
  action = function () return Keys"F2 H Z C" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt1",
  flags = "DisableOutput",
  description = "HList: UserLib",
  action = function () return Keys"F2 H U" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift1",
  flags = "DisableOutput",
  description = "HList: Users/Work",
  action = function () return Keys"F2 H Z W" end, ---
} ---
--]]
---------------------------------------- 2 -- Working
-- [[
Macro {
  area = "Shell",
  key = "Ctrl2",
  flags = "DisableOutput",
  description = "HList: Work folder",
  action = function () return Keys"F2 H U Q" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift2",
  flags = "DisableOutput",
  description = "HList: Own works",
  action = function () return Keys"F2 H U W" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt2",
  flags = "DisableOutput",
  description = "HList: Own sites",
  action = function () return Keys"F2 H U S" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift2",
  flags = "DisableOutput",
  description = "HList: Own media",
  action = function () return Keys"F2 H U R" end, ---
} ---
--]]
---------------------------------------- 3 -- Programs
-- [[
Macro {
  area = "Shell",
  key = "Ctrl3",
  flags = "DisableOutput",
  description = "HList: Base",
  action = function () return Keys"F2 H" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift3",
  flags = "DisableOutput",
  description = "HList: Apps",
  action = function () return Keys"F2 H A" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt3",
  flags = "DisableOutput",
  description = "HList: Programs",
  action = function () return Keys"F2 H A G" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift3",
  flags = "DisableOutput",
  description = "HList: Loaded",
  action = function () return Keys"F2 H C L" end, ---
} ---
--]]
---------------------------------------- 4 -- Folders
-- [[
Macro {
  area = "Shell",
  key = "Ctrl4",
  flags = "DisableOutput",
  description = "HList: Folders",
  action = function () return Keys"F2 H F" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift4",
  flags = "DisableOutput",
  description = "HList: Editing",
  action = function () return Keys"F2 H E" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt4",
  flags = "DisableOutput",
  description = "HList: ?",
  action = function () return Keys"F2 H" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift4",
  flags = "DisableOutput",
  description = "HList: ?",
  action = function () return Keys"F2 H" end, ---
} ---
--]]
---------------------------------------- 5 -- Developing
-- [[
Macro {
  area = "Shell",
  key = "Ctrl5",
  flags = "DisableOutput",
  description = "HList: Dev/Projects",
  action = function () return Keys"F2 D Q" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift5",
  flags = "DisableOutput",
  description = "HList: Dev/Tools",
  action = function () return Keys"F2 D D" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt5",
  flags = "DisableOutput",
  description = "HList: Dev/Scripts",
  action = function () return Keys"F2 D I" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift5",
  flags = "DisableOutput",
  description = "HList: Dev/LuaFAR",
  action = function () return Keys"F2 D I L" end, ---
} ---
--]]
---------------------------------------- 6 -- Developing
-- [[
Macro {
  area = "Shell",
  key = "Ctrl6",
  flags = "DisableOutput",
  description = "HList: Dev/Work",
  action = function () return Keys"F2 D W" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift6",
  flags = "DisableOutput",
  description = "HList: Dev/Sources",
  action = function () return Keys"F2 D S" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt6",
  flags = "DisableOutput",
  description = "HList: Dev/?",
  action = function () return Keys"F2 D" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift6",
  flags = "DisableOutput",
  description = "HList: Dev/Temps",
  action = function () return Keys"F2 D T" end, ---
} ---
--]]
---------------------------------------- 7 -- Collecting
-- [[
Macro {
  area = "Shell",
  key = "Ctrl7",
  flags = "DisableOutput",
  description = "HList: Backup",
  action = function () return Keys"F2 H K" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift7",
  flags = "DisableOutput",
  description = "HList: Collect/Audio",
  action = function () return Keys"F2 H C A" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt7",
  flags = "DisableOutput",
  description = "HList: Collect/Video",
  action = function () return Keys"F2 H C V" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift7",
  flags = "DisableOutput",
  description = "HList: Collect/Biblio",
  action = function () return Keys"F2 H C B" end, ---
} ---
--]]
---------------------------------------- 8 -- Library
-- [[
Macro {
  area = "Shell",
  key = "Ctrl8",
  flags = "DisableOutput",
  description = "HList: Library",
  action = function () return Keys"F2 B" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift8",
  flags = "DisableOutput",
  description = "HList: Lib/Books",
  action = function () return Keys"F2 B B" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt8",
  flags = "DisableOutput",
  description = "HList: Lib/Checked",
  action = function () return Keys"F2 B C" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift8",
  flags = "DisableOutput",
  description = "HList: Lib->Books",
  action = function () return Keys"F2 H B B `" end, ---
} ---
--]]
---------------------------------------- 9 -- Library
-- [[
Macro {
  area = "Shell",
  key = "Ctrl9",
  flags = "DisableOutput",
  description = "HList: Lib/Work",
  action = function () return Keys"F2 B W" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift9",
  flags = "DisableOutput",
  description = "HList: Lib/Sorted",
  action = function () return Keys"F2 B S" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt9",
  flags = "DisableOutput",
  description = "HList: Lib/Unsorted",
  action = function () return Keys"F2 B U" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift9",
  flags = "DisableOutput",
  description = "HList: Lib->Sorted",
  action = function () return Keys"F2 H B S `" end, ---
} ---
--]]
---------------------------------------- 0 -- Firm
-- [[
Macro {
  area = "Shell",
  key = "Ctrl0",
  flags = "DisableOutput",
  description = "HList: Firm",
  action = function () return Keys"F2 F" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift0",
  flags = "DisableOutput",
  description = "HList: Firm/Projects",
  action = function () return Keys"F2 F Q" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt0",
  flags = "DisableOutput",
  description = "HList: Firm/Binaries",
  action = function () return Keys"F2 F B" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift0",
  flags = "DisableOutput",
  description = "HList: Firm/Scripts",
  action = function () return Keys"F2 F S" end, ---
} ---
--]]
---------------------------------------- - -- Playing
-- [[
Macro {
  area = "Shell",
  key = "Ctrl-",
  flags = "DisableOutput",
  description = "HList: Games",
  action = function () return Keys"F2 H G" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift-",
  flags = "DisableOutput",
  description = "HList: Games/Updates",
  action = function () return Keys"F2 H G I" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt-",
  flags = "DisableOutput",
  description = "HList: Games/Loaded",
  action = function () return Keys"F2 H G L" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift-",
  flags = "DisableOutput",
  description = "HList: Games/New-info",
  action = function () return Keys"F2 H G N" end, ---
} ---
--]]
---------------------------------------- = -- Setup
-- [[
Macro {
  area = "Shell",
  key = "Ctrl=",
  flags = "DisableOutput",
  description = "HList: Setup",
  action = function () return Keys"F2 H I" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlShift=",
  flags = "DisableOutput",
  description = "HList: Setup/Install",
  action = function () return Keys"F2 H I I" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAlt=",
  flags = "DisableOutput",
  description = "HList: Games/Sorteds",
  action = function () return Keys"F2 H I S" end, ---
} ---
Macro {
  area = "Shell",
  key = "CtrlAltShift=",
  flags = "DisableOutput",
  description = "HList: Games/Unsorted",
  action = function () return Keys"F2 H I U" end, ---
} ---
--]]
--------------------------------------------------------------------------------
