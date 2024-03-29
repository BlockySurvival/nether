local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)

minetest.register_tool("nether:pick_nether", {
	description = S("Nether Pickaxe\nWell suited for mining netherrack"),
	_doc_items_longdesc = S("Uniquely suited for mining netherrack, with minimal wear when doing so. Blunts quickly on other materials."),
	inventory_image = "nether_tool_netherpick.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[1]=1.90, [2]=0.9, [3]=0.3}, uses=35, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1},

	after_use = function(itemstack, user, node, digparams)
		local wearDivisor = 1
		local nodeDef = minetest.registered_nodes[node.name]
		if nodeDef ~= nil and nodeDef.groups ~= nil then
			-- The nether pick hardly wears out when mining netherrack
			local workable = nodeDef.groups.workable_with_nether_tools or 0
			wearDivisor =  1 + (3 * workable) -- 10 for netherrack, 1 otherwise. Making it able to mine 350 netherrack nodes, instead of 35.
		end

		local wear = math.floor(digparams.wear / wearDivisor)
		itemstack:add_wear(wear)  -- apply the adjusted wear as usual
		return itemstack
	end
})

minetest.register_tool("nether:shovel_nether", {
	description = S("Nether Shovel"),
	inventory_image = "nether_tool_nethershovel.png",
	wield_image = "nether_tool_nethershovel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.0, [2]=0.4, [3]=0.25}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1}
})

minetest.register_tool("nether:axe_nether", {
	description = S("Nether Axe"),
	inventory_image = "nether_tool_netheraxe.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.9, [2]=0.7, [3]=0.4}, uses=35, maxlevel=3},
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1}
})

minetest.register_tool("nether:sword_nether", {
	description = S("Nether Sword"),
	inventory_image = "nether_tool_nethersword.png",
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.5, [2]=0.6, [3]=0.2}, uses=45, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})

minetest.register_craftitem("nether:nether_ingot", {
	description = S("Nether Ingot"),
	inventory_image = "nether_nether_ingot.png"
})
minetest.register_craftitem("nether:nether_lump", {
	description = S("Nether Lump"),
	inventory_image = "nether_nether_lump.png",
})

minetest.register_craft({
	type = "cooking",
	output = "nether:nether_ingot",
	recipe = "nether:nether_lump",
	cooktime = 30,
})
minetest.register_craft({
	output = "nether:nether_lump",
	recipe = {
		{"nether:brick_compressed","nether:brick_compressed","nether:brick_compressed"},
		{"nether:brick_compressed","nether:brick_compressed","nether:brick_compressed"},
		{"nether:brick_compressed","nether:brick_compressed","nether:brick_compressed"},
	}
})

minetest.register_craft({
	output = "nether:pick_nether",
	recipe = {
		{"nether:nether_ingot","nether:nether_ingot","nether:nether_ingot"},
		{"", "group:stick", ""},
		{"", "group:stick", ""}
	}
})
minetest.register_craft({
	output = "nether:shovel_nether",
	recipe = {
		{"nether:nether_ingot"},
		{"group:stick"},
		{"group:stick"}
	}
})
minetest.register_craft({
	output = "nether:axe_nether",
	recipe = {
		{"nether:nether_ingot","nether:nether_ingot"},
		{"nether:nether_ingot","group:stick"},
		{"","group:stick"}
	}
})
minetest.register_craft({
	output = "nether:sword_nether",
	recipe = {
		{"nether:nether_ingot"},
		{"nether:nether_ingot"},
		{"group:stick"}
	}
})


-- Inspired by FaceDeer's torch crossbow and Xanthin's Staff of Light
minetest.register_tool("nether:lightstaff", {
	description = S("Nether staff of Light\nTemporarily transforms the netherrack into glowstone"),
	inventory_image = "nether_lightstaff.png",
	wield_image     = "nether_lightstaff.png",
	light_source = 11, -- used by wielded_light mod etc.
	stack_max = 1,
})

minetest.register_tool("nether:lightstaff_eternal", {
	description = S("Nether staff of Eternal Light\nCreates glowstone from netherrack"),
	inventory_image = "nether_lightstaff.png^[colorize:#55F:90",
	wield_image     = "nether_lightstaff.png^[colorize:#55F:90",
	light_source = 11, -- used by wielded_light mod etc.
	sound = {breaks = "default_tool_breaks"},
	stack_max = 1,
})
