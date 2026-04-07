if settings.startup["lock-vanilla-fuels"].value then  

  local wood = table.deepcopy(data.raw.item["wood"])
  wood.fuel_glow_color = {r = 1, g = 0.25, b = 0.1, a = 0.2}
  
  local coal = table.deepcopy(data.raw.item["coal"])
  coal.fuel_glow_color = {r = 1, g = 0.5, b = 0.2, a = 0.4}

  local solidfuel = table.deepcopy(data.raw.item["solid-fuel"])
  solidfuel.fuel_glow_color = {r = 1, g = 0.75, b = 0.3, a = 0.6}

  local rocketfuel = table.deepcopy(data.raw.item["rocket-fuel"])
  rocketfuel.fuel_glow_color = {r = 1, g = 1, b = 0.4, a = 0.8}

  local nuclearreactorfuel = table.deepcopy(data.raw.item["uranium-fuel-cell"])
  nuclearreactorfuel.fuel_glow_color = {r = 0.2, g = 0.96, b = 0.137, a = 1}
  
  local nuclearfuel = table.deepcopy(data.raw.item["nuclear-fuel"])
  nuclearfuel.fuel_glow_color = {r = 0.75, g = 1, b = 0.5, a = 1}  
  
  data:extend{ wood, coal, solidfuel, rocketfuel, nuclearreactorfuel, nuclearfuel}

end
