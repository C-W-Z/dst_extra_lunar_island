---@diagnostic disable: lowercase-global, undefined-global

local modid = 'extra_circle_lunar'

local LANGS = {
    ['zh'] = {
        name = '额外圆形月岛',
        description = '详细功能请查看模组设置\n\n额外生成一个或多个圆形/方形月岛，不影响原本月岛，可作为基地使用（薇克巴顿最爱）。',
        config = {
            { modid .. '_num', '数量', '生成几个额外月岛', 1, {
                { "1", 1, "额外生成一个月岛" },
                { "2", 2, "额外生成两个月岛" },
                { "3", 3, "额外生成三个月岛" },
            } },
            { modid .. '_shape', '形状', '', 'circle', {
                { "圆形", 'circle', "额外生成圆形月岛" },
                { "方形", 'square', "额外生成方形月岛" },
            } },
            { modid .. '_size', '大小', '单位是地皮', 19, {
                { "19x19", 19 },
                { "33x33", 33 },
            } },
            { modid .. '_beach', '外围沙滩', '将外围2圈换成岩石海滩地皮', true, {
                { "禁用", false },
                { "启用", true },
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
                { "绿洲湖泊", "oasislake", "建议禁用中心水域。不影响沙漠绿洲" },
                { "原生的水中木", "watertree_pillar", "大树干" },
                { "移植的水中木", "oceantree_pillar", "高出平均值的树干（自带苔癣藤条）" },
            } },
            { modid .. '_oceanvine', '水中木无花果藤条位置', '若在"中心实体"中选择"移植水中木"，其本身会自动生成3条，加上此设定会有7条', false, {
                { "禁用", false, "无额外苔癣藤条" },
                { "上下左右各1条", "cross" },
                { "四角方位各1条", "square" },
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
            { "自然資源生成（密度总和超过100%会按比例分配）" },
            { modid .. '_clear_space', '强制空地比例', '每座岛至少有多少比例的地皮是空地', 30, {
                { "禁用", 0 }, { "10%", 10 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_starfish', '海星密度', '每座岛生成的海星数量占可用地皮的比例', 10, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_kelp', '海带根密度', '每座岛生成的公牛海带根数量占可用地皮的比例', 10, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_bones', '海骨密度', '每座岛生成的海骨数量占可用地皮的比例', 3, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_driftwood', '浮木密度', '每座岛生成的浮木数量占可用地皮的比例', 10, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_lunatree', '月树密度', '每座岛生成的月树数量占可用地皮的比例', 5, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_sapling', '树苗密度', '每座岛生成的树苗数量占可用地皮的比例', 3, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_stonefruit', '石果密度', '每座岛生成的石果灌木丛数量占可用地皮的比例', 10, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_moonglass', '月光玻璃密度', '每座岛生成的月光玻璃矿数量占可用地皮的比例', 5, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_moonrock', '月岩密度', '每座岛生成的月岩数量占可用地皮的比例', 3, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_goldrock', '金矿密度', '每座岛生成的金矿数量占可用地皮的比例', 1, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_rock', '岩石密度', '每座岛生成的岩石数量占可用地皮的比例', 2, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_caverock', '落石密度', '每座岛生成的落石数量占可用地皮的比例', 0, {
                { "不生成", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
        }
    },
    ['en'] = {
        name = "Extra Circular Lunar Island",
        description = 'For detailed features, please check the mod settings.\n\nGenerates one or more extra circular/square Lunar Islands without affecting the original one. Perfect for a base (Wickerbottom\'s favorite).',
        config = {
            { modid .. '_num', 'Amount', 'How many extra Lunar Islands to generate', 1, {
                { "1", 1, "Generate 1 extra Lunar Island" },
                { "2", 2, "Generate 2 extra Lunar Islands" },
                { "3", 3, "Generate 3 extra Lunar Islands" },
            } },
            { modid .. '_shape', 'Shape', '', 'circle', {
                { "Circle", 'circle', "Generate a circular Lunar Island" },
                { "Square", 'square', "Generate a square Lunar Island" },
            } },
            { modid .. '_size', 'Size', 'Unit is tile', 19, {
                { "19x19", 19 },
                { "33x33", 33 },
            } },
            { modid .. '_beach', 'Outer Beach', 'Replace the outer 2 rings with Shell Beach Turf', true, {
                { "Disabled", false },
                { "Enabled",  true },
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
                { "Oasis Lake",                "oasislake",        "Recommended to disable Center Water. Doesn't affect Desert Oasis Lake" },
                { "Native Knobbly Tree",       "watertree_pillar", "Great Tree Trunk" },
                { "Transplanted Knobbly Tree", "oceantree_pillar", "Above-Average Tree Trunk (with its own mossy vines)" },
            } },
            { modid .. '_oceanvine', 'Mossy Vine Position',
                'The "Above-Average Tree Trunk" spawns 3 vines automatically. This setting adds up to 7 vines.', false, {
                { "Disabled",                  false,   "No extra Mossy Vines" },
                { "Cross (1 on each side)",    "cross" },
                { "Square (1 on each corner)", "square" },
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
                { "5",   5,   "Corners will exceed canopy shade, use with canopy expanding mods" },
                { "5.5", 5.5, "Corners will exceed canopy shade, use with canopy expanding mods" },
                { "6",   6,   "Corners will exceed canopy shade, use with canopy expanding mods" },
            } },
            { "Natural Resources Generation (Proportional if total exceeds 100%)" },
            { modid .. '_clear_space', 'Mandatory Clear Space', 'Minimum percentage of clear tiles reserved per island', 30, {
                { "Disabled", 0 }, { "10%", 10 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_starfish', 'Starfish Density', 'Percentage of available tiles to spawn Starfish', 10, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_kelp', 'Bull Kelp Root Density', 'Percentage of available tiles to spawn Bull Kelp Roots', 10, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_bones', 'Sea Bones Density', 'Percentage of available tiles to spawn Sea Bones', 3, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_driftwood', 'Driftwood Density', 'Percentage of available tiles to spawn Driftwood', 10, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_lunatree', 'Lune Tree Density', 'Percentage of available tiles to spawn Lune Trees', 5, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_sapling', 'Sapling Density', 'Percentage of available tiles to spawn Saplings', 3, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_stonefruit', 'Stone Fruit Bush Density', 'Percentage of available tiles to spawn Stone Fruit Bushes', 10, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_moonglass', 'Moonglass Rock Density', 'Percentage of available tiles to spawn Moonglass Rocks', 5, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_moonrock', 'Moonrock Density', 'Percentage of available tiles to spawn Moonrocks', 3, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_goldrock', 'Gold Vein Density', 'Percentage of available tiles to spawn Gold Veins', 1, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_rock', 'Boulder Density', 'Percentage of available tiles to spawn Boulders', 2, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
            { modid .. '_caverock', 'Cave-in Boulder Density', 'Percentage of available tiles to spawn Cave-in Boulders', 0, {
                { "None", 0 }, { "1%", 1 }, { "2%", 2 }, { "3%", 3 }, { "5%", 5 }, { "10%", 10 }, { "15%", 15 }, { "20%", 20 }, { "25%", 25 }, { "30%", 30 }, { "40%", 40 }, { "50%", 50 }, { "60%", 60 }, { "70%", 70 }, { "75%", 75 }, { "80%", 80 }, { "90%", 90 }, { "100%", 100 },
            } },
        }
    }
}

-- 决定当前用的语言
local cur = (locale == 'zh' or locale == 'zhr' or locale == 'zht') and 'zh' or 'en'

-- mod相关信息
version = '1.1.0'
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
end

configuration_options = _configuration_options
