/// @description Insert description here
// You can write your code in this editor
if instance_exists(carver_parent){exit}

var _i = 0;
if csb >= 1 do{ // its awesome now :)
	csb = 0;
	_i++;
		
	if carve_margin > 0 && point_distance(xstart, ystart, x, y) >= grid_scale * carve_margin{
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
		if !irandom(9) = 0{
			direction += choose(-90, 90);	
		}
	
		// Placing the floors:
		
		if carve_goal > 0{
			if outline_size >= 0 goal_total += carve_circle(carve_width + outline_size * 2, carve_height + outline_size * 2, carve_round + outline_size * 2 + 1, biome_replace);
			carve_goal -= carve_circle(carve_width, carve_height, carve_round, carve_biome);
		}
		
	}

	x = clamp(x, 0, room_width);
	y = clamp(y, 0, room_height);
	
	x += lengthdir_x(grid_scale, direction);
	y += lengthdir_y(grid_scale, direction);

if carve_goal <= 0{
	instance_destroy(self, true);
	exit;
}
}until (carve_goal <= 0 || _i >= carve_speed)
csb += carve_speed;