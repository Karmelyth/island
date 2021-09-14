/// @description Insert description here

/* Out of bounds collision:
if !instance_exists(oBiomeCarver){
	var _set = 0,
		_xsp = 0,
		_ysp = 0;
 	
	if bbox_left < 0{
		_xsp = 1;
		_set = true;
	}
	if bbox_right > room_width{
		_xsp = -1;
		_set = true;
	}
	if bbox_top < 0{
		_ysp = 1;
		_set = true;
	}
	if bbox_bottom > room_height{
		_ysp = -1;
		_set = true;
	}

	if _set = true{
		with oFloor{
			if island_index = other.island_index{
				x += grid_scale * _xsp;
				y += grid_scale * _ysp;
			}
		}
		
		x += grid_scale * _xsp;
		y += grid_scale * _ysp;
	}
}