local wezterm = require("wezterm")

local act = wezterm.action

local M = {}

--selene: allow(incorrect_standard_library_use)
---@diagnostic disable-next-line: deprecated
M.unpack = table.unpack or unpack

function M.utf8(decimal)
  if decimal < 128 then
    return string.char(decimal)
  end
  local charbytes = {}
  for bytes, vals in ipairs({ { 0x7FF, 192 }, { 0xFFFF, 224 }, { 0x1FFFFF, 240 } }) do
    if decimal <= vals[1] then
      for b = bytes + 1, 2, -1 do
        local mod = decimal % 64
        decimal = (decimal - mod) / 64
        charbytes[b] = string.char(128 + mod)
      end
      charbytes[1] = string.char(vals[2] + decimal)
      break
    end
  end
  return table.concat(charbytes)
end

function M.send_utf8(decimal)
  return act.SendString(M.utf8(decimal))
end

function M.send_escape(sequence)
  --selene: allow(bad_string_escape)
  return act.SendString("\x1b" .. sequence)
end

return M
