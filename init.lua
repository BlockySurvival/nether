local p_noise1 = {
   offset = 0,
   scale = 1,
   spread = {x = 256, y = 256, z = 256},
   seed = -747375,
   octaves = 4,
   persist = 0.1
}

local cids = {
   air = minetest.get_content_id("air")
   stone = minetest.get_content_id("default:stone")
}

local c_air = cids.air
local c_stone = cids.stone

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

   local pn1 = minetest.get_perlin_map(p_noise1, chunk_size):get3dMap_flat(minpos)

   local ni = 1
   for z = z0, z1 do
   for y = y0, y1 do
      local vi = area:index(x0, y, z)
      for x = x0, x1 do
         local noisev = pn1[ni]
         if noisev > 0 then
            data[vi] = c_stone
         else
            data[vi] = c_air
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
