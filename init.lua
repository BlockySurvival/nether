local mp = minetest.get_modpath(minetest.get_current_modname()) .. "/"

dofile(mp .. "nodes.lua")
dofile(mp .. "items.lua")
dofile(mp .. "crafts.lua")
dofile(mp .. "portal.lua")

local p_noise = {
   offset = 0,
   scale = 1,
   spread = {x = 32, y = 32, z = 32},
   seed = -747375,
   octaves = 4,
   persist = 0.6
}

local cids = {
   air = minetest.get_content_id("nether:fumes"),
   stone = minetest.get_content_id("default:stone"),
   water = minetest.get_content_id("default:water_source"),
   lava = minetest.get_content_id("default:lava_sorce"),
   magma = minetest.get_content_id("nether:magma"),
   magma_hot = minetest.get_content_id("nether:magma_hot"),
   rack = minetest.get_content_id("nether:rack"),
   titanium = minetest.get_content_id("nether:titanium_ore"),
   heart = minetest.get_content_id("nether:heart_ore"),
   bedrock = minetest.get_content_id("nether:bedrock")
}

local nether_depth = -25000
local bedrock_thickness = 3

local c_air = cids.air
local c_stone = cids.stone
local c_water = cids.water
local c_lava = cids.lava
local c_magma = cids.magma
local c_magma_hot = cids.magma_hot
local c_rack = cids.rack
local c_titanium = cids.titanium
local c_heart = cids.heart
local c_bedrock = cids.bedrock

local function type_calc()
   local num = math.random()
   if num < 0.3 then -- 30% prob
      return c_magma
   elseif num < 0.35 then -- 5% prob
      return c_magma_hot
   elseif num < 0.355 then -- 0.5% prob
      return c_titanium
   elseif num < 0.3551 then -- 0.01% prob
      return c_heart
   else
      return nil
   end
end

-- Mapgen

minetest.register_on_generated(function(minp, maxp, blockseed)
   generate_nether(minp, maxp, blockseed)
end)

function generate_nether(minp, maxp, seed)

   local x0 = minp.x
   local y0 = minp.y
   local z0 = minp.z
   local x1 = maxp.x
   local y1 = maxp.y
   local z1 = maxp.z

   local sidelen = x1 - x0 + 1 -- chunk side length
   local chunk_size = {x = sidelen, y = sidelen, z = sidelen}
   local minpos = {x = x0, y = y0, z = z0}

   local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

   local pn1 = minetest.get_perlin_map(p_noise, chunk_size):get3dMap_flat(minpos)

   local ni = 1
   for z = z0, z1 do
   for y = y0, y1 do
      local vi = area:index(x0, y, z)
      for x = x0, x1 do
         if y < nether_depth - bedrock_thickness then -- Full nether
            local noisev = pn1[ni]
            if noisev < 0 then
               data[vi] = c_air
            else
               if data[vi] == c_water or data[vi] == c_lava then
                  data[vi] = c_magma
               else
                  local t = type_calc()
                  if t ~= nil then
                     data[vi] = t
                  else
                     data[vi] = c_rack
                  end
               end
            end
         elseif y < nether_depth then -- Bedrock layer
            data[vi] = c_bedrock
         end
         vi = vi + 1
         ni = ni + 1
      end
   end
   end

   vm:set_data(data)
   vm:set_lighting({day=0, night=0})
	vm:calc_lighting()
	vm:write_to_map(data)
   data = nil
end

-- Nether fumes regeneration ABM
minetest.register_abm({
   label = "Nether Fume Regenerate",
   nodenames = {"air"},
   neighbors = {"nether:fumes"},
   interval = 1,
   chance = 1,
   action = function(pos, node, active_object_count, active_object_count_wider)
      if pos.y < nether_depth then
         minetest.set_node(pos, {name = "nether:fumes"})
      end
   end
})
