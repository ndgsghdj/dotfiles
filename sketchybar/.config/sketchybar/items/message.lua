local constants = require("constants")
local settings = require("config.settings")

local message = sbar.add("item", constants.items.MESSAGE, {
  width = 0,
  position = "center",
  popup = { align = "center" },
  label = {
    padding_left = 0,
    padding_right = 0,
  },
  background = {
    padding_left = 0,
    padding_right = 0,
  }
})

local messagePopup = sbar.add("item", {
  position = "popup." .. message.name,
  width = "dynamic",
  label = {
    padding_right = settings.dimens.padding.label,
    padding_left = settings.dimens.padding.label,
  },
  icon = {
    padding_left = 0,
    padding_right = 0,
  },
})

local function showPopup(messageToShow)
  message:set({ popup = { drawing = true } })
  messagePopup:set({ label = { string = messageToShow } })
  sbar.exec("sleep " .. tonumber(5), function()
    message:set({ popup = { drawing = false } })
  end)
end

message:subscribe(constants.events.SEND_MESSAGE, function(env)
  showPopup(env.MESSAGE)
end)
