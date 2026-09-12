---@diagnostic disable: lowercase-global, undefined-global

local modid = 'extra_circle_lunar'

local LANGS = {
    ['zh'] = {
        name = '额外圆形月岛',
        description = '详细功能请查看模组设置\n\n额外生成一个或多个圆形/方形月岛，不影响原本月岛，可作为基地使用（薇克巴顿最爱）。',
        config = {
            -- {'设置的id','设置的名称','聚焦时显示的提示',默认值,{
            --     {选项一,值},
            --     {选项二,值}
            -- }},
            -- { '语言' },
            -- { modid .. '_lang', '语言', '语言', 'cn', {
            --     { '简体中文', 'cn' },
            --     { 'English', 'en' }
            -- } },
            -- { '功能' },
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
            { "自然生成" },
            { modid .. '_starfish', '海星数量', '每座额外月岛最多生成几个海星', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 }, { "40个", 40 }, { "50个", 50 }, { "75个", 75 }, { "100个", 100 },
            } },
            { modid .. '_kelp', '海带根数量', '每座额外月岛最多生成几个公牛海带根', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
            { modid .. '_bones', '海骨数量', '每座额外月岛最多生成几个海骨', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
            { modid .. '_driftwood', '浮木数量', '每座额外月岛最多生成几个浮木', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
            { modid .. '_lunatree', '月树数量', '每座额外月岛最多生成几棵月树', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
            { modid .. '_sapling', '树苗数量', '每座额外月岛最多生成几个树苗', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
            { modid .. '_stonefruit', '石果数量', '每座额外月岛最多生成几个石果灌木丛', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
            { modid .. '_moonglass', '月光玻璃数量', '每座额外月岛最多生成几个月光玻璃矿', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
            { modid .. '_moonrock', '月岩数量', '每座额外月岛最多生成几个月岩', 0, {
                { "禁用", 0 }, { "5个", 5 }, { "10个", 10 }, { "15个", 15 }, { "20个", 20 }, { "25个", 25 }, { "30个", 30 },
            } },
        }
    },
    ['en'] = {
        name = "Extra Circular Lunar Island",
        description =
        'For detailed features, please check the mod settings.\n\nGenerates one or more extra circular/square Lunar Islands without affecting the original one. Perfect for a base (Wickerbottom\'s favorite).',
        config = {
            -- { 'LANGUAGE' },
            -- { modid .. '_lang', 'Language', 'Choose language', 'en', {
            --     { '简体中文', 'cn' },
            --     { 'English', 'en' }
            -- } },
            -- { 'FUNCTIONS' },
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
                { "5",   5,   "Corners will exceed the shelter, recommended to use with shelter expanding mods" },
                { "5.5", 5.5, "Corners will exceed the shelter, recommended to use with shelter expanding mods" },
                { "6",   6,   "Corners will exceed the shelter, recommended to use with shelter expanding mods" },
            } },
            { "Natural Generation" },
            { modid .. '_starfish', 'Starfish Count', 'Max Starfish spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 }, { "40", 40 }, { "50", 50 }, { "75", 75 }, { "100", 100 },
            } },
            { modid .. '_kelp', 'Bull Kelp Root Count', 'Max Bull Kelp Roots spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
            { modid .. '_bones', 'Sea Bones Count', 'Max Sea Bones spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
            { modid .. '_driftwood', 'Driftwood Count', 'Max Driftwood spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
            { modid .. '_lunatree', 'Lune Tree Count', 'Max Lune Trees spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
            { modid .. '_sapling', 'Sapling Count', 'Max Saplings spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
            { modid .. '_stonefruit', 'Stone Fruit Bush Count', 'Max Stone Fruit Bushes spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
            { modid .. '_moonglass', 'Moonglass Rock Count', 'Max Moonglass Rocks spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
            { modid .. '_moonrock', 'Moon Rock Count', 'Max Moon Rocks spawned per extra island', 0, {
                { "Disabled", 0 }, { "5", 5 }, { "10", 10 }, { "15", 15 }, { "20", 20 }, { "25", 25 }, { "30", 30 },
            } },
        }
    }
}

-- 决定当前用的语言
local cur = (locale == 'zh' or locale == 'zhr' or locale == 'zht') and 'zh' or 'en'

-- mod相关信息
version = '1.0.0'
author = 'Icya'
forumthread = ''
api_version = 10
priority = 0                                                   -- 加载优先级，越低加载越晚，默认为0

dst_compatible = true                                          -- 联机版适配性
dont_starve_compatible = false                                 -- 单机版适配性
reign_of_giants_compatible = false                             -- 单机版：巨人国适配性
-- all_clients_require_mod = true     -- 服务端/所有端模组
server_only_mod = true                                         -- 仅服务端模组
-- client_only_mod = true -- 仅客户端模组
server_filter_tags = { 'worldgen', 'environment', 'scenario' } -- 创意工坊模组分类标签
icon_atlas = 'modicon.xml'                                     -- 图集
icon = 'modicon.tex'                                           -- 图标

-- 以下自动配置
name = LANGS[cur].name
description = version .. '\n' .. LANGS[cur].description

local config = LANGS[cur].config or {}
local _configuration_options = {}
for i = 1, #config do
    -- 判斷陣列長度，如果只有 1 個元素，代表是分類標題
    if #config[i] == 1 then
        _configuration_options[i] = {
            name = config[i][1] .. "_section",
            label = config[i][1],
            section_start = true, -- 啟用分區標識
            options = { { description = "", data = "" } },
            default = ""
        }
    else
        -- 長度大於 1，代表是普通的設定選項，執行你原本的邏輯
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
end

configuration_options = _configuration_options
