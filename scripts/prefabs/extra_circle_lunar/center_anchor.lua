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

        -- 生成海星的邏輯
        if TUNING.EXTRA_CIRCLE_LUNAR.STARFISH and TUNING.EXTRA_CIRCLE_LUNAR.STARFISH > 0 then
            local valid_tiles = {}
            -- 計算島嶼半徑 (例如 19x19 半徑約為 9)
            local radius = math.floor(TUNING.EXTRA_CIRCLE_LUNAR.SIZE / 2)

            -- 掃描周圍的所有地皮
            for dx = -radius, radius do
                for dy = -radius, radius do
                    -- 避免海星生成在中心5x5範圍內
                    if math.abs(dx) > 5 or math.abs(dy) > 5 then
                        local tile = TheWorld.Map:GetTile(tx + dx, ty + dy)
                        -- 34對應WORLD_TILES.METEOR，33對應WORLD_TILES.PEBBLEBEACH，確保只生成在月島地皮上
                        if tile == WORLD_TILES.METEOR or tile == WORLD_TILES.PEBBLEBEACH then
                            table.insert(valid_tiles, { dx = dx, dy = dy })
                        end
                    end
                end
            end

            -- 隨機抽取座標點並生成海星
            local spawn_count = math.min(TUNING.EXTRA_CIRCLE_LUNAR.STARFISH, #valid_tiles)
            for i = 1, spawn_count do
                -- 隨機挑選一個可用座標並從陣列中移除
                local rand_index = math.random(1, #valid_tiles)
                local pos = table.remove(valid_tiles, rand_index)

                -- 將地皮網格座標轉換為實際世界坐標 (中心點)
                local spawn_x, spawn_y, spawn_z = TheWorld.Map:GetTileCenterPoint(tx + pos.dx, ty + pos.dy)

                -- 為了讓海星看起來自然，在地皮內加入微小偏移
                local offset_x = math.random() * 3 - 1.5
                local offset_z = math.random() * 3 - 1.5

                local starfish = SpawnPrefab("trap_starfish")
                if starfish ~= nil then
                    starfish.Transform:SetPosition(spawn_x + offset_x, 0, spawn_z + offset_z)
                end
            end
        end

        inst:Remove()
    end)

    return inst
end

return Prefab("extra_circle_lunar/center_anchor", fn)
