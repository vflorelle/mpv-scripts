var running = false;
var timer;

function show_current_speed() {
    running = !running;
    if (running) {
        timer = setInterval(function() {
            var currentspeed = mp.get_property("speed");
            mp.osd_message("Speed: " + (Math.round(currentspeed * 100) / 100).toFixed(2), 1);
        }, 1000);
    } else {
        clearInterval(timer);
    }
}

mp.add_key_binding("ctrl+s", "show_current_speed", show_current_speed);
