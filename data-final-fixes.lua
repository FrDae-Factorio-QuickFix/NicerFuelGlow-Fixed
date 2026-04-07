--/c game.player.print(game.item_prototypes["coal"].fuel_glow_color)
--table.insert(thisitem, {fuel_glow_color = {r = 0, g = 0, b = 1} } ) goto skipitem

--retrieve settings

--root all values to compress the high-end variance i.e. have as much visual change from 1mj->2mj as 4gj->8gj
local cl_index = 1 / settings.startup["color-multiplier"].value

--create scale to place fuels from high end to low end
local cl_scale = settings.startup["peak-fuel-value"].value ^ cl_index

--lock lowest fuel around 0.1 so it's visible at all
local floor_tweak = 0.1 / ((settings.startup["floor-fuel-value"].value ^ cl_index) / cl_scale)

--search through items
for i, thisitem in pairs(data.raw.item) do
	--eliminate fuels already colored
	if thisitem.fuel_glow_color then
		goto skipitem
		--find all other fuels
		elseif thisitem.fuel_value then

			--retrieve fuel value
			local fl_value = thisitem.fuel_value

			--check 10^x unit, convert to base 10^1
			if fl_value:find("YJ") ~= nil then
				fl_value = ((fl_value:gsub("YJ", "")) * (10^24))
				goto nextstep end
			if fl_value:find("ZJ") ~= nil then
				fl_value = ((fl_value:gsub("ZJ", "")) * (10^21))
				goto nextstep end
			if fl_value:find("EJ") ~= nil then
				fl_value = ((fl_value:gsub("EJ", "")) * (10^18))
				goto nextstep end
			if fl_value:find("PJ") ~= nil then
				fl_value = ((fl_value:gsub("PJ", "")) * (10^15))
				goto nextstep end
			if fl_value:find("TJ") ~= nil then
				fl_value = ((fl_value:gsub("TJ", "")) * (10^12))
				goto nextstep end
			if fl_value:find("GJ") ~= nil then
				fl_value = ((fl_value:gsub("GJ", "")) * (10^9))
				goto nextstep end
			if fl_value:find("MJ") ~= nil then
				fl_value = ((fl_value:gsub("MJ", "")) * (10^6))
				goto nextstep end
			if fl_value:find("KJ") ~= nil then
				fl_value = ((fl_value:gsub("KJ", "")) * (10^3))
				goto nextstep end
			if fl_value:find("kJ") ~= nil then
				fl_value = ((fl_value:gsub("kJ", "")) * (10^3))
				goto nextstep end
			fl_value = fl_value:gsub("J", "")

			--thought I had to convert the string to a number before maths. nope!
			--fl_value = tonumber(fl_value)
			::nextstep::

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