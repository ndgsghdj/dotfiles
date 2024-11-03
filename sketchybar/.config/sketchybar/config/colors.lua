pywal_colors = require("config.pywal_colors")

local colors <const> = {
  black = pywal_colors.color0,
  white = pywal_colors.foreground,
  red = pywal_colors.color9,
  green = pywal_colors.color10,
  blue = pywal_colors.color12,
  yellow = pywal_colors.color11,
  orange = pywal_colors.color2,
  magenta = pywal_colors.color13,
  purple = 0xff796fa9,
  other_purple = 0xff302c45,
  cyan = 0xff7bf2de,
  grey = 0xff7f8490,
  dirty_white = 0xc8cad3f5,
  dark_grey = 0xff2b2736,
  transparent = 0x00000000,
  bar = {
    bg = pywal_colors.background,
    border = pywal_colors.background,
  },
  popup = {
    bg = 0xf1151320,
    border = 0xff2c2e34,
  },
  slider = {
    bg = 0xf1151320,
    border = 0xff2c2e34,
  },
  bg1 = 0xd322212c,
  bg2 = 0xff302c45,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

return colors
