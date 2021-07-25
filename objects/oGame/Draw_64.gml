/// @description Insert description here
// You can write your code in this editor

// Devmode drawing
if dev{
	var _str = string(fps) + "/" + string(room_speed) + "FPS"
	draw_text_shadow(10, 10, _str);
	
	_str = "GENERATING...";
	if !instance_exists(oBiomeCarver){
		_str = "DONE!"	
	}
	draw_text_shadow(10, 36, _str);
	
	/* GOOD FOR ADJACENCY TESTING
	var _bro = instance_nearest(mouse_x, mouse_y, oFloor)
	draw_circle(_bro.x, _bro.y, grid_scale / 2, false)
	
	var _x = -1,
		_y = -1,
		
	do{
		do{			
			if (_y != 0 || _x != 0) && floor_check(_bro.x + _x * grid_scale, _bro.y + _y * grid_scale){
				draw_circle_color(_bro.x + _x * grid_scale, _bro.y + _y * grid_scale, grid_scale / 4, c_red, c_red, false)	
			}
			_y++;
			
		}until(_y > 1)
		_y = -1;
		_x++;
	}until(_x > 1)
	*/
}