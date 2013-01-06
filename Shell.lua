--[[ Shell macros ]]--

----------------------------------------
--[[ description:
  -- Macros for shell area.
  -- Макросы для области оболочки.
--]]
----------------------------------------
--[[ uses:
  nil.
  -- group: Macros.
--]]
--------------------------------------------------------------------------------
local Macro = Macro
if not Macro then
  Macro = function () end
end

-- Find folder -->
---------------------------------------- Find file with clipboard text
Macro {
  area = "Shell",
  key = "AltF8",
  flags = "DisableOutput",
  description = "Find: Find files with text…",
  action = function ()
             Keys"AltF7 Tab CtrlV ShiftTab"
             exit()
           end,
} ---
---------------------------------------- Find file with clipboard namepart
Macro {
  area = "Shell",
  key = "CtrlAltF8",
  flags = "DisableOutput",
  description = "Find: Find files with namepart…",
  action = function ()
             Keys"AltF7"
             print"**.*"
             Keys"Home Right CtrlV"
             exit()
           end,
} ---
--------------------------------------------------------------------------------
