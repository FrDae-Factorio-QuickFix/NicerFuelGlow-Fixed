require("util")
require("fuels")

data.raw.furnace["stone-furnace"].working_visualisations =
	{
		{
		north_position = {0.0, 0.0},
		east_position = {0.0, 0.0},
		south_position = {0.0, 0.0},
		west_position = {0.0, 0.0},
		animation =
			{
			filename = "__base__/graphics/entity/stone-furnace/stone-furnace-fire.png",
			priority = "extra-high",
			line_length = 8,
			width = 20,
			height = 49,
			frame_count = 48,
			axially_symmetrical = false,
			direction_count = 1,
			shift = util.by_pixel(-0.5, 5.5),
			hr_version =
				{
				filename = "__base__/graphics/entity/stone-furnace/hr-stone-furnace-fire.png",
				priority = "extra-high",
				line_length = 8,
				width = 41,
				height = 100,
				frame_count = 48,
				axially_symmetrical = false,
				direction_count = 1,
				shift = util.by_pixel(-0.75, 5.5),
				scale = 0.5
				}
			},
		light = {intensity = 0.6, size = 1, color = {r=1.0, g=1.0, b=1.0}}
		}
	}

data.raw.furnace["steel-furnace"].working_visualisations =
	{
		{
		north_position = {0.0, 0.0},
		east_position = {0.0, 0.0},
		south_position = {0.0, 0.0},
		west_position = {0.0, 0.0},
		animation =
			{
			filename = "__base__/graphics/entity/steel-furnace/steel-furnace-fire.png",
			priority = "high",
			line_length = 8,
			width = 29,
			height = 40,
			frame_count = 48,
			direction_count = 1,
			shift = util.by_pixel(-0.5, 6),
			hr_version =
				{
				filename = "__base__/graphics/entity/steel-furnace/hr-steel-furnace-fire.png",
				priority = "high",
				line_length = 8,
				width = 57,
				height = 81,
				frame_count = 48,
				direction_count = 1,
				shift = util.by_pixel(-0.75, 5.75),
				scale = 0.5
				}
			},
		light = {intensity = 0.8, size = 1, color = {r = 1.0, g = 1.0, b = 1.0}}
		}
	}

data.raw["assembling-machine"]["oil-refinery"].working_visualisations =
	{
		{
		north_position = util.by_pixel(34, -65),
		east_position = util.by_pixel(-52, -61),
		south_position = util.by_pixel(-59, -82),
		west_position = util.by_pixel(57, -58),
		animation =
			{
			filename = "__base__/graphics/entity/oil-refinery/oil-refinery-fire.png",
			line_length = 10,
			width = 20,
			height = 40,
			frame_count = 60,
			animation_speed = 0.75,
			shift = util.by_pixel(0, -14),
			hr_version =
				{
				filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-fire.png",
				line_length = 10,
				width = 40,
				height = 81,
				frame_count = 60,
				animation_speed = 0.75,
				scale = 0.5,
				shift = util.by_pixel(0, -14.25)
				}
			},
		light = {intensity = 1, size = 5, color = {r = 1.0, g = 0.5, b = 0.2}}
		}
	}
		
table.insert(data.raw.furnace["electric-furnace"].working_visualisations, {
	light = {
		intensity = 0.4,
		size = 9,
		color = {r=1, g=0.625, b=0.25} } } )
		
-- refinery 0.9 but smol, stlfurnace 0.8, stnfurn 0.7, boiler 0.6, htxchng 0.5, electric 0.4
-- boilers stuck at 1 seemingly soooo
-- 1 boiler 1 refin 0.8 steel 0.6 stone 0.4 electric