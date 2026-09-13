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
TUNING.EXTRA_CIRCLE_LUNAR.CLEAR_SPACE = GetModConfigData(modid .. '_clear_space')
TUNING.EXTRA_CIRCLE_LUNAR.STARFISH = GetModConfigData(modid .. '_starfish')
TUNING.EXTRA_CIRCLE_LUNAR.KELP = GetModConfigData(modid .. '_kelp')
TUNING.EXTRA_CIRCLE_LUNAR.BONES = GetModConfigData(modid .. '_bones')
TUNING.EXTRA_CIRCLE_LUNAR.DRIFTWOOD = GetModConfigData(modid .. '_driftwood')
TUNING.EXTRA_CIRCLE_LUNAR.LUNATREE = GetModConfigData(modid .. '_lunatree')
TUNING.EXTRA_CIRCLE_LUNAR.SAPLING = GetModConfigData(modid .. '_sapling')
TUNING.EXTRA_CIRCLE_LUNAR.STONEFRUIT = GetModConfigData(modid .. '_stonefruit')
TUNING.EXTRA_CIRCLE_LUNAR.MOONGLASS = GetModConfigData(modid .. '_moonglass')
TUNING.EXTRA_CIRCLE_LUNAR.MOONROCK = GetModConfigData(modid .. '_moonrock')
TUNING.EXTRA_CIRCLE_LUNAR.GOLDROCK = GetModConfigData(modid .. '_goldrock')
TUNING.EXTRA_CIRCLE_LUNAR.ROCK = GetModConfigData(modid .. '_rock')
TUNING.EXTRA_CIRCLE_LUNAR.CAVEROCK = GetModConfigData(modid .. '_caverock')
TUNING.EXTRA_CIRCLE_LUNAR.SALADMANDER = GetModConfigData(modid .. '_saladmander')

PrefabFiles = {
    "extra_circle_lunar/center_anchor",
}
