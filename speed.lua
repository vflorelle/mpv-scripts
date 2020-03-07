local running = false
local timer

function show_current_speed()
    running = not running
    if running then
        timer = mp.add_periodic_timer(1, function()
            local currentspeed = mp.get_property("speed")
            mp.osd_message("Speed: "..("%.2f"):format(math.floor(currentspeed * 1000) / 1000), 1)
        end)
    else
        timer:stop()
    end
end

mp.add_key_binding("ctrl+s", "show_current_speed", show_current_speed)
