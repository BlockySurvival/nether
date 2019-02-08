-- Nether fumes (atmosphere)
minetest.register_node("nether:fumes", {
   descriptions = "Nether Fumes (you hacker you)",
   drawtype = "airlike",
   groups = {not_in_creative_inventory = 1},
   drop = "",
   walkable = false,
   pointable = false,
   diggable = false,
   buildable_to = true,
   sunlight_propagates = true,
   is_ground_content = false,
   floodable = false,
   paramtype = "light"
})

-- Magma

minetest.register_node("nether:magma_hot", {
   description = "Hot Nether Magma",
   drawtype = "liquid",
   tiles = {"nether_magma.png"},
   groups = {crumbly = 1},
   is_ground_content = true,
   light_source = 10,
   walkable = false,
   pointable = true,
   diggable = true,
   buildable_to = false,
   paramtype = "light",
   damage_per_second = 2,
   liquidtype = "source",
   liquid_renewable = false,
   liquid_alternative_flowing = "nether:magma_hot",
   liquid_alternative_source = "nether:magma_hot",
   liquid_viscosity = 7,
   liquids_pointable = true,
   liquid_range = 0
})

minetest.register_node("nether:magma", {
   description = "Nether Magma",
   groups = {crumbly = 2, cracky = 1},
   tiles = {"nether_magma_dim.png"},
   is_ground_content = true,
   light_source = 3,
   paramtype = "light"
})

-- Nether rack

minetest.register_node("nether:rack", {
   description = "Nether Rack",
   groups = {cracky = 2},
   tiles = {"nether_rack.png"},
   is_ground_content = true
})

-- Ores
minetest.register_node("nether:titanium_ore", {
   description = "Titanium Ore",
   groups = {cracky = 1},
   tiles = {"nether_rack.png^titanium_titanium_in_ground.png"},
   drop = "titanium:titanium"
})

minetest.register_node("nether:heart_ore", {
	definition = "Nether Heart Ore",
	tiles = {"nether_heart_ore.png"},
	groups = {cracky = 1, level = 2},
	drop = "nether:heart",
	on_blast = function (pos, intensity) end
})

minetest.register_node("nether:bedrock", {
	description = "Bedrock",
	tiles = {"bedrock.png"},
	is_ground_content = false,
	diggable = false,
	damage_per_second = 500, -- Keep hackers from glitching through
	drop = "",
	on_blast = function (pos, intensity) end -- Nothing happens with TNT
})
