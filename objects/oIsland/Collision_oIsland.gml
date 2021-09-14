/// @description Island Collision
/*if other.island_index != island_index{

	if !instance_exists(oBiomeCarver){
		var _dir = point_direction(other.x, other.y, x, y),
		    _set = false,
			_xsp = 0,
			_ysp = 0;
 	
		if !_set && _dir > 45 && _dir <= 135{
			_set = true;
			_ysp = -1;
		}
		if !_set && _dir > 135 && _dir <= 215{
			_set = true;
			_xsp = -1;
		}
		if !_set && _dir > 215 && _dir <= 305{
			_set = true;
			_dir = 270;
			_ysp = 1;
		}
		if !_set && (_dir > 305 || _dir <= 45){
			_set = true;
			_dir = 0;
			_xsp = 1;
		}

		speed = 0;

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