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

        inst:Remove()
    end)

    return inst
end

return Prefab("extra_circle_lunar/center_anchor", fn)
