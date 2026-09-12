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

require "map/terrain"
require "map/ocean_gen"
require "util"

local Layouts = require("map/layouts").Layouts
local StaticLayout = require("map/static_layout")

---@param size number
---@return string|nil
local function getLayout(size)
    if size == 19 then
        return "extra_circle_lunar/map/static_layouts/circle_lunar_19x19"
    elseif size == 33 then
        return "extra_circle_lunar/map/static_layouts/circle_lunar_33x33"
    end
    return nil
end

local layoutfile = getLayout(TUNING.EXTRA_CIRCLE_LUNAR.SIZE)
if not layoutfile then
    return
end

-- 將 layout 載入記憶體
local layout_data = require(layoutfile)
if layout_data and layout_data.layers and layout_data.layers[1] then
    local tiles = layout_data.layers[1].data
    local width = layout_data.width
    local height = layout_data.height

    -- 計算外圍留白的格數
    -- padding 是為了確保啟蒙區域覆蓋整個島
    local padding = math.floor((width - TUNING.EXTRA_CIRCLE_LUNAR.SIZE) / 2)

    -- 定義內部真實島嶼的邊界座標
    local min_x = 1 + padding
    local max_x = width - padding
    local min_y = 1 + padding
    local max_y = height - padding

    -- 讀取設定
    local is_square = (TUNING.EXTRA_CIRCLE_LUNAR.SHAPE == "square")
    local use_beach = TUNING.EXTRA_CIRCLE_LUNAR.BEACH

    -- 遍歷所有地皮
    for i = 1, #tiles do
        -- 將一維陣列的索引 i 轉換為二維的 (x, y) 座標
        local x = ((i - 1) % width) + 1
        local y = math.floor((i - 1) / width) + 1

        -- 判斷目前座標是否落在「真實島嶼」的範圍內
        if x >= min_x and x <= max_x and y >= min_y and y <= max_y then
            if is_square then
                -- 【方形邏輯】直接重新定義整塊方形島嶼
                if use_beach then
                    -- 計算與邊緣的距離 (0代表最外圈，1代表往內一圈)
                    local dist_x = math.min(x - min_x, max_x - x)
                    local dist_y = math.min(y - min_y, max_y - y)

                    -- 如果距離小於2 (即距離邊緣 0 或 1)，就是在外面兩層
                    if dist_x < 2 or dist_y < 2 then
                        tiles[i] = 33 -- 外面兩層填海灘
                    else
                        tiles[i] = 34 -- 中間填月島地皮
                    end
                else
                    -- 如果禁用海灘，整塊方形全部填34
                    tiles[i] = 34
                end
            else
                -- 【圓形邏輯】保留原本Tiled畫好的形狀，只處理禁用海灘的情況
                if not use_beach and tiles[i] == 33 then
                    tiles[i] = 34
                end
            end
        end
    end
end

-- 註冊圓形月島靜態佈局
Layouts["Custom_Circular_Moon"] = StaticLayout.Get(layoutfile,
    {
        add_topology = {
            room_id = "CustomCircularMoon:Main",
            tags = { "RoadPoison", "moonhunt", "nohasslers", "lunacyarea", "not_mainland" }
        },
        min_dist_from_land = 5
    })

-- 將圓形月島加入海洋預填佈景中
AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata.location ~= "forest" then
        return
    end

    if tasksetdata.ocean_prefill_setpieces == nil then
        tasksetdata.ocean_prefill_setpieces = {}
    end

    tasksetdata.ocean_prefill_setpieces["Custom_Circular_Moon"] = { count = TUNING.EXTRA_CIRCLE_LUNAR.NUM }
end)

-- 確保世界生成時強制包含此佈景
AddLevelPreInit("forest", function(level)
    level.required_setpieces = level.required_setpieces or {}
    table.insert(level.required_setpieces, "Custom_Circular_Moon")
end)
