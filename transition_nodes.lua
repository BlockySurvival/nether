local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)

minetest.register_node("nether:gold_ore", {
	description = S("Nether Gold Ore"),
	tiles = { "nether_rack_new.png^mcl_nether_gold_ore.png" },
	is_ground_content = true,
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{ items = { "default:gold_lump 2" }, rarity = 5 },
			{ items = { "default:gold_lump 1" } },
		}
	},
})

minetest.register_node("nether:gold_ore_deep", {
	description = S("Nether Gold Ore"),
	tiles = { "nether_rack_deep.png^mcl_nether_gold_ore.png" },
	is_ground_content = true,
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{ items = { "default:gold_lump 2" }, rarity = 5 },
			{ items = { "default:gold_lump 1" } },
		}
	},
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "nether:gold_ore_deep",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "nether:gold_ore",
	cooktime = 10,
})



minetest.register_node("nether:blackstone", {
	description = S("Blackstone"),
	tiles = {"mcl_blackstone.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


minetest.register_node("nether:blackstone_polished", {
	description = S("Polished Blackstone"),
	tiles = {"mcl_blackstone_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


minetest.register_node("nether:blackstone_chiseled_polished", {
	description = S("Chieseled Polished Blackstone"),
	tiles = {"mcl_blackstone_chiseled_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


minetest.register_node("nether:blackstone_brick_polished", {
	description = S("Polished Blackstone Bricks"),
	tiles = {"mcl_blackstone_polished_bricks.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})






minetest.register_craft({
	output = 'nether:blackstone_polished 4',
	recipe = {
		{'nether:blackstone','nether:blackstone'},
		{'nether:blackstone','nether:blackstone'},
	}
})
minetest.register_craft({
	output = 'nether:blackstone_chiseled_polished 2',
	recipe = {
		{'nether:blackstone_polished'},
		{'nether:blackstone_polished'},
	}
})
minetest.register_craft({
	output = 'nether:blackstone_brick_polished 4',
	recipe = {
		{'nether:blackstone_polished','nether:blackstone_polished'},
		{'nether:blackstone_polished','nether:blackstone_polished'},
	}
})


minetest.register_node("nether:gold_ore_blackstone", {
	description = S("Nether Gold Ore"),
	tiles = { "mcl_blackstone.png^mcl_nether_gold_ore.png" },
	is_ground_content = true,
	groups = {cracky = 2},
	drop = {
		max_items = 1,
		items = {
			{ items = { "default:gold_lump 3" }, rarity = 5 },
			{ items = { "default:gold_lump 2" }, rarity = 5 },
			{ items = { "default:gold_lump 1" } },
		}
	},
})


minetest.register_node("nether:small_tooth", {
	description = S("Small Fosilised Tooth"),
	drawtype = "mesh",
	mesh = "small-tooth.obj",
	tiles = {
		"default_coral_skeleton.png",
	},
	-- use_texture_alpha = "blend",
	paramtype2 = "facedir",
	is_ground_content = false,
	sunlight_propagates = true,
	groups = {cracky=2},
	selection_box = {
		type = "fixed",
		fixed = {-0.185, -0.5, -0.333, 0.185, 0.5, 0.333},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.185, -0.5, -0.333, 0.185, 0.5, 0.333},
	},
})


minetest.register_node("nether:large_tooth", {
	description = S("Large Fosilised Tooth"),
	drawtype = "mesh",
	mesh = "large-tooth.obj",
	tiles = {
		"default_coral_skeleton.png",
	},
	-- use_texture_alpha = "blend",
	paramtype2 = "facedir",
	is_ground_content = false,
	sunlight_propagates = true,
	groups = {cracky=2},
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.4, 0.25, 1.5, 0.4},
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.4, 0.25, 1.5, 0.4},
	},
})

-- Crystals

local function crystal(color, color_ratio, system_name, human_name_big, human_name_med)

	local base_name = "nether:"..system_name.."_crystal"

	local big = base_name.."_big"
	local big_30 = big.."_30"
	local big_30_45 = big_30.."_45"

	local med = base_name.."_med"
	local med_30 = med.."_30"
	local med_30_45 = med_30.."_45"

	local colorize = "^[colorize:"..color..":"..tostring(color_ratio)

	minetest.register_node(big, {
		description = human_name_big,
		drawtype = "mesh",
		mesh = "hex_crystal_big.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		sunlight_propagates = true,
		light_source = 12,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 3, 0.5},
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 3, 0.5},
		},
	})

	minetest.register_node(med, {
		description = human_name_med,
		drawtype = "mesh",
		mesh = "hex_crystal_med.obj",
		tiles = {
			"nether_crystal_med.png"..colorize,
			"nether_crystal_small.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		sunlight_propagates = true,
		light_source = 12,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 1.25, 0.25},
		},
		collision_box = {
			type = "fixed",
			fixed = {-0.25, -0.5, -0.25, 0.25, 1.25, 0.25},
		},
	})

	minetest.register_node(big_30, {
		description = human_name_big,
		drawtype = "mesh",
		mesh = "hex_crystal_30_big.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = big,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.625, 0.5, 0.5, 0.375},
				{-0.5, 0.5, -1.25, 0.5, 1.5, -0.25},
				{-0.5, 1.5, -1.875, 0.5, 2.5, -0.875},
				--The following is a more accurate set of collision boxes that theoretically
				--allows the crystal to be climbed like stairs, but in practice the physics
				--don't seem to work quite right so I'm leaving it "simple" for now.
				-- {-0.5, -0.5, -0.625, 0.5, 0.0, 0.375},
				-- {-0.5, 0.0, -0.9375, 0.5, 0.5, 0.0625},
				-- {-0.5, 0.5, -1.25, 0.5, 1.0, -0.25},
				-- {-0.5, 1.0, -1.5625, 0.5, 1.5, -0.5625},
				-- {-0.5, 1.5, -1.875, 0.5, 2.0, -0.875},
				-- {-0.25, 2.0, -1.625, 0.25, 2.5, -1.125},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.625, 0.5, 0.5, 0.375},
				{-0.5, 0.5, -1.25, 0.5, 1.5, -0.25},
				{-0.5, 1.5, -1.875, 0.5, 2.5, -0.875},
				-- {-0.5, -0.5, -0.625, 0.5, 0.0, 0.375},
				-- {-0.5, 0.0, -0.9375, 0.5, 0.5, 0.0625},
				-- {-0.5, 0.5, -1.25, 0.5, 1.0, -0.25},
				-- {-0.5, 1.0, -1.5625, 0.5, 1.5, -0.5625},
				-- {-0.5, 1.5, -1.875, 0.5, 2.0, -0.875},
				-- {-0.25, 2.0, -1.625, 0.25, 2.5, -1.125},
			},
		},
	})

	minetest.register_node(med_30, {
		description = human_name_med,
		drawtype = "mesh",
		mesh = "hex_crystal_30_med.obj",
		tiles = {
			"nether_crystal_med.png"..colorize,
			"nether_crystal_small.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = med,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.3125, 0.25, 0.0, 0.1875},
				{-0.25, 0.0, -0.625, 0.25, 0.5, -0.125},
				{-0.25, 0.5, -0.9375, 0.25, 1.0, -0.4375},
			}
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.25, -0.5, -0.3125, 0.25, 0.0, 0.1875},
				{-0.25, 0.0, -0.625, 0.25, 0.5, -0.125},
				{-0.25, 0.5, -0.9375, 0.25, 1.0, -0.4375},
			},
		},
	})

	minetest.register_node(big_30_45, {
		description = human_name_big,
		drawtype = "mesh",
		mesh = "hex_crystal_30_45_big.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = big,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.625, 0.625, 0.5, 0.375},
				{0.0625, 0.5, -1.0625, 1.0625, 1.5, -0.0625},
				{0.5, 1.5, -1.5, 1.5, 2.5, -0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.375, -0.5, -0.625, 0.625, 0.5, 0.375},
				{0.0625, 0.5, -1.0625, 1.0625, 1.5, -0.0625},
				{0.5, 1.5, -1.5, 1.5, 2.5, -0.5},
			},
		},
	})

	minetest.register_node(med_30_45, {
		description = human_name_med,
		drawtype = "mesh",
		mesh = "hex_crystal_30_45_med.obj",
		tiles = {
			"nether_crystal_large.png"..colorize,
			"nether_crystal_med.png"..colorize,
		},
		post_effect_color = color,
		use_texture_alpha = "blend",
		paramtype = "light",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		is_ground_content = false,
		light_source = 12,
		drop = med,
		groups = {cracky=2, dfcaverns_crystal_big = 1},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.3125, 0.3125, 0.0, 0.1875},
				{0.03125, 0.0, -0.53125, 0.53125, 0.5, -0.03125},
				{0.25, 0.5, -0.75, 0.75, 1.0, -0.25},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.1875, -0.5, -0.3125, 0.3125, 0.0, 0.1875},
				{0.03125, 0.0, -0.53125, 0.53125, 0.5, -0.03125},
				{0.25, 0.5, -0.75, 0.75, 1.0, -0.25},
			},
		},
	})


	minetest.register_craft({
		output = med..' 6',
		type = "shapeless",
		recipe = {big},
	})
	minetest.register_craft({
		output = med_30..' 6',
		type = "shapeless",
		recipe = {big_30},
	})
	minetest.register_craft({
		output = med_30_45..' 6',
		type = "shapeless",
		recipe = {big_30_45},
	})

	minetest.register_craft({
		output = big,
		recipe = {
			{med,med},
			{med,med},
			{med,med}
		},
	})
	minetest.register_craft({
		output = big_30,
		recipe = {
			{med_30,med_30},
			{med_30,med_30},
			{med_30,med_30}
		},
	})
	minetest.register_craft({
		output = big_30_45,
		recipe = {
			{med_30_45,med_30_45},
			{med_30_45,med_30_45},
			{med_30_45,med_30_45}
		},
	})



	minetest.register_craft({
		output = big..' 3',
		recipe = {
			{big_30},
			{big_30},
			{big_30}
		},
	})
	minetest.register_craft({
		output = big..' 3',
		recipe = {
			{big_30_45},
			{big_30_45},
			{big_30_45}
		},
	})

	minetest.register_craft({
		output = big_30..' 3',
		recipe = {
			{"","",big},
			{"",big,""},
			{big,"",""}
		},
	})
	minetest.register_craft({
		output = big_30..' 3',
		recipe = {
			{"","",big_30_45},
			{"",big_30_45,""},
			{big_30_45,"",""}
		},
	})

	minetest.register_craft({
		output = big_30_45..' 3',
		recipe = {
			{"",big},
			{"",big},
			{big,""}
		},
	})
	minetest.register_craft({
		output = big_30_45..' 3',
		recipe = {
			{"",big_30},
			{"",big_30},
			{big_30,""}
		},
	})


	minetest.register_craft({
		output = med..' 3',
		recipe = {
			{med_30},
			{med_30},
			{med_30}
		},
	})
	minetest.register_craft({
		output = med..' 3',
		recipe = {
			{med_30_45},
			{med_30_45},
			{med_30_45}
		},
	})

	minetest.register_craft({
		output = med_30..' 3',
		recipe = {
			{"","",med},
			{"",med,""},
			{med,"",""}
		},
	})
	minetest.register_craft({
		output = med_30..' 3',
		recipe = {
			{"","",med_30_45},
			{"",med_30_45,""},
			{med_30_45,"",""}
		},
	})

	minetest.register_craft({
		output = med_30_45..' 3',
		recipe = {
			{"",med},
			{"",med},
			{med,""}
		},
	})
	minetest.register_craft({
		output = med_30_45..' 3',
		recipe = {
			{"",med_30},
			{"",med_30},
			{med_30,""}
		},
	})
