data:extend({
{
    type = "string-setting",
    name = "peak-fuel-value",
    order = "a",
    setting_type = "startup",
    default_value = "1.21GJ",
  },
    {
    type = "string-setting",
    name = "floor-fuel-value",
    order = "b",
    setting_type = "startup",
    default_value = "2MJ",
  },
    {
    type = "int-setting",
    name = "color-multiplier",
    order = "c",
    setting_type = "startup",
    default_value = 2,
    minimum_value = 1
  },
    {
    type = "bool-setting",
    name = "lock-vanilla-fuels",
    order = "d",
    setting_type = "startup",
    default_value = true
  }
})