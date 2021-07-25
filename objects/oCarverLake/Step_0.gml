/// @description Insert description here
// You can write your code in this editor

var _i = 0;
do{ // yeah this is taking too long
	_i++;
		
	if point_distance(xstart, ystart, x, y) >= grid_scale * max_margin{
		var _dir = 180;
		if direction > 45{
			_dir += 90;
			if direction > 135{
				_dir += 90;
				if direction > 215{
					_dir += 90;
					if direction > 305{
						_dir += 90;	
					}
				}
			}
		}
		direction = _dir;
	}else{
		if irandom(1) = 0{
			direction += choose(-90, 90);	
		}
	
		// Placing the floors:
		
		if goal = maxgoal || goal <= 1{
			var _size =  2,
				_edge = 1 + irandom(1);
			if _size <= 2 _edge = _size - 1;
			if irandom(3) = 0 _size += irandom(1);
			goal -= carve_circle(_size, _edge, biome);
		}
		
		carve_room(0, 0, biome);
		goal--;
		
	}

	x = clamp(x, 0, room_width);
	y = clamp(y, 0, room_height);
	
	x += lengthdir_x(grid_scale, direction);
	y += lengthdir_y(grid_scale, direction);

}until (goal <= 0 || _i >= 10)