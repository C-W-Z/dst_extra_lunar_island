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

        inst:Remove()
    end)

    return inst
end

return Prefab("extra_circle_lunar/moon_pool_anchor", fn)
