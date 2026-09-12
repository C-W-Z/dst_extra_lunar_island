---@diagnostic disable: lowercase-global, undefined-global

local modid = 'extra_circle_lunar'

local onoff = {
    { "禁用", false },
    { "啟用", true },
}

local LANGS = {
    ['zh'] = {
        name = '額外圓形月島',
        description = '額外生成一個圓形月島，不影響原本月島。',
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
            { modid .. '_num', '數量', '生成幾個額外月島', 1, {
                { "1", 1, "額外生成一個月島" },
                { "2", 2, "額外生成兩個月島" },
                { "3", 3, "額外生成三個月島" },
            } },
            { modid .. '_shape', '形狀', '', 'circle', {
                { "圓形", 'circle', "額外生成圓形月島" },
                { "方形", 'square', "額外生成方形月島" },
            } },
            { modid .. '_size', '大小', '', 19, {
                { "19x19", 19, "19x19地皮" },
                { "33x33", 33, "19x19地皮" },
            } },
            { modid .. '_beach', '外圍沙灘', '將外圍換成岩石海灘地皮', false, {
                { "禁用", false },
                { "啟用", true },
            } },
            { modid .. '_center_water', '中心水域', '將圓心挖空成內海', false, {
                { "禁用", false, "實心地面，可以放冰眼結晶器或避雷針" },
                { "1x1", 0, "中心1x1水域，可以釣魚？" },
                { "3x3", 1, "中心3x3水域，可以種植水中木" },
                { "5x5", 2, "中心5x5水域，可以種植水中木" },
            } },
            { modid .. '_center_entity', '中心實體', '在圓心生成一個實體', false, {
                { "禁用", false },
                { "溫泉", "hotspring", "溫泉（需要禁用中心水域）" },
                { "綠洲湖泊", "oasislake", "綠洲湖泊（需要禁用中心水域）" },
                { "原生水中木", "watertree_pillar", "原生的水中木母樹（大樹幹）" },
                { "移植水中木", "oceantree_pillar", "移植的水中木（高出平均值的樹幹）" },
            } },
            { modid .. '_oceanvine', '水中木無花果藤條位置', '若在"中心實體"中選擇"移植水中木"，其本身會自動生成3條，加上此設定會有7條', false, {
                { "禁用", false, "無額外苔癬藤條" },
                { "上下左右各1條", "cross" },
                { "四角方位各1條", "square" },
            } },
            { modid .. '_oceanvine_distance', '無花果藤條與中心距離', '需要啟用"水中木無花果藤條位置"才會生效', 2, {
                { "1", 1, "距離中心1格地皮" },
                { "1.5", 1.5, "距離中心1.5格地皮" },
                { "2", 2, "距離中心2格地皮" },
                { "2.5", 2.5, "距離中心2.5格地皮" },
                { "3", 3, "距離中心3格地皮" },
                { "3.5", 3.5, "距離中心3.5格地皮" },
                { "4", 4, "位置選擇四角的話會超出庇蔭範圍，可配合擴大水中木範圍的模組使用" },
                { "4.5", 4.5, "會超出庇蔭範圍，可配合擴大水中木範圍的模組使用" },
                { "5", 5, "會超出庇蔭範圍，可配合擴大水中木範圍的模組使用" },
                { "5.5", 5.5, "會超出庇蔭範圍，可配合擴大水中木範圍的模組使用" },
                { "6", 6, "會超出庇蔭範圍，可配合擴大水中木範圍的模組使用" },
            } },
            { modid .. '_starfish', '海星數量', '在額外月島上隨機生成的海星數量', 0, {
                { "禁用", 0 },
                { "10個", 10 },
                { "25個", 25 },
                { "50個", 50 },
                { "100個", 100 },
            } },
        }
    },
    ['en'] = {
        name = "Extra Circular Lunar Island",
        description = '',
        config = {
            -- { 'LANGUAGE' },
            -- { modid .. '_lang', 'language', 'choose language', 'en', {
            --     { '简体中文', 'cn' },
            --     { 'English', 'en' }
            -- } },
            -- { 'FUNCTIONS' },
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
priority = 0                                 -- 加载优先级，越低加载越晚，默认为0

dst_compatible = true                        -- 联机版适配性
dont_starve_compatible = false               -- 单机版适配性
reign_of_giants_compatible = false           -- 单机版：巨人国适配性
-- all_clients_require_mod = true     -- 服务端/所有端模组
server_only_mod = true                       -- 仅服务端模组
-- client_only_mod = true -- 仅客户端模组
server_filter_tags = { 'creature', 'tweak' } -- 创意工坊模组分类标签
icon_atlas = 'modicon.xml'                   -- 图集
icon = 'modicon.tex'                         -- 图标

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