end

crystal('#000000', 200, "shadow", S("Giant Shadow Crystal"), S("Shadow Crystal"))
crystal('#ffffff', 100, "life", S("Giant Life Crystal"), S("Life Crystal"))
crystal('#7a0101', 128, "nether", S("Giant Nether Crystal"), S("Nether Crystal"))
crystal('#1ecfeb', 128, "deep_nether", S("Giant Deep Nether Crystal"), S("Deep Nether Crystal"))





-- Nether nodes

minetest.register_node("nether:rack_new", {
	description = S("Netherrack"),
	tiles = {"nether_rack_new.png"},
	is_ground_content = true,
	-- setting workable_with_nether_tools reduces the wear on nether:pick_nether when mining this node
	groups = {cracky = 3, level = 2, workable_with_nether_tools = 3},
	sounds = default.node_sound_stone_defaults(),
})

-- Deep Netherrack, found in the mantle / central magma layers
minetest.register_node("nether:rack_deep", {
	description = S("Deep Netherrack"),
	_doc_items_longdesc = S("Netherrack from deep in the mantle"),
	tiles = {"nether_rack_deep.png"},
	is_ground_content = true,
	-- setting workable_with_nether_tools reduces the wear on nether:pick_nether when mining this node
	groups = {cracky = 3, level = 2, workable_with_nether_tools = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:sand", {
	description = S("Nethersand"),
	tiles = {"nether_sand.png"},
	is_ground_content = true,
	groups = {crumbly = 3, level = 2, falling_node = 1},
	sounds = default.node_sound_gravel_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.45},
	}),
})

