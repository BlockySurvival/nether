local function posin(t, e)
   for k, v in pairs(t) do
      if v.x == e.x and v.y == e.y and v.z == e.z then return true end
   end
   return false
end

local function check(pos)
   local n = minetest.get_node(pos).name
   if n == "nether:obsidian_enchanted" then
      return true
   end
end

local function allequal(a, b, c, d)
   return a == b and a == c and a == d
end

local function search(pos)
   local ptable = {}
   local inX = false
   local inY = false
   local inZ = false
   for x=-1,1 do
      if x ~= 0 then
         local pos = {x = pos.x + x, y = pos.y, z = pos.z}
         if check(pos) then
            table.insert(ptable, pos)
            inX = true
         end
      end
   end
   for y=-1,1 do
      if y ~= 0 then
         local pos = {x = pos.x, y = pos.y + y, z = pos.z}
         if check(pos) then
            table.insert(ptable, pos)
            inY = true
         end
      end
   end
   for z=-1,1 do
      if z ~= 0 then
         local pos = {x = pos.x, y = pos.y, z = pos.z + z}
         if check(pos) then
            table.insert(ptable, pos)
            inZ = true
         end
      end
   end
   local corner = (inX and inY) or (inX and inZ) or (inY and inZ)
   return ptable, corner
end

local function portalat(pos)
   -- Get surrounding obsidian
   local fullpos = {}
   local corners = {}
   local tosearch = {pos}
   local index = 1
   while index <= #tosearch do
      local sPos = tosearch[index]
      local iscorner
      local valid, iscorner = search(sPos)
      -- Add neighboring blocks to the search table
      for k, v in pairs(valid) do
         if not posin(tosearch, v) then
            table.insert(tosearch, v)
         end
      end
      table.insert(fullpos, sPos)
      -- Check if sPos is a corner
      if iscorner then
         table.insert(corners, sPos)
      end
      index = index + 1
   end
   tosearch = nil
   -- Make sure there are 4 corners
   if #corners ~= 4 then return false end
   -- Make sure all the corners lay on a plane and all the pieces are in place if so
   local c1 = corners[1]
   local c2 = corners[2]
   local c3 = corners[3]
   local c4 = corners[4]
   if allequal(c1.x, c2.x, c3.x, c4.x) then
      local minZ = math.min(c1.z, c2.z, c3.z, c4.z)
      local minY = math.min(c1.y, c2.y, c3.y, c4.y)
      local maxZ = math.max(c1.z, c2.z, c3.z, c4.z)
      local maxY = math.max(c1.y, c2.y, c3.y, c4.y)
      for z = minZ, maxZ do
         if not posin(fullpos, {x = c1.x, y = maxY, z = z}) then
            return
         end
         if not posin(fullpos, {x = c1.x, y = minY, z = z}) then
            return
         end
      end
      for y = minY, maxY do
         if not posin(fullpos, {x = c1.x, y = y, z = maxZ}) then
            return
         end
         if not posin(fullpos, {x = c1.x, y = y, z = minZ}) then
            return
         end
      end
      local minC = {x = c1.x, y = minY + 1, z = minZ + 1}
      local maxC = {x = c1.x, y = maxY - 1, z = maxZ - 1}
      -- Make sure the rectangle has an interior
      if minC.y > maxC.y or minC.z > maxC.z then
         return
      end
      return minC, maxC
   elseif allequal(c1.y, c2.y, c3.y, c4.y) then
      local minX = math.min(c1.x, c2.x, c3.x, c4.x)
      local minZ = math.min(c1.z, c2.z, c3.z, c4.z)
      local maxX = math.max(c1.x, c2.x, c3.x, c4.x)
      local maxZ = math.max(c1.z, c2.z, c3.z, c4.z)
      for x = minX, maxX do
         if not posin(fullpos, {x = x, y = c1.y, z = maxZ}) then
            return
         end
         if not posin(fullpos, {x = x, y = c1.y, z = minZ}) then
            return
         end
      end
      for z = minZ, maxZ do
         if not posin(fullpos, {x = maxX, y = c1.y, z = z}) then
            return
         end
         if not posin(fullpos, {x = minX, y = c1.y, z = z}) then
            return
         end
      end
      local minC = {x = minX + 1, y = c1.y, z = minZ + 1}
      local maxC = {x = maxX + 1, y = c1.y, z = maxZ - 1}
      -- Make sure the rectangle has an interior
      if minC.x > maxC.x or minC.z > maxC.z then
         return
      end
      return minC, maxC
   elseif allequal(c1.z, c2.z, c3.z, c4.z) then
      local minX = math.min(c1.x, c2.x, c3.x, c4.x)
      local minY = math.min(c1.y, c2.y, c3.y, c4.y)
      local maxX = math.max(c1.x, c2.x, c3.x, c4.x)
      local maxY = math.max(c1.y, c2.y, c3.y, c4.y)
      for x = minX, maxX do
         if not posin(fullpos, {x = x, y = maxY, z = c1.z}) then
            return
         end
         if not posin(fullpos, {x = x, y = minY, z = c1.z}) then
            return
         end
      end
      for y = minY, maxY do
         if not posin(fullpos, {x = maxX, y = y, z = c1.z}) then
            return
         end
         if not posin(fullpos, {x = minX, y = y, z = c1.z}) then
            return
         end
      end
      local minC = {x = minX + 1, y = minY + 1, z = c1.z}
      local maxC = {x = maxX - 1, y = maxY - 1, z = c1.z}
      -- Make sure the rectangle has an interior
      if minC.x > maxC.x or minC.y > maxC.y then
         return
      end
      return minC, maxC
   end
   -- It's a portal
   return true
end

minetest.register_craft({
   type = "shapeless",
   output = "nether:obsidian_enchanted",
   recipe = {"default:obsidian", "default:diamond"}
})

local obsidian_def = {
   description = "Enchanted Obsidian",
   tiles = {"nether_obsidian_enchanted.png"},
   groups = {cracky = 2}
}

fuel = "default:mese"

obsidian_def.on_punch = function(pos, node, puncher, pointed_thing)
   -- Verify puncher
   if puncher == nil or not puncher:is_player() then return end
   local w = puncher:get_wielded_item()
   -- Verify wielded item
   if w:get_name() == fuel then
      w:take_item()
      puncher:set_wielded_item(w)
   else
      return
   end
   -- Check if there is a portal here
   minC, maxC = portalat(pos)
   if minC ~= nil and maxC ~= nil then
      minetest.chat_send_all("Yay portal!")
   end
end

minetest.register_node("nether:obsidian_enchanted", obsidian_def)
