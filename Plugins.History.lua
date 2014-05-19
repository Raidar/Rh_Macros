--[[ History macros with plugins ]]--

----------------------------------------
--[[ description:
  -- Macros handling history with plugins.
  -- Макросы работы с историей с плагинами.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros/Plugins.
--]]
--------------------------------------------------------------------------------

----------------------------------------
local far = far
local F = far.Flags

--------------------------------------------------------------------------------
--local unit = {}

----------------------------------------
local guids = {}
--unit.guids = guids

local Macro = Macro or function () end
local Plugin = Plugin or {}

local Async = function () return mmode(3, 1) end

local PluginExist = Plugin.Exist
local PluginMenu, CallPlugin = Plugin.Menu, Plugin.Call

---------------------------------------- 'H' -- LuaFAR History
-- [[
guids.LFHistory = "A745761D-42B5-4E67-83DA-F07AF367AE86"
local LFHistoryMenu = {
  Commands = "D853E243-6B82-4B84-96CD-E733D77EEAA1",
  EditView = "D853E243-6B82-4B84-96CD-E733D77EEAA1",
  Folders  = "D853E243-6B82-4B84-96CD-E733D77EEAA1",
} ---
guids.LFHistoryMenu = LFHistoryMenu

do
  for _, v in pairs(LFHistoryMenu) do
    LFHistoryMenu[v] = true
  end
end -- do

local Exist = function () return PluginExist(guids.LFHistory) end

Macro {
  area = "Common",
  key = "LAltF10",
  flags = "",
  description = "History: Commands",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LFHistory, 1)
    if PluginMenu(guids.LFHistory) then return Keys"1" end
  end, ---
} ---
Macro {
  area = "Common",
  key = "LAltF11",
  flags = "",
  description = "History: Edit/View",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LFHistory, 2)
    if PluginMenu(guids.LFHistory) then return Keys"2" end
  end, ---
} ---
Macro {
  area = "Common",
  key = "LAltF12",
  flags = "",
  description = "History: Folders",
  condition = Exist,
  action = function ()
    --return CallPlugin(guids.LFHistory, 3)
    if PluginMenu(guids.LFHistory) then return Keys"3" end
  end, ---
} ---

---------------------------------------- History Menus
local LFH_Menu = function () return LFHistoryMenu[Menu.Id] end

-- Restore keys.
Macro {
  area = "Menu",
  key = "Ins NumIns",
  flags = "",
  description = "Menu: Insert item",
  priority = 100,
  condition = LFH_Menu,
  action = function () return Keys"Ins" end, ---
} ---
Macro {
  area = "Menu",
  key = "Del NumDel",
  flags = "",
  description = "Menu: Delete item",
  priority = 100,
  condition = LFH_Menu,
  action = function () return Keys"Del" end, ---
} ---

Macro {
  area = "Menu",
  key = "CtrlIns CtrlNumIns",
  flags = "",
  description = "Menu: CtrlInsert item",
  priority = 100,
  condition = LFH_Menu,
  action = function () return Keys"CtrlIns" end, ---
} ---
Macro {
  area = "Menu",
  key = "CtrlDel CtrlNumDel",
  flags = "",
  description = "Menu: CtrlDelete item",
  priority = 100,
  condition = LFH_Menu,
  action = function () return Keys"CtrlDel" end, ---
} ---
--]]
--------------------------------------------------------------------------------
