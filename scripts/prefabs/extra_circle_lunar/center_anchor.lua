---@param tx number 中心地皮X座標（地皮單位）
---@param ty number 中心地皮Y座標（地皮單位）
local function generate_objects(tx, ty)
    local radius = math.floor(TUNING.EXTRA_CIRCLE_LUNAR.SIZE / 2)

    -- 先掃描建立基礎可用地皮清單
    local available_tiles = {}
    for dx = -radius, radius do
        for dy = -radius, radius do
            if math.abs(dx) >= 3 or math.abs(dy) >= 3 then
                local tile = TheWorld.Map:GetTile(tx + dx, ty + dy)
                if tile == WORLD_TILES.METEOR or tile == WORLD_TILES.PEBBLEBEACH then
                    table.insert(available_tiles, { dx = dx, dy = dy, tile = tile })
                end
            end
        end
    end

    local total_usable_tiles = #available_tiles
    if total_usable_tiles == 0 then return end

    -- 計算強制空地保護機制 (限制最大生成數量)
    local clear_space_pct = TUNING.EXTRA_CIRCLE_LUNAR.CLEAR_SPACE or 20
    local max_spawn_limit = math.floor(total_usable_tiles * (1 - clear_space_pct / 100))
    local spawned_count = 0

    -- 建立所有待生成物件的陣列 (依照百分比計算數量)
    local spawn_pool = {}

    local function AddToPool(prefab, percentage)
        if percentage and percentage > 0 then
            -- 總地皮數 × (設定百分比 / 100) = 實際生成數量
            local count = math.floor(total_usable_tiles * (percentage / 100))
            for i = 1, count do table.insert(spawn_pool, prefab) end
        end
    end

    AddToPool("trap_starfish", TUNING.EXTRA_CIRCLE_LUNAR.STARFISH)
    AddToPool("bullkelp_beachedroot", TUNING.EXTRA_CIRCLE_LUNAR.KELP)
    AddToPool("dead_sea_bones", TUNING.EXTRA_CIRCLE_LUNAR.BONES)

    local driftwood_pct = TUNING.EXTRA_CIRCLE_LUNAR.DRIFTWOOD
    if driftwood_pct and driftwood_pct > 0 then
        local count = math.floor(total_usable_tiles * (driftwood_pct / 100))
        local wood_types = { "driftwood_small1", "driftwood_small2", "driftwood_tall" }
        for i = 1, count do
            table.insert(spawn_pool, wood_types[math.random(#wood_types)])
        end
    end

    local lunatree_pct = TUNING.EXTRA_CIRCLE_LUNAR.LUNATREE
    if lunatree_pct and lunatree_pct > 0 then
        local count = math.floor(total_usable_tiles * (lunatree_pct / 100))
        local tree_types = { "moon_tree_short", "moon_tree_normal", "moon_tree_tall" }
        for i = 1, count do
            table.insert(spawn_pool, tree_types[math.random(#tree_types)])
        end
    end

    AddToPool("sapling_moon", TUNING.EXTRA_CIRCLE_LUNAR.SAPLING)
    AddToPool("rock_avocado_bush", TUNING.EXTRA_CIRCLE_LUNAR.STONEFRUIT)
    AddToPool("moonglass_rock", TUNING.EXTRA_CIRCLE_LUNAR.MOONGLASS)
    AddToPool("rock_moon", TUNING.EXTRA_CIRCLE_LUNAR.MOONROCK)
    AddToPool("rock2", TUNING.EXTRA_CIRCLE_LUNAR.GOLDROCK)
    AddToPool("rock1", TUNING.EXTRA_CIRCLE_LUNAR.ROCK)
    AddToPool("cavein_boulder", TUNING.EXTRA_CIRCLE_LUNAR.CAVEROCK)

    -- 隨機打亂池子順序 (洗牌演算法)，確保各物件擁有平等的抽取機率
    for i = #spawn_pool, 2, -1 do
        local j = math.random(i)
        spawn_pool[i], spawn_pool[j] = spawn_pool[j], spawn_pool[i]
    end

    -- 盲抽放置
    for _, prefab in ipairs(spawn_pool) do
        -- 安全煞車：當生成的數量達到容許的最大上限時，直接停止，強制保留剩餘空地
        if spawned_count >= max_spawn_limit then
            break
        end

        -- 判斷該物件是否為海岸物件
        local is_coast = (prefab == "trap_starfish" or prefab == "bullkelp_beachedroot" or prefab == "dead_sea_bones" or string.match(prefab, "driftwood"))

        -- 收集目前可用地皮中，符合該物件條件的候選清單
        local candidates = {}
        for i, pos in ipairs(available_tiles) do
            if is_coast then
                -- 海岸物件專屬規則：距離必須大於 5 (允許沙灘或岩石)
                if math.abs(pos.dx) >= 5 or math.abs(pos.dy) >= 5 then
                    table.insert(candidates, i)
                end
            else
                -- 其他物件專屬規則：距離大於 3 已在初步篩選完成，只需確保地皮為岩石即可 (排除沙灘)
                if pos.tile == WORLD_TILES.METEOR then
                    table.insert(candidates, i)
                end
            end
        end

        -- 如果有找到合適的地皮，隨機挑選一個放置
        if #candidates > 0 then
            local rand_idx = math.random(1, #candidates)
            local chosen_tile_idx = candidates[rand_idx]
            local pos = available_tiles[chosen_tile_idx]

            local spawn_x, spawn_y, spawn_z = TheWorld.Map:GetTileCenterPoint(tx + pos.dx, ty + pos.dy)
            local offset_x = math.random() * 2 - 1.0
            local offset_z = math.random() * 2 - 1.0

            local entity = SpawnPrefab(prefab)
            if entity ~= nil then
                entity.Transform:SetPosition(spawn_x + offset_x, 0, spawn_z + offset_z)
                spawned_count = spawned_count + 1
            end

            -- 放置完成後，將這塊地皮從基礎可用清單中永久移除，保證絕對不會重疊
            table.remove(available_tiles, chosen_tile_idx)
        end
    end
end

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:DoTaskInTime(0, function()
        local x, y, z = inst.Transform:GetWorldPosition()
        local tx, ty = TheWorld.Map:GetTileCoordsAtPoint(x, y, z)

        if TUNING.EXTRA_CIRCLE_LUNAR.CENTER_WATER then
            -- 中心水域
            for dx = -TUNING.EXTRA_CIRCLE_LUNAR.CENTER_WATER, TUNING.EXTRA_CIRCLE_LUNAR.CENTER_WATER do
                for dy = -TUNING.EXTRA_CIRCLE_LUNAR.CENTER_WATER, TUNING.EXTRA_CIRCLE_LUNAR.CENTER_WATER do
                    TheWorld.Map:SetTile(tx + dx, ty + dy, WORLD_TILES.OCEAN_COASTAL)
                end
            end
        end

        if TUNING.EXTRA_CIRCLE_LUNAR.CENTER_ENTITY then
            -- 生成實體並放置在中心點
            local entity = SpawnPrefab(TUNING.EXTRA_CIRCLE_LUNAR.CENTER_ENTITY)
            if entity ~= nil then
                entity.Transform:SetPosition(x, 0, z)
            end
        end

        if TUNING.EXTRA_CIRCLE_LUNAR.OCEANVINE then
            -- 生成苔癬藤條
            -- 1格地皮的座標距離為4
            local offset = 4 * TUNING.EXTRA_CIRCLE_LUNAR.OCEANVINE_DISTANCE

            -- 定義上下左右四個位置的座標 (目標x, 目標z)
            local spawn_points = {
                cross = {
                    { x,          z - offset }, -- 上
                    { x,          z + offset }, -- 下
                    { x - offset, z },          -- 左
                    { x + offset, z },          -- 右
                },
                square = {
                    { x + offset, z - offset }, -- 右上
                    { x + offset, z + offset }, -- 右下
                    { x - offset, z - offset }, -- 左上
                    { x - offset, z + offset }, -- 左下
                }
            }

            -- 迴圈遍歷四個位置並生成實體
            for _, pos in ipairs(spawn_points[TUNING.EXTRA_CIRCLE_LUNAR.OCEANVINE]) do
                local entity = SpawnPrefab("oceanvine")
                if entity ~= nil then
                    entity.Transform:SetPosition(pos[1], 0, pos[2])
                end
            end
        end

        generate_objects(tx, ty)

        inst:Remove()
    end)

    return inst
end

return Prefab("extra_circle_lunar/center_anchor", fn)
