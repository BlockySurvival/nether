-- Magma

minetest.register_node("nether:magma_hot", {
   description = "Hot Nether Magma",
   drawtype = "liquid",
   tiles = {"nether_magma.png"},
   is_ground_content = true,
   light_source = 10,
   walkable = false,
   pointable = true,
   diggable = false,
   buildable_to = true,
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
   tiles = {"nether_magma_dim.png"},
   is_ground_content = true,
   light_source = 3,
   paramtype = "light"
})

-- Nether rack

minetest.register_node("nether:rack", {
   description = "Nether Rack",
   tiles = {"nether_rack.png"},
   is_ground_content = true
})

-- Ores

minetest.register_node("nether:titanium_ore", {
   description = "Titanium Ore",
   tiles = {"nether_rack.png^titanium_titanium_in_ground.png"}
})
