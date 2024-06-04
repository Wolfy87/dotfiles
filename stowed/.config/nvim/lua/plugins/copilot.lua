-- [nfnl] Compiled from fnl/plugins/copilot.fnl by https://github.com/Olical/nfnl, do not edit.
local uu = require("dotfiles.util")
local function _1_()
  local copilot = require("copilot")
  return copilot.setup({panel = {auto_refresh = true}, suggestion = {auto_trigger = true}})
end
return {uu.tx("zbirenbaum/copilot.lua", {cmd = "Copilot", event = "BufEnter", config = _1_}), uu.tx("CopilotC-Nvim/CopilotChat.nvim", {branch = "canary", event = "BufEnter", dependencies = {"zbirenbaum/copilot.lua"}, opts = {debug = false}})}
