data:extend({
{
    type = "int-setting",
    name = "peak-fuel-value",
    order = "a",
    setting_type = "startup",
    default_value = 1210000000,
    minimum_value = 2000001
  },
    {
    type = "int-setting",
    name = "floor-fuel-value",
    order = "b",
    setting_type = "startup",
    default_value = 2000000,
    minimum_value = 1
  },
    {
    type = "int-setting",
    name = "color-multiplier",
    order = "c",
    setting_type = "startup",
    default_value = 3,
    minimum_value = 2
  },
    {
    type = "bool-setting",
    name = "lock-vanilla-fuels",
    order = "d",
    setting_type = "startup",
    default_value = 1
  }
})