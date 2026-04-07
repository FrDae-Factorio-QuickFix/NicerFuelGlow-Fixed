--/c game.player.print(game.item_prototypes["coal"].fuel_glow_color)

--function to check 10^x unit, convert to base 10^1
local function joulify(energyvalue)		
			if energyvalue:find("YJ") ~= nil then
				joulevalue = ((energyvalue:gsub("YJ", "")) * (10^24))
				return joulevalue end
			if energyvalue:find("ZJ") ~= nil then
				joulevalue = ((energyvalue:gsub("ZJ", "")) * (10^21))
				return joulevalue end
			if energyvalue:find("EJ") ~= nil then
				joulevalue = ((energyvalue:gsub("EJ", "")) * (10^18))
				return joulevalue end
			if energyvalue:find("PJ") ~= nil then
				joulevalue = ((energyvalue:gsub("PJ", "")) * (10^15))
				return joulevalue end
			if energyvalue:find("TJ") ~= nil then
				joulevalue = ((energyvalue:gsub("TJ", "")) * (10^12))
				return joulevalue end
			if energyvalue:find("GJ") ~= nil then
				joulevalue = ((energyvalue:gsub("GJ", "")) * (10^9))
				return joulevalue end
			if energyvalue:find("MJ") ~= nil then
				joulevalue = ((energyvalue:gsub("MJ", "")) * (10^6))
				return joulevalue end
			if energyvalue:find("KJ") ~= nil then
				joulevalue = ((energyvalue:gsub("KJ", "")) * (10^3))
				return joulevalue end
			if energyvalue:find("kJ") ~= nil then
				joulevalue = ((energyvalue:gsub("kJ", "")) * (10^3))
				return joulevalue end
			--if energyvalue:find("J") ~= nil then
				joulevalue = energyvalue:gsub("J", "")
				return joulevalue --end
end

--retrieve settings
--root all values to compress the high-end variance i.e. have as much visual change from 1mj->2mj as 4gj->8gj
local cl_index = 1 / settings.startup["color-multiplier"].value
--create scale to place fuels from high end to low end
local cl_scale = joulify(settings.startup["peak-fuel-value"].value) ^ cl_index
--lock lowest fuel around 0.1 so it's visible at all
local floor_tweak = 0.1 / ((joulify(settings.startup["floor-fuel-value"].value) ^ cl_index) / cl_scale)

--search through items
for i, thisitem in pairs(data.raw.item) do
	--eliminate fuels already colored
	if thisitem.fuel_glow_color then
		goto skipitem

		--find all other fuels
		elseif thisitem.fuel_value then
			--retrieve each converted fuel value
			local fl_value = joulify(thisitem.fuel_value)
			--thought I had to convert the string to a number before maths. nope!
			--scale value relative to peak value, 0.1ish to 1
			local colorvalue = ((fl_value ^ cl_index) / cl_scale)
			--floor antiweight to keep the red end red. scale against 0-1 value - the closer to 1, the less change
			colorvalue = colorvalue + (((colorvalue * floor_tweak) - colorvalue) * (1 - colorvalue))
			--assign glow colours
			local blue = colorvalue
			local green = colorvalue * 2.5
			local red = 1
			-- high end whitification - excess green spills over
			if green > 1 then
				local excess = (green - 1) / 2
				green = 1
				blue = blue + excess
				-- highest end bluification
				if blue > 1 then
					excess = (blue - 1) / 9
					blue = 1
					green = green - (excess * 4)
					red = red - (excess * 5)
				end
			end	

			--tidy up values
			red		= math.max( 1, (math.min( 255, (math.ceil(red*255)) )) )
			green 	= math.max( 1, (math.min( 255, (math.ceil(green*255)) )) )
			blue 	= math.max( 1, (math.min( 255, (math.ceil(blue*255)) )) )
			--insert back into fuel table
			thisitem.fuel_glow_color = {r = red, g = green, b = blue}
	end
	::skipitem::
end