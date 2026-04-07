require("util")
require("fuels")

local electric_furnace = data.raw.furnace["electric-furnace"]
if electric_furnace then
  -- Initialize working_visualisations if it doesn't exist
  if not electric_furnace.working_visualisations then
    electric_furnace.working_visualisations = {}
  end

  table.insert(electric_furnace.working_visualisations, {
    light = {
      intensity = 0.4,
      size = 9,
      color = {r = 1, g = 0.625, b = 0.25}
    }
  })
end
