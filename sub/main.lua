local msg = require 'mp.msg'
local utils = require 'mp.utils'

function set_current_sub()
    local t = { args = { mp.get_script_directory().."/sub.exe" } }
    local res = utils.subprocess(t)
    msg.info(utils.to_string(res))
    if res.status == 0 and res.error_string == "" and res.killed_by_us == false then
        local value = res.stdout
        if value ~= "error" and (value == "no" or value == "auto" or (string.match(value, "%p+") == nil and string.match(value, "%d+") ~= nil and tonumber(value) ~= nil and tonumber(value) >= 0 and tonumber(value) <= 8190)) then -- 0-8190 (integer range)
            mp.set_property("sub", value)
        end
    end
end

mp.add_key_binding("ctrl+t", "set_current_sub", set_current_sub)
