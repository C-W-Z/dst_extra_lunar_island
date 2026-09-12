GLOBAL.setmetatable(env, { __index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end })

---@type string
local modid = 'extra_circle_lunar' -- 定义唯一modid

-- 导入常量表
modimport('scripts/' .. modid .. '/tuning.lua')

TUNING.EXTRA_CIRCLE_LUNAR.SIZE = GetModConfigData(modid .. '_size')
TUNING.EXTRA_CIRCLE_LUNAR.CENTER_WATER = GetModConfigData(modid .. '_center_water')
TUNING.EXTRA_CIRCLE_LUNAR.CENTER_ENTITY = GetModConfigData(modid .. '_center_entity')
TUNING.EXTRA_CIRCLE_LUNAR.OCEANVINE = GetModConfigData(modid .. '_oceanvine')

require "map/terrain"
require "map/ocean_gen"
require "util"

local Layouts = require("map/layouts").Layouts
local StaticLayout = require("map/static_layout")

---@param size number
---@return string|nil
local function getLayout(size)
    if size == 19  then
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

    tasksetdata.ocean_prefill_setpieces["Custom_Circular_Moon"] = { count = 1 }
end)

-- 確保世界生成時強制包含此佈景
AddLevelPreInit("forest", function(level)
    level.required_setpieces = level.required_setpieces or {}
    table.insert(level.required_setpieces, "Custom_Circular_Moon")
end)
