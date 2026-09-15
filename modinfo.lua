---@diagnostic disable: lowercase-global, undefined-global

local modid = 'extra_circle_lunar'

local density_option_zh = {
    { "不生成", 0 }, { "0.5", 0.5, "极少" }, { "1", 1, "很少" }, { "2", 2, "少" }, { "3", 3, "中等" }, { "5", 5, "多" }, { "7", 7, "很多" }, { "10", 10, "极多" }, { "15", 15, "还不满足？" }, { "20", 20, "还不满足？" }, { "30", 30, "你知道自己在做什么吗？" }, { "40", 40, "你知道自己在做什么吗？" }, { "50", 50, "太多了吧" }, { "60", 60, "太多了吧" }, { "70", 70, "你确定？" }, { "80", 80, "你确定？" }, { "90", 90, "你发疯啦！？" }, { "100", 100, "你发疯啦！？" },
}
local density_option_en = {
    { "None", 0 }, { "0.5", 0.5, "Hardly any" }, { "1", 1, "Very few" }, { "2", 2, "Few" }, { "3", 3, "Medium" }, { "5", 5, "Many" }, { "7", 7, "A lot" }, { "10", 10, "Tons" }, { "15", 15, "Still not enough?" }, { "20", 20, "Still not enough?" }, { "30", 30, "Do you know what you're doing?" }, { "40", 40, "Do you know what you're doing?" }, { "50", 50, "Way too much" }, { "60", 60, "Way too much" }, { "70", 70, "Are you sure?" }, { "80", 80, "Are you sure?" }, { "90", 90, "Are you crazy!?" }, { "100", 100, "Are you crazy!?" },
}

