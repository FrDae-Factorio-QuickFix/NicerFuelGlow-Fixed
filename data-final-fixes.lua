local energyvalue = 0
local function joulify(energystring)
  if energystring:find("YJ") then
    energyvalue = energystring:gsub("YJ", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^24)
    end
  end
  if energystring:find("ZJ") then
    energyvalue = energystring:gsub("ZJ", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^21)
    end
  end
  if energystring:find("EJ") then
    energyvalue = energystring:gsub("EJ", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^18)
    end
  end
  if energystring:find("PJ") then
    energyvalue = energystring:gsub("PJ", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^15)
    end
  end
  if energystring:find("TJ") then
    energyvalue = energystring:gsub("TJ", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^12)
    end
  end
  if energystring:find("GJ") then
    energyvalue = energystring:gsub("GJ", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^9)
    end
  end
  if energystring:find("MJ") then
    energyvalue = energystring:gsub("MJ", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^6)
    end
  end
  if energystring:find("KJ") or energystring:find("kJ") then
    energyvalue = energystring:gsub("[Kk]J", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue) * (10^3)
    end
  end
  if energystring:find("J") then
    energyvalue = energystring:gsub("J", "")
    if tonumber(energyvalue) then
      return tonumber(energyvalue)
    end
  end
  -- failsafe
  return 0
end

-- Retrieve settings and compute conversion factors
local cl_index = 1 / settings.startup["color-multiplier"].value
local cl_scale = joulify(settings.startup["peak-fuel-value"].value) ^ cl_index
local floor_tweak = 0.1 / ((joulify(settings.startup["floor-fuel-value"].value) ^ cl_index) / cl_scale)

-- Search through items to update fuel glow colours
for _, thisitem in pairs(data.raw.item) do
  -- Skip if the item already has a glow color
  if thisitem.fuel_glow_color then
    goto skipitem
  elseif thisitem.fuel_value then
    local fl_value = joulify(thisitem.fuel_value)
    local colorvalue = (fl_value ^ cl_index) / cl_scale
    colorvalue = colorvalue + (((colorvalue * floor_tweak) - colorvalue) * (1 - colorvalue))
    
    local blue = colorvalue
    local green = colorvalue * 2.5
    local red = 1
    
    if green > 1 then
      local excess = (green - 1) / 2
      green = 1
      blue = blue + excess
      if blue > 1 then
        excess = (blue - 1) / 9
        blue = 1
        green = green - (excess * 4)
        red = red - (excess * 5)
      end
    end
    
    red   = math.max(1, math.min(255, math.ceil(red * 255)))
    green = math.max(1, math.min(255, math.ceil(green * 255)))
    blue  = math.max(1, math.min(255, math.ceil(blue * 255)))
    
    thisitem.fuel_glow_color = {r = red, g = green, b = blue}
  end
  ::skipitem::
end
