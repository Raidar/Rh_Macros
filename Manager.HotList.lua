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
  key = "LCtrl1",
  flags = "",
  description = "HList: Users",
  action = function () return Keys"F2 H Z" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift1",
  flags = "",
  description = "HList: Users/Current",
  action = function () return Keys"F2 H Z C" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt1",
  flags = "",
  description = "HList: UserLib",
  action = function () return Keys"F2 H U" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift1",
  flags = "",
  description = "HList: Users/Work",
  action = function () return Keys"F2 H Z W" end, ---
} ---
--]]
---------------------------------------- 2 -- Working
-- [[
Macro {
  area = "Shell",
  key = "LCtrl2",
  flags = "",
  description = "HList: Work folder",
  action = function () return Keys"F2 H U Q" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift2",
  flags = "",
  description = "HList: Own works",
  action = function () return Keys"F2 H U W" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt2",
  flags = "",
  description = "HList: Own sites",
  action = function () return Keys"F2 H U S" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift2",
  flags = "",
  description = "HList: Own media",
  action = function () return Keys"F2 H U R" end, ---
} ---
--]]
---------------------------------------- 3 -- Programs
-- [[
Macro {
  area = "Shell",
  key = "LCtrl3",
  flags = "",
  description = "HList: Base",
  action = function () return Keys"F2 H" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift3",
  flags = "",
  description = "HList: Apps",
  action = function () return Keys"F2 H A" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt3",
  flags = "",
  description = "HList: Programs",
  action = function () return Keys"F2 H A G" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift3",
  flags = "",
  description = "HList: Loaded",
  action = function () return Keys"F2 H C L" end, ---
} ---
--]]
---------------------------------------- 4 -- Folders
-- [[
Macro {
  area = "Shell",
  key = "LCtrl4",
  flags = "",
  description = "HList: Folders",
  action = function () return Keys"F2 H F" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift4",
  flags = "",
  description = "HList: Editing",
  action = function () return Keys"F2 H E" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt4",
  flags = "",
  description = "HList: ?",
  action = function () return Keys"F2 H" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift4",
  flags = "",
  description = "HList: ?",
  action = function () return Keys"F2 H" end, ---
} ---
--]]
---------------------------------------- 5 -- Developing
-- [[
Macro {
  area = "Shell",
  key = "LCtrl5",
  flags = "",
  description = "HList: Dev/Projects",
  action = function () return Keys"F2 D Q" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift5",
  flags = "",
  description = "HList: Dev/Tools",
  action = function () return Keys"F2 D D" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt5",
  flags = "",
  description = "HList: Dev/Scripts",
  action = function () return Keys"F2 D I" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift5",
  flags = "",
  description = "HList: Dev/LuaFAR",
  action = function () return Keys"F2 D I L" end, ---
} ---
--]]
---------------------------------------- 6 -- Developing
-- [[
Macro {
  area = "Shell",
  key = "LCtrl6",
  flags = "",
  description = "HList: Dev/Work",
  action = function () return Keys"F2 D W" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift6",
  flags = "",
  description = "HList: Dev/Sources",
  action = function () return Keys"F2 D S" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt6",
  flags = "",
  description = "HList: Dev/?",
  action = function () return Keys"F2 D" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift6",
  flags = "",
  description = "HList: Dev/Temps",
  action = function () return Keys"F2 D T" end, ---
} ---
--]]
---------------------------------------- 7 -- Collecting
-- [[
Macro {
  area = "Shell",
  key = "LCtrl7",
  flags = "",
  description = "HList: Backup",
  action = function () return Keys"F2 H K" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift7",
  flags = "",
  description = "HList: Collect/Audio",
  action = function () return Keys"F2 H C A" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt7",
  flags = "",
  description = "HList: Collect/Video",
  action = function () return Keys"F2 H C V" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift7",
  flags = "",
  description = "HList: Collect/Biblio",
  action = function () return Keys"F2 H C B" end, ---
} ---
--]]
---------------------------------------- 8 -- Library
-- [[
Macro {
  area = "Shell",
  key = "LCtrl8",
  flags = "",
  description = "HList: Library",
  action = function () return Keys"F2 B" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift8",
  flags = "",
  description = "HList: Lib/Books",
  action = function () return Keys"F2 B B" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt8",
  flags = "",
  description = "HList: Lib/Checked",
  action = function () return Keys"F2 B C" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift8",
  flags = "",
  description = "HList: Lib->Books",
  action = function () return Keys"F2 B B `" end, ---
} ---
--]]
---------------------------------------- 9 -- Library
-- [[
Macro {
  area = "Shell",
  key = "LCtrl9",
  flags = "",
  description = "HList: Lib/Work",
  action = function () return Keys"F2 B W" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift9",
  flags = "",
  description = "HList: Lib/Sorted",
  action = function () return Keys"F2 B S" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt9",
  flags = "",
  description = "HList: Lib/Unsorted",
  action = function () return Keys"F2 B U" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift9",
  flags = "",
  description = "HList: Lib/Informs",
  action = function () return Keys"F2 B W Q" end, ---
} ---
--]]
---------------------------------------- 0 -- Firm
-- [[
Macro {
  area = "Shell",
  key = "LCtrl0",
  flags = "",
  description = "HList: Firm",
  action = function () return Keys"F2 F" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift0",
  flags = "",
  description = "HList: Firm/Projects",
  action = function () return Keys"F2 F Q" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt0",
  flags = "",
  description = "HList: Firm/Binaries",
  action = function () return Keys"F2 F B" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift0",
  flags = "",
  description = "HList: Firm/Scripts",
  action = function () return Keys"F2 F S" end, ---
} ---
--]]
---------------------------------------- - -- Playing
-- [[
Macro {
  area = "Shell",
  key = "LCtrl-",
  flags = "",
  description = "HList: Games",
  action = function () return Keys"F2 H G" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift-",
  flags = "",
  description = "HList: Games/Updates",
  action = function () return Keys"F2 H G I" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt-",
  flags = "",
  description = "HList: Games/Loaded",
  action = function () return Keys"F2 H G L" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift-",
  flags = "",
  description = "HList: Games/New-info",
  action = function () return Keys"F2 H G N" end, ---
} ---
--]]
---------------------------------------- = -- Setup
-- [[
Macro {
  area = "Shell",
  key = "LCtrl=",
  flags = "",
  description = "HList: Setup",
  action = function () return Keys"F2 H I" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlShift=",
  flags = "",
  description = "HList: Setup/Install",
  action = function () return Keys"F2 H I I" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAlt=",
  flags = "",
  description = "HList: Games/Sorteds",
  action = function () return Keys"F2 H I S" end, ---
} ---
Macro {
  area = "Shell",
  key = "LCtrlLAltShift=",
  flags = "",
  description = "HList: Games/Unsorted",
  action = function () return Keys"F2 H I U" end, ---
} ---
--]]
--------------------------------------------------------------------------------
