local nvu = require("user.nvu")

local colors = require("user.config.colors")
local ui = require("user.config.ui")
local settings = require("user.config.settings")
local mappings = require("user.config.mappings")
local tab_bar = require("user.config.tab-bar")

return nvu.tbl_deep_extend("force", {}, colors, ui, settings, mappings, tab_bar)
