/// @description Insert description here
// You can write your code in this editor

var _i = 0;
do{ // yeah this is taking too long
	_i++;
	failsafe++;
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
		if irandom(2) = 0{
			direction += choose(-90, 90);	
		}
	
		// Placing the floors:
		if !floor_check(x, y){
			if irandom(6) = 0{
				goal -= carve_room(1, 1, biome);
			}else{
				var _size =  2 + irandom(1),
				    _edge = 1 + irandom(1);
				if irandom(4) = 0 _size += 1 + irandom(1);
				if _size = 2 _edge = 1;
				goal -= carve_circle(_size, _edge, biome);
				
				lx = max(x + _size * grid_scale, lx);
				rx = min(x - _size * grid_scale, rx);
				ty = max(y + _size * grid_scale, ty);
				by = min(y - _size * grid_scale, by);
			}
		}else{
			failsafe = 0;	
		}
	}

	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		direction -= 180;
	}
	x += lengthdir_x(grid_scale, direction);
	y += lengthdir_y(grid_scale, direction);

}until (goal <= 0 || _i >= 10 || failsafe >= 200)
if goal <= 0 instance_destroy();