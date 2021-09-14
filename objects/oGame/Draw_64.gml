/// @description Insert description here
// You can write your code in this editor

// Draw Mouse:
//draw_sprite(sMouse, 0, window_mouse_get_x(), window_mouse_get_y());

var _str = string(fps) + "/" + string(room_speed) + "FPS"
draw_text_shadow(10, 10, _str);

// Devmode drawing:
if dev{
	var _add = string(round(instance_number(oFloor) / goal_total * 100)) + "% " + "(" + string(instance_number(oFloor)) + ")"
	_str = "GENERATING..." + _add;
	if !instance_exists(oBiomeCarver){
		_str = "DONE! " + string(round(instance_number(oFloor) / goal_total * 100)) + "% " + "(" + string(instance_number(oFloor)) + ")";	
	}
	draw_text_shadow(10, 36, _str)
		
	_str = "'B' = TOGGLE OVERLAY";
    draw_text_shadow(10, window_get_height() - 26 - 5, _str);
	
	_str = "'R' = RESTART";
    draw_text_shadow(10, window_get_height() - 52 - 5, _str);
}