local LANGS = {
    ['zh'] = {
        name = '额外圆形月岛',
        description =
        'v2.0更新注意事项（重要）\n本次更新将每种自然资源设定从最大数量改为密度，请按重置按钮将数值重置回预设！\n\n----------\n\n额外生成一个或多个圆形/方形月岛，不影响原本月岛，可作为基地使用（薇克巴顿的最爱）\n详细功能请查看模组设置',
        config = {
            { modid .. '_num', '数量', '生成几个额外月岛', 1, {
                { "1", 1, "额外生成一个月岛" }, { "2", 2, "额外生成两个月岛" }, { "3", 3, "额外生成三个月岛" },
            } },
            { modid .. '_shape', '形状', '', 'circle', {
                { "圆形", 'circle', "额外生成圆形月岛" }, { "方形", 'square', "额外生成方形月岛" },
            } },
            { modid .. '_size', '大小', '单位是地皮', 19, {
                { "19x19", 19 }, { "25x25", 25 }, { "33x33", 33 },
            } },
            { modid .. '_beach', '外围沙滩', '将外围2圈换成岩石海滩地皮', true, {
                { "禁用", false }, { "启用", true },
            } },
            { modid .. '_center_water', '中心水域', '将圆心挖空成内海', false, {
                { "禁用", false, "实心地面，可以放冰眼结晶器或避雷针" },
                { "1x1", 0, "中心1x1水域，可以钓鱼？" },
                { "3x3", 1, "中心3x3水域，可以种植水中木" },
                { "5x5", 2, "中心5x5水域，可以种植水中木" },
            } },
            { modid .. '_center_entity', '中心实体', '在圆心生成一个实体', false, {
                { "禁用", false },
                { "温泉", "hotspring", "建议禁用中心水域" },
                { "绿洲湖泊", "oasislake", "不影响沙漠绿洲，但多个湖泊可能导致bug！慎用！建议禁用中心水域" },
                { "月亮石（月台）", "moonbase", "不影响原本月台，但多个月台可能导致bug！慎用！建议禁用中心水域" },
                { "原生的水中木", "watertree_pillar", "大树干" },
                { "移植的水中木", "oceantree_pillar", "高出平均值的树干（自带苔癣藤条）" },
            } },
            { modid .. '_oceanvine', '水中木无花果藤条位置', '若在"中心实体"中选择"移植水中木"，其本身会自动生成3条，加上此设定会有7条', false, {
                { "禁用", false, "无额外苔癣藤条" }, { "上下左右各1条", "cross" }, { "四角方位各1条", "square" },
            } },
            { modid .. '_oceanvine_distance', '无花果藤条与中心距离', '需要启用"水中木无花果藤条位置"才会生效', 2, {
                { "1", 1, "距离中心1格地皮" },
                { "1.5", 1.5, "距离中心1.5格地皮" },
                { "2", 2, "距离中心2格地皮" },
                { "2.5", 2.5, "距离中心2.5格地皮" },
                { "3", 3, "距离中心3格地皮" },
                { "3.5", 3.5, "距离中心3.5格地皮" },
                { "4", 4, "距离中心4格地皮" },
                { "4.5", 4.5, "距离中心4.5格地皮" },
                { "5", 5, "位置选四角会超出庇荫范围，可配合扩大水中木范围的模组使用" },
                { "5.5", 5.5, "位置选四角会超出庇荫范围，可配合扩大水中木范围的模组使用" },
                { "6", 6, "位置选四角会超出庇荫范围，可配合扩大水中木范围的模组使用" },
            } },
            { "自然資源生成" },
            { modid .. '_clear_space', '强制空地比例(%)', '每座岛至少有多少比例的地皮是空地', 40, { { "禁用", 0 }, { "10", 10 }, { "20", 20 }, { "25", 25 }, { "30", 30 }, { "40", 40 }, { "50", 50 }, { "60", 60 }, { "70", 70 }, { "75", 75 }, { "80", 80 }, { "90", 90 }, { "100", 100 }, }, slider_data = { 0, 100, 5 },
            },
            { "密度总和超过100%会按比例分配" },
            { modid .. '_starfish', '海星密度(%)', '每座岛生成的海星数量占可用地皮的比例', 7, density_option_zh },
            { modid .. '_kelp', '海带根密度(%)', '每座岛生成的公牛海带根数量占可用地皮的比例', 7, density_option_zh },
            { modid .. '_bones', '海骨密度(%)', '每座岛生成的海骨数量占可用地皮的比例', 3, density_option_zh },
            { modid .. '_driftwood', '浮木密度(%)', '每座岛生成的浮木数量占可用地皮的比例', 3, density_option_zh },
            { modid .. '_lunatree', '月树密度(%)', '每座岛生成的月树数量占可用地皮的比例', 3, density_option_zh },
            { modid .. '_sapling', '树苗密度(%)', '每座岛生成的树苗数量占可用地皮的比例', 3, density_option_zh },
            { modid .. '_stonefruit', '石果密度(%)', '每座岛生成的石果灌木丛数量占可用地皮的比例', 5, density_option_zh },
            { modid .. '_moonglass', '月光玻璃密度(%)', '每座岛生成的月光玻璃矿数量占可用地皮的比例', 5, density_option_zh },
            { modid .. '_moonrock', '月岩密度(%)', '每座岛生成的月岩数量占可用地皮的比例', 2, density_option_zh },
            { modid .. '_goldrock', '金矿密度(%)', '每座岛生成的金矿数量占可用地皮的比例', 0.5, density_option_zh },
            { modid .. '_rock', '岩石密度(%)', '每座岛生成的岩石数量占可用地皮的比例', 1, density_option_zh },
            { modid .. '_caverock', '落石密度(%)', '每座岛生成的落石数量占可用地皮的比例', 0, density_option_zh },
            { modid .. '_saladmander', '沙拉蝾螈密度(%)', '每座岛生成的沙拉蝾螈数量占可用地皮的比例', 0, density_option_zh },
            { modid .. '_lunarmushtree', '月亮蘑菇树密度(%)', '每座岛生成的月亮蘑菇树数量占可用地皮的比例', 0, density_option_zh },
        }
    },
    ['en'] = {
        name = "Extra Circular Lunar Island",
        description =
        "v2.0 Update Notes (IMPORTANT)\nThis update changes the setting for each natural resource from maximum quantity to density. Please press the Reset button to reset the values back to the default!\n\n----------\n\nGenerates one or more extra circular/square Lunar Islands without affecting the original one. Perfect for a base (Wickerbottom's favorite).\nFor detailed features, please check the mod settings.",
        config = {
            { modid .. '_num', 'Amount', 'How many extra Lunar Islands to generate', 1, {
                { "1", 1, "Generate 1 extra Lunar Island" }, { "2", 2, "Generate 2 extra Lunar Islands" }, { "3", 3, "Generate 3 extra Lunar Islands" },
            } },
            { modid .. '_shape', 'Shape', '', 'circle', {
                { "Circle", 'circle', "Generate a circular Lunar Island" }, { "Square", 'square', "Generate a square Lunar Island" },
            } },
            { modid .. '_size', 'Size', 'Unit is tile', 19, {
                { "19x19", 19 }, { "25x25", 25 }, { "33x33", 33 },
            } },
            { modid .. '_beach', 'Outer Beach', 'Replace the outer 2 rings with Shell Beach Turf', true, {
                { "Disabled", false }, { "Enabled", true },
            } },
            { modid .. '_center_water', 'Center Water', 'Hollow out the center into a lake', false, {
                { "Disabled", false, "Solid ground, can place Ice Crystaleyezer or Lightning Rod" },
                { "1x1",      0,     "1x1 water, can fish?" },
                { "3x3",      1,     "3x3 water, can plant Knobbly Trees" },
                { "5x5",      2,     "5x5 water, can plant Knobbly Trees" },
            } },
            { modid .. '_center_entity', 'Center Entity', 'Spawn an entity in the center', false, {
                { "Disabled",                  false },
                { "Hot Spring",                "hotspring",        "Recommended to disable Center Water" },
                { "Oasis Lake",                "oasislake",        "Doesn't affect the Desert Oasis, but multiple lakes may cause bugs! Use with caution! Recommended to disable Center Water" },
                { "Moon Stone",                "moonbase",         "Doesn't affect the original Moon Stone, but multiple Moon Stones may cause bugs! Use with caution! Recommended to disable Center Water" },
                { "Native Knobbly Tree",       "watertree_pillar", "Great Tree Trunk" },
                { "Transplanted Knobbly Tree", "oceantree_pillar", "Above-Average Tree Trunk (with its own mossy vines)" },
            } },
            { modid .. '_oceanvine', 'Mossy Vine Position',
                'The "Above-Average Tree Trunk" spawns 3 vines automatically. This setting adds up to 7 vines.', false, {
                { "Disabled", false, "No extra Mossy Vines" }, { "Cross (1 on each side)", "cross" }, { "Square (1 on each corner)", "square" },
            } },
            { modid .. '_oceanvine_distance', 'Mossy Vine Distance', 'Requires "Mossy Vine Position" to be enabled', 2, {
                { "1",   1,   "1 tile away from the center" },
                { "1.5", 1.5, "1.5 tiles away from the center" },
                { "2",   2,   "2 tiles away from the center" },
                { "2.5", 2.5, "2.5 tiles away from the center" },
                { "3",   3,   "3 tiles away from the center" },
                { "3.5", 3.5, "3.5 tiles away from the center" },
                { "4",   4,   "4 tiles away from the center" },
                { "4.5", 4.5, "4.5 tiles away from the center" },
                { "5",   5,   "Corners will exceed canopy shade, recommended to use with canopy expanding mods" },
                { "5.5", 5.5, "Corners will exceed canopy shade, recommended to use with canopy expanding mods" },
                { "6",   6,   "Corners will exceed canopy shade, recommended to use with canopy expanding mods" },
            } },
            { "Natural Resources Generation" },
            {
                modid .. '_clear_space',
                'Mandatory Clear Space (%)',
                'Minimum percentage of clear tiles reserved per island',
                40,
                { { "Disabled", 0 }, { "10", 10 }, { "20", 20 }, { "25", 25 }, { "30", 30 }, { "40", 40 }, { "50", 50 }, { "60", 60 }, { "70", 70 }, { "75", 75 }, { "80", 80 }, { "90", 90 }, { "100", 100 }, },
                slider_data = { 0, 100, 5 },
            },
            { "Proportional if total > 100%" },
            { modid .. '_starfish',          'Starfish Density (%)',         'Percentage of available tiles to spawn Starfish',           7,   density_option_en },
            { modid .. '_kelp',              'Bull Kelp Root Density (%)',   'Percentage of available tiles to spawn Bull Kelp Roots',    7,   density_option_en },
            { modid .. '_bones',             'Sea Bones Density (%)',        'Percentage of available tiles to spawn Sea Bones',          3,   density_option_en },
            { modid .. '_driftwood',         'Driftwood Density (%)',        'Percentage of available tiles to spawn Driftwood',          3,   density_option_en },
            { modid .. '_lunatree',          'Lune Tree Density (%)',        'Percentage of available tiles to spawn Lune Trees',         3,   density_option_en },
            { modid .. '_sapling',           'Sapling Density (%)',          'Percentage of available tiles to spawn Saplings',           3,   density_option_en },
            { modid .. '_stonefruit',        'Stone Fruit Bush Density (%)', 'Percentage of available tiles to spawn Stone Fruit Bushes', 5,   density_option_en },
            { modid .. '_moonglass',         'Moonglass Rock Density (%)',   'Percentage of available tiles to spawn Moonglass Rocks',    5,   density_option_en },
            { modid .. '_moonrock',          'Moonrock Density (%)',         'Percentage of available tiles to spawn Moonrocks',          2,   density_option_en },
            { modid .. '_goldrock',          'Gold Vein Density (%)',        'Percentage of available tiles to spawn Gold Veins',         0.5, density_option_en },
            { modid .. '_rock',              'Boulder Density (%)',          'Percentage of available tiles to spawn Boulders',           1,   density_option_en },
            { modid .. '_caverock',          'Cave-in Boulder Density (%)',  'Percentage of available tiles to spawn Cave-in Boulders',   0,   density_option_en },
            { modid .. '_saladmander',       'Saladmander Density (%)',      'Percentage of available tiles to spawn Saladmanders',       0,   density_option_en },
            { modid .. '_lunarmushtree',     'Lunar Mushtree Density (%)',   'Percentage of available tiles to spawn Lunar Mushtrees',    0,   density_option_en },
        }
    }
}

