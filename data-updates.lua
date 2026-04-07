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

--heat stuff

-- heat_glow_tint = {r=1.0, g=0.63, b=0.39}

-- data.raw["heat-pipe"]["heat-pipe"]. heat_glow_sprites = make_heat_pipe_pictures("__NicerFuelGlow__/heat-stuff/heat-pipe/", "heated",
      -- {
        -- single = { empty = true },
        -- straight_vertical = { variations = 6 },
        -- straight_horizontal = { variations = 6 },
        -- corner_right_up = { name = "corner-up-right", variations = 6 },
        -- corner_left_up = { name = "corner-up-left", variations = 6 },
        -- corner_right_down = { name = "corner-down-right", variations = 6 },
        -- corner_left_down = { name = "corner-down-left", variations = 6 },
        -- t_up = {},
        -- t_down = {},
        -- t_right = {},
        -- t_left = {},
        -- cross = { name = "t" },
        -- ending_up = {},
        -- ending_down = {},
        -- ending_right = {},
        -- ending_left = {}
      -- })

  
-- data.raw["heat-pipe"]["heat-pipe"].heat_buffer.heat_glow =
      -- {
        -- filename = "__base__/graphics/entity/heat-pipe/heated-glow.png",
        -- priority = "extra-high",
        -- width = 55,
        -- height = 55,
        -- tint = heat_glow_tint
      -- }
-- data.raw["reactor"]["nuclear-reactor"].heat_buffer.heat_glow =
      -- {
        -- filename = "__base__/graphics/entity/nuclear-reactor/reactor-heat-glow.png",
        -- priority = "extra-high",
        -- width = 188,
        -- height = 190,
        -- tint = heat_glow_tint,
        -- shift = util.by_pixel(-2, -4)
      -- }
	  
-- data.raw["reactor"]["nuclear-reactor"].heat_lower_layer_picture =
    -- {
      -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/reactor-pipes-heated.png",
      -- width = 156,
      -- height = 156,
      -- shift = util.by_pixel(-3, -4),
      -- hr_version =
      -- {
        -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/hr-reactor-pipes-heated.png",
        -- width = 320,
        -- height = 316,
        -- scale = 0.5,
        -- shift = util.by_pixel(-0.5, -4.5),
      -- }
    -- }
-- data.raw["reactor"]["nuclear-reactor"].heat_buffer.heat_picture =
      -- {
        -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/reactor-heated.png",
        -- width = 108,
        -- height = 128,
        -- shift = util.by_pixel(1, -7),
        -- hr_version =
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/hr-reactor-heated.png",
          -- width = 216,
          -- height = 256,
          -- scale = 0.5,
          -- shift = util.by_pixel(3, -6.5),
        -- }
      -- }
-- data.raw["reactor"]["nuclear-reactor"].heat_connection_patches_connected =
    -- {
      -- sheet =
      -- {
        -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/reactor-connect-patches-heated.png",
        -- width = 32,
        -- height = 32,
        -- variation_count = 12,
        -- hr_version =
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          -- width = 64,
          -- height = 64,
          -- variation_count = 12,
          -- scale = 0.5
        -- }
      -- }
    -- }

-- data.raw["reactor"]["nuclear-reactor"].heat_connection_patches_disconnected =
    -- {
      -- sheet =
      -- {
        -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/reactor-connect-patches-heated.png",
        -- width = 32,
        -- height = 32,
        -- variation_count = 12,
        -- y = 32,
        -- hr_version =
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          -- width = 64,
          -- height = 64,
          -- variation_count = 12,
          -- y = 64,
          -- scale = 0.5
        -- }
      -- }
    -- }
-- data.raw.boiler["heat-exchanger"].energy_source.heat_glow =
      -- {
        -- north =
        -- {
          -- filename = "__base__/graphics/entity/heat-exchanger/heatex-N-glow.png",
          -- priority = "extra-high",
          -- width = 38,
          -- height = 70,
          -- tint = heat_glow_tint,
          -- shift = util.by_pixel(0, 8)
        -- },
        -- east =
        -- {
          -- filename = "__base__/graphics/entity/heat-exchanger/heatex-E-glow.png",
          -- priority = "extra-high",
          -- width = 60,
          -- height = 62,
		  -- tint = heat_glow_tint,
          -- shift = util.by_pixel(-22, -12)
        -- },
        -- south =
        -- {
          -- filename = "__base__/graphics/entity/heat-exchanger/heatex-S-glow.png",
          -- priority = "extra-high",
          -- width = 38,
          -- height = 40,
          -- tint = heat_glow_tint,
          -- shift = util.by_pixel(0, -36)
        -- },
        -- west =
        -- {
          -- filename = "__base__/graphics/entity/heat-exchanger/heatex-W-glow.png",
          -- priority = "extra-high",
          -- width = 60,
          -- height = 64,
		  -- tint = heat_glow_tint,
          -- shift = util.by_pixel(20, -12)
        -- },
      -- }
-- data.raw.boiler["heat-exchanger"].energy_source.heat_picture =
      -- {
        -- north =
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff//heat-exchanger/heatex-N-heated.png",
          -- priority = "extra-high",
          -- width = 24,
          -- height = 48,
          -- shift = util.by_pixel(-1, 8),
          -- hr_version =
          -- {
            -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/hr-heatex-N-heated.png",
            -- priority = "extra-high",
            -- width = 44,
            -- height = 96,
            -- shift = util.by_pixel(-0.5, 8.5),
            -- scale = 0.5
          -- }
        -- },
        -- east =
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/heatex-E-heated.png",
          -- priority = "extra-high",
          -- width = 40,
          -- height = 40,
          -- shift = util.by_pixel(-21, -13),
          -- hr_version =
          -- {
            -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/hr-heatex-E-heated.png",
            -- priority = "extra-high",
            -- width = 80,
            -- height = 80,
            -- shift = util.by_pixel(-21, -13),
            -- scale = 0.5
          -- }
        -- },
        -- south =
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/heatex-S-heated.png",
          -- priority = "extra-high",
          -- width = 16,
          -- height = 20,
          -- shift = util.by_pixel(-1, -30),
          -- hr_version =
          -- {
            -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/hr-heatex-S-heated.png",
            -- priority = "extra-high",
            -- width = 28,
            -- height = 40,
            -- shift = util.by_pixel(-1, -30),
            -- scale = 0.5
          -- }
        -- },
        -- west =
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/heatex-W-heated.png",
          -- priority = "extra-high",
          -- width = 32,
          -- height = 40,
          -- shift = util.by_pixel(23, -13),
          -- hr_version =
          -- {
            -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/hr-heatex-W-heated.png",
            -- priority = "extra-high",
            -- width = 64,
            -- height = 76,
            -- shift = util.by_pixel(23, -13),
            -- scale = 0.5
          -- }
        -- },
      -- }
-- data.raw.boiler["heat-exchanger"].energy_source.heat_pipe_covers =
        -- make_4way_animation_from_spritesheet(
        -- {
          -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/heatex-endings-heated.png",
          -- width = 32,
          -- height = 32,
          -- direction_count = 4,
          -- hr_version =
          -- {
            -- filename = "__NicerFuelGlow__/heat-stuff/heat-exchanger/hr-heatex-endings-heated.png",
            -- width = 64,
            -- height = 64,
            -- direction_count = 4,
            -- scale = 0.5
          -- }
        -- })