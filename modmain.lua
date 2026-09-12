GLOBAL.setmetatable(env, { __index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end })

---@type string
local modid = 'extra_circle_lunar' -- 定义唯一modid

-- 导入常量表
modimport('scripts/' .. modid .. '/tuning.lua')

TUNING.EXTRA_CIRCLE_LUNAR.NUM = GetModConfigData(modid .. '_num')
TUNING.EXTRA_CIRCLE_LUNAR.SHAPE = GetModConfigData(modid .. '_shape')
TUNING.EXTRA_CIRCLE_LUNAR.SIZE = GetModConfigData(modid .. '_size')
TUNING.EXTRA_CIRCLE_LUNAR.BEACH = GetModConfigData(modid .. '_beach')
TUNING.EXTRA_CIRCLE_LUNAR.CENTER_WATER = GetModConfigData(modid .. '_center_water')
TUNING.EXTRA_CIRCLE_LUNAR.CENTER_ENTITY = GetModConfigData(modid .. '_center_entity')
TUNING.EXTRA_CIRCLE_LUNAR.OCEANVINE = GetModConfigData(modid .. '_oceanvine')
TUNING.EXTRA_CIRCLE_LUNAR.OCEANVINE_DISTANCE = GetModConfigData(modid .. '_oceanvine_distance')

PrefabFiles = {
    "extra_circle_lunar/center_anchor",
}