-- 决定当前用的语言
local cur = (locale == 'zh' or locale == 'zhr' or locale == 'zht') and 'zh' or 'en'

-- mod相关信息
version = '2.1.0'
author = 'Icya'
forumthread = ''
api_version = 10
priority = 0                                       -- 加载优先级，越低加载越晚，默认为0

dst_compatible = true                              -- 联机版适配性
dont_starve_compatible = false                     -- 单机版适配性
reign_of_giants_compatible = false                 -- 单机版：巨人国适配性
-- all_clients_require_mod = true     -- 服务端/所有端模组
server_only_mod = true                             -- 仅服务端模组
-- client_only_mod = true -- 仅客户端模组
server_filter_tags = { 'worldgen', 'environment' } -- 创意工坊模组分类标签
icon_atlas = 'modicon.xml'                         -- 图集
icon = 'modicon.tex'                               -- 图标

-- 以下自动配置
name = LANGS[cur].name
description = version .. '\n' .. LANGS[cur].description

local config = LANGS[cur].config or {}
local _configuration_options = {}
for i = 1, #config do
    local options = {}
    if config[i][5] then
        for k = 1, #config[i][5] do
            options[k] = { description = config[i][5][k][1], data = config[i][5][k][2], hover = config[i][5][k][3] }
        end
    end
    _configuration_options[i] = {
        name = config[i][1],
        label = config[i][2],
        hover = config[i][3] or '',
        default = config[i][4] or false,
        options = #options > 0 and options or { { description = "", data = false } },
    }
    if config[i].slider_data then
        _configuration_options[i].slider_data = config[i].slider_data
    end
end

configuration_options = _configuration_options
