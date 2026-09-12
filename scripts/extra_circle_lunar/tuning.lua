---------------------------------------------------------------------
-- Debug用
---------------------------------------------------------------------
local DEBUG_ENABLED = GetModConfigData('extra_circle_lunar_debug')

TUNING.EXTRA_CIRCLE_LUNAR = {
    MODID = "extra_circle_lunar",
    ---@param mod string
    ---@param msg string
    print = function(mod, msg)
        if DEBUG_ENABLED then
            print("[QoL][" .. mod .. "] " .. msg)
        end
    end,
    ---@param mod string
    ---@param msg string
    announce = function(mod, msg)
        if DEBUG_ENABLED then
            c_announce("[QoL][" .. mod .. "] " .. msg)
        end
    end,
}