minetest.register_node("nether:glowstone", {
	description = S("Glowstone"),
	tiles = {"nether_glowstone.png"},
	is_ground_content = true,
	light_source = 14,
	paramtype = "light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

-- Deep glowstone, found in the mantle / central magma layers
minetest.register_node("nether:glowstone_deep", {
	description = S("Deep Glowstone"),
	tiles = {"nether_glowstone_deep.png"},
	is_ground_content = true,
	light_source = 14,
	paramtype = "light",
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("nether:brick", {
	description = S("Nether Brick"),
	tiles = {"nether_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:brick_compressed", {
	description = S("Compressed Netherbrick"),
	tiles = {"nether_brick_compressed.png"},
	groups = {cracky = 3, level = 2},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

-- A decorative node which can only be obtained from dungeons or structures
minetest.register_node("nether:brick_cracked", {
	description = S("Cracked Nether Brick"),
	tiles = {"nether_brick_cracked.png"},
	is_ground_content = false,
	groups = {cracky = 2, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

local fence_texture =
	"default_fence_overlay.png^nether_brick.png^default_fence_overlay.png^[makealpha:255,126,126"

minetest.register_node("nether:fence_nether_brick", {
	description = S("Nether Brick Fence"),
	drawtype = "fencelike",
	tiles = {"nether_brick.png"},
	inventory_image = fence_texture,
	wield_image = fence_texture,
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {cracky = 2, level = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:brick_deep", {
	description = S("Deep Nether Brick"),
	tiles = {{
		name        = "nether_brick_deep.png",
		align_style = "world",
		scale       = 2
	}},
	is_ground_content = false,
	groups = {cracky = 2, level = 2},
	sounds = default.node_sound_stone_defaults()
})

-- Register stair and slab

-- Nether bricks can be made into stairs, slabs, inner stairs, and outer stairs

stairs.register_stair_and_slab( -- this function also registers inner and outer stairs
	"nether_brick",                                    -- subname
	"nether:brick",                                    -- recipeitem
	{cracky = 2, level = 2},                           -- groups
	{"nether_brick.png"},                              -- images
	S("Nether Stair"),                                 -- desc_stair
	S("Nether Slab"),                                  -- desc_slab
	minetest.registered_nodes["nether:brick"].sounds,  -- sounds
	false,                                             -- worldaligntex
	S("Inner Nether Stair"),                           -- desc_stair_inner
	S("Outer Nether Stair")                            -- desc_stair_outer
)

stairs.register_stair_and_slab( -- this function also registers inner and outer stairs
	"nether_brick_deep",                                    -- subname
	"nether:brick_deep",                                    -- recipeitem
	{cracky = 2, level = 2},                                -- groups
	{"nether_brick_deep.png"},                              -- images
	S("Deep Nether Stair"),                                 -- desc_stair
	S("Deep Nether Slab"),                                  -- desc_slab
	minetest.registered_nodes["nether:brick_deep"].sounds,  -- sounds
	false,                                                  -- worldaligntex
	S("Inner Deep Nether Stair"),                           -- desc_stair_inner
	S("Outer Deep Nether Stair")                            -- desc_stair_outer
)

-- Netherrack can be shaped into stairs, slabs and walls

stairs.register_stair(
	"netherrack",
	"nether:rack_new",
	{cracky = 2, level = 2},
	{"nether_rack_new.png"},
	S("Netherrack stair"),
	minetest.registered_nodes["nether:rack_new"].sounds
)
stairs.register_slab( -- register a slab without adding inner and outer stairs
	"netherrack",
	"nether:rack_new",
	{cracky = 2, level = 2},
	{"nether_rack_new.png"},
	S("Deep Netherrack slab"),
	minetest.registered_nodes["nether:rack_new"].sounds
)

stairs.register_stair(
	"netherrack_deep",
	"nether:rack_deep",
	{cracky = 2, level = 2},
	{"nether_rack_deep.png"},
	S("Deep Netherrack stair"),
	minetest.registered_nodes["nether:rack_deep"].sounds
)
stairs.register_slab( -- register a slab without adding inner and outer stairs
	"netherrack_deep",
	"nether:rack_deep",
	{cracky = 2, level = 2},
	{"nether_rack_deep.png"},
	S("Deep Netherrack slab"),
	minetest.registered_nodes["nether:rack_deep"].sounds
)

-- Connecting walls
if minetest.get_modpath("walls") and minetest.global_exists("walls") and walls.register ~= nil then
	walls.register("nether:rack_wall",      "A Netherrack wall",      "nether_rack_new.png",      "nether:rack_new",      minetest.registered_nodes["nether:rack_new"].sounds)
	walls.register("nether:rack_deep_wall", "A Deep Netherrack wall", "nether_rack_deep.png", "nether:rack_deep", minetest.registered_nodes["nether:rack_deep"].sounds)
end

-- StairsPlus

if minetest.get_modpath("moreblocks") then
	-- Registers about 49 different shapes of nether brick, replacing the stairs & slabs registered above.
	-- (This could also be done for deep nether brick, but I've left that out to avoid a precedent of 49 new
	-- nodes every time the nether gets a new material. Nether structures won't be able to use them because
	-- they can't depend on moreblocks)
	stairsplus:register_all(
		"nether", "brick", "nether:brick", {
			description = S("Nether Brick"),
			groups = {cracky = 2, level = 2},
			tiles = {"nether_brick.png"},
			sounds = minetest.registered_nodes["nether:brick"].sounds,
	})
end


-- Mantle nodes

-- Nether basalt is intended as a valuable material and possible portalstone - an alternative to
-- obsidian that's available for other mods to use.
-- It cannot be found in the regions of the nether where Nether portals link to, so requires a journey to obtain.
minetest.register_node("nether:basalt", {
	description = S("Nether Basalt"),
	_doc_items_longdesc = S("Columns of dark basalt found only in magma oceans deep within the Nether."),
	tiles = {
		"nether_basalt.png",
		"nether_basalt.png",
		"nether_basalt_side.png",
		"nether_basalt_side.png",
		"nether_basalt_side.png",
		"nether_basalt_side.png"
	},
	is_ground_content = true,
	groups = {cracky = 1, level = 3}, -- set proper digging times and uses, and maybe explosion immune if api handles that
	on_blast = function() --[[blast proof]] end,
	sounds = default.node_sound_stone_defaults(),
})

-- Potentially a portalstone, but will also be a stepping stone between basalt
-- and chiseled basalt.
-- It can only be introduced by the biomes-based mapgen, since it requires the
-- MT 5.0 world-align texture features.
minetest.register_node("nether:basalt_hewn", {
	description = S("Hewn Basalt"),
	_doc_items_longdesc = S("A rough cut solid block of Nether Basalt."),
	tiles = {{
		name        = "nether_basalt_hewn.png",
		align_style = "world",
		scale       = 2
	}},
	inventory_image = minetest.inventorycube(
		"nether_basalt_hewn.png^[sheet:2x2:0,0",
		"nether_basalt_hewn.png^[sheet:2x2:0,1",
		"nether_basalt_hewn.png^[sheet:2x2:1,1"
	),
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	on_blast = function() --[[blast proof]] end,
	sounds = default.node_sound_stone_defaults(),
})

-- Chiselled basalt is intended as a portalstone - an alternative to obsidian that's
-- available for other mods to use. It is crafted from Hewn Basalt.
-- It should only be introduced by the biomes-based mapgen, since in future it may
-- require the MT 5.0 world-align texture features.
minetest.register_node("nether:basalt_chiselled", {
	description = S("Chiselled Basalt"),
	_doc_items_longdesc = S("A finely finished block of solid Nether Basalt."),
	tiles = {
		"nether_basalt_chiselled_top.png",
		"nether_basalt_chiselled_top.png" .. "^[transformFY",
		"nether_basalt_chiselled_side.png",
		"nether_basalt_chiselled_side.png",
		"nether_basalt_chiselled_side.png",
		"nether_basalt_chiselled_side.png"
	},
	inventory_image = minetest.inventorycube(
		"nether_basalt_chiselled_top.png",
		"nether_basalt_chiselled_side.png",
		"nether_basalt_chiselled_side.png"
	),
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	on_blast = function() --[[blast proof]] end,
	sounds = default.node_sound_stone_defaults(),
})

-- lava_crust nodes can only be used in the biomes-based mapgen, since they require
-- the MT 5.0 world-align texture features.
minetest.register_node("nether:lava_crust", {
	description = S("Lava Crust"),
	_doc_items_longdesc = S("A thin crust of cooled lava with liquid lava beneath"),
	_doc_items_usagehelp = S("Lava crust is strong enough to walk on, but still hot enough to inflict burns."),
	tiles = {
		{
			name="nether_lava_crust_animated.png",
			backface_culling=true,
			tileable_vertical=true,
			tileable_horizontal=true,
			align_style="world",
			scale=2,
			animation = {
				type = "vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 1.8,
			},
		}
	},
	inventory_image = minetest.inventorycube(
		"nether_lava_crust_animated.png^[sheet:2x48:0,0",
		"nether_lava_crust_animated.png^[sheet:2x48:0,1",
		"nether_lava_crust_animated.png^[sheet:2x48:1,1"
	),
	collision_box = {
		type = "fixed",
		fixed = {
			-- Damage is calculated "starting 0.1 above feet
			-- and progressing upwards in 1 node intervals", so
			-- lower this node's collision box by more than 0.1
			-- to ensure damage will be taken when standing on
			-- the node.
			{-0.5, -0.5, -0.5, 0.5, 0.39, 0.5}
		},
	},
	selection_box = {
		type = "fixed",
		fixed = {
			-- Keep the selection box matching the visual node,
			-- rather than the collision_box.
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
		},
	},

	paramtype = "light",
	light_source = default.LIGHT_MAX - 3,
	buildable_to = false,
	walkable = true,
	is_ground_content = true,
	drop = {
		items = {{
			-- Allow SilkTouch-esque "pickaxes of preservation" to mine the lava crust intact, if PR #10141 gets merged.
			tools = {"this line will block early MT versions which don't respect the tool_groups restrictions"},
			tool_groups = {{"pickaxe", "preservation"}},
			items = {"nether:lava_crust"}
		}}
	},
	--liquid_viscosity = 7,
	damage_per_second = 2,
	groups = {oddly_breakable_by_hand = 3, cracky = 3, explody = 1, igniter = 1},
})


-- Fumaroles (Chimney's)

local function fumarole_startTimer(pos, timeout_factor)

	if timeout_factor == nil then timeout_factor = 1 end
	local next_timeout = (math.random(50, 900) / 10) * timeout_factor

	minetest.get_meta(pos):set_float("expected_timeout", next_timeout)
	minetest.get_node_timer(pos):start(next_timeout)
end

-- Create an LBM to start fumarole node timers
minetest.register_lbm({
	label = "Start fumarole smoke",
	name  = "nether:start_fumarole",
	nodenames = {"nether:fumarole"},
	run_at_every_load = true,
	action = function(pos, node)
		local node_above = minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z})
		if node_above.name == "air" then --and node.param2 % 4 == 0 then
			fumarole_startTimer(pos)
		end
	end
})

local function set_fire(pos, extinguish)
	local posBelow  = {x = pos.x, y = pos.y - 1, z = pos.z}

	if extinguish then
		if minetest.get_node(pos).name      == "fire:permanent_flame" then minetest.set_node(pos,      {name="air"}) end
		if minetest.get_node(posBelow).name == "fire:permanent_flame" then minetest.set_node(posBelow, {name="air"}) end

	elseif minetest.get_node(posBelow).name == "air" then
		minetest.set_node(posBelow, {name="fire:permanent_flame"})
	elseif minetest.get_node(pos).name == "air" then
		minetest.set_node(pos, {name="fire:permanent_flame"})
	end
end

local function fumarole_onTimer(pos, elapsed)

	local expected_timeout = minetest.get_meta(pos):get_float("expected_timeout")
	if elapsed > expected_timeout + 10 then
		-- The timer didn't fire when it was supposed to, so the chunk was probably inactive and has
		-- just been approached again, meaning *every* fumarole's on_timer is about to go off.
		-- Skip this event and restart the clock for a future random interval.
		fumarole_startTimer(pos, 1)
		return false
	end

	-- Fumaroles in the Nether can catch fire.
	-- (if taken to the surface and used as cottage chimneys, they don't catch fire)
	local inNether = true
	local canCatchFire = inNether and minetest.registered_nodes["fire:permanent_flame"] ~= nil
	local smoke_offset   = 0
	local timeout_factor = 1
	local smoke_time_adj = 1

	local posAbove = {x = pos.x, y = pos.y + 1, z = pos.z}
	local extinguish = minetest.get_node(posAbove).name ~= "air"

	if extinguish or (canCatchFire and math.floor(elapsed) % 7 == 0) then

		if not extinguish then
			-- fumarole gasses are igniting
			smoke_offset   = 1
			timeout_factor = 0.22 -- reduce burning time
		end

		set_fire(posAbove, extinguish)
		set_fire({x = pos.x + 1, y = pos.y + 1, z = pos.z},     extinguish)
		set_fire({x = pos.x - 1, y = pos.y + 1, z = pos.z},     extinguish)
		set_fire({x = pos.x,     y = pos.y + 1, z = pos.z + 1}, extinguish)
		set_fire({x = pos.x,     y = pos.y + 1, z = pos.z - 1}, extinguish)

	elseif inNether then

		if math.floor(elapsed) % 3 == 1 then
			-- throw up some embers / lava splash
			local embers_particlespawn_def = {
				amount = 6,
				time = 0.1,
				minpos = {x=pos.x - 0.1, y=pos.y + 0.0, z=pos.z - 0.1},
				maxpos = {x=pos.x + 0.1, y=pos.y + 0.2, z=pos.z + 0.1},
				minvel = {x = -.5, y = 4.5, z = -.5},
				maxvel = {x =  .5, y = 7,   z =  .5},
				minacc = {x = 0, y = -10, z = 0},
				maxacc = {x = 0, y = -10, z = 0},
				minexptime = 1.4,
				maxexptime = 1.4,
				minsize = .2,
				maxsize = .8,
				texture = "^[colorize:#A00:255",
				glow = 8
			}
			minetest.add_particlespawner(embers_particlespawn_def)
			embers_particlespawn_def.texture = "^[colorize:#A50:255"
			embers_particlespawn_def.maxvel.y = 3
			embers_particlespawn_def.glow = 12
			minetest.add_particlespawner(embers_particlespawn_def)

		else
			-- gas noises
			minetest.sound_play("nether_fumarole", {
				pos = pos,
				max_hear_distance = 60,
				gain = 0.24,
				pitch = math.random(35, 95) / 100
			})
		end

	else
		-- we're not in the Nether, so can afford to be a bit more smokey
		timeout_factor = 0.4
		smoke_time_adj = 1.3
	end

	-- let out some smoke
	minetest.add_particlespawner({
		amount = 12 * smoke_time_adj,
		time = math.random(40, 60) / 10 * smoke_time_adj,
		minpos = {x=pos.x - 0.2, y=pos.y + smoke_offset, z=pos.z - 0.2},
		maxpos = {x=pos.x + 0.2, y=pos.y + smoke_offset, z=pos.z + 0.2},
		minvel = {x=0, y=0.7, z=-0},
		maxvel = {x=0, y=0.8, z=-0},
		minacc = {x=0.0,y=0.0,z=-0},
		maxacc = {x=0.0,y=0.1,z=-0},
		minexptime = 5,
		maxexptime = 5.5,
		minsize = 1.5,
		maxsize = 7,
		texture = "nether_smoke_puff.png",
	})

	fumarole_startTimer(pos, timeout_factor)
	return false
end


minetest.register_node("nether:fumarole", {
	description=S("Fumarolic Chimney"),
	_doc_items_longdesc = S("A vent in the earth emitting steam and gas"),
	_doc_items_usagehelp = S("Can be repurposed to provide puffs of smoke in a chimney"),
	tiles = {"nether_rack_new.png"},
	on_timer = fumarole_onTimer,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		fumarole_onTimer(pos, 1)
		return false
	end,
	is_ground_content = true,
	groups = {cracky = 3, level = 2, fumarole=1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5000, -0.5000, -0.5000, -0.2500, 0.5000, 0.5000},
			{-0.5000, -0.5000, -0.5000, 0.5000, 0.5000, -0.2500},
			{-0.5000, -0.5000, 0.2500, 0.5000, 0.5000, 0.5000},
			{0.2500, -0.5000, -0.5000, 0.5000, 0.5000, 0.5000}
		}
	},
	selection_box = {type = 'fixed', fixed = {-.5, -.5, -.5, .5, .5, .5}}
})

minetest.register_node("nether:fumarole_slab", {
	description=S("Fumarolic Chimney Slab"),
	_doc_items_longdesc = S("A vent in the earth emitting steam and gas"),
	_doc_items_usagehelp = S("Can be repurposed to provide puffs of smoke in a chimney"),
	tiles = {"nether_rack_new.png"},
	is_ground_content = true,
	on_timer = fumarole_onTimer,
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		fumarole_onTimer(pos, 1)
		return false
	end,
	groups = {cracky = 3, level = 2, fumarole=1},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5000, -0.5000, -0.5000, -0.2500, 0.000, 0.5000},
			{-0.5000, -0.5000, -0.5000, 0.5000, 0.000, -0.2500},
			{-0.5000, -0.5000, 0.2500, 0.5000, 0.000, 0.5000},
			{0.2500, -0.5000, -0.5000, 0.5000, 0.000, 0.5000}
		}
	},
	selection_box = {type = 'fixed', fixed = {-.5, -.5, -.5, .5, 0, .5}},
	collision_box = {type = 'fixed', fixed = {-.5, -.5, -.5, .5, 0, .5}}
})

minetest.register_node("nether:fumarole_corner", {
	description=S("Fumarolic Chimney Corner"),
	tiles = {"nether_rack_new.png"},
	is_ground_content = true,
	groups = {cracky = 3, level = 2, fumarole=1},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2500, -0.5000, 0.5000, 0.000, 0.5000, 0.000},
			{-0.5000, -0.5000, 0.2500, 0.000, 0.5000, 0.000},
			{-0.5000, -0.5000, 0.2500, 0.000, 0.000, -0.5000},
			{0.000, -0.5000, -0.5000, 0.5000, 0.000, 0.5000}
		}
	},
	selection_box = {
		type = 'fixed',
		fixed = {
			{-.5, -.5, -.5, .5, 0, .5},
			{0, 0, .5, -.5, .5, 0},
		}
	}

})

-- nether:airlike_darkness is an air node through which light does not propagate.
-- Use of it should be avoided when possible as it has the appearance of a lighting bug.
-- Fumarole decorations use it to stop the propagation of light from the lava below,
-- since engine limitations mean any mesh or nodebox node will light up if it has lava
-- below it.
local airlike_darkness = {}
for k,v in pairs(minetest.registered_nodes["air"]) do airlike_darkness[k] = v end
airlike_darkness.paramtype = "none"
minetest.register_node("nether:airlike_darkness", airlike_darkness)






minetest.register_node("nether:heart_ore_deep", {
	description = "Nether Heart Ore",
	tiles = {"nether_rack_deep.png^nether_heart_ore_overlay.png"},
	groups = {cracky = 1, level = 2},
	drop = "nether:heart",
	on_blast = function (pos, intensity) end
})

if minetest.get_modpath("titanium") then
	minetest.register_node("nether:titanium_ore_deep", {
		description = "Titanium Ore",
		groups = {cracky = 1},
		tiles = {"nether_rack_deep.png^titanium_titanium_in_ground.png"},
		drop = "titanium:titanium"
	})
end




minetest.register_node("nether:heart_ore_new", {
	description = "Nether Heart Ore",
	tiles = {"nether_rack_new.png^nether_heart_ore_overlay.png"},
	groups = {cracky = 1, level = 2},
	drop = "nether:heart",
	on_blast = function (pos, intensity) end
})

if minetest.get_modpath("titanium") then
	minetest.register_node("nether:titanium_ore_new", {
		description = "Titanium Ore",
		groups = {cracky = 1},
		tiles = {"nether_rack_new.png^titanium_titanium_in_ground.png"},
		drop = "titanium:titanium"
	})
end

if minetest.get_modpath("technic_worldgen") then
	minetest.register_node("nether:sulfur_ore_new", {
		description = "Sulfur ore",
		groups = {cracky = 1},
		tiles = {"nether_rack_new.png^technic_mineral_sulfur.png"},
		drop = "technic:sulfur_lump",
	})
end
