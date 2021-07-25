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
		
		if floor_check(x, y) && hasmet = false{
			hasmet = true;
			base_direction = direction;
		}
		
		if hasmet = true{
			
			if irandom(4) = 0{
				var _d = choose(-1, 1);
				dir += _d;
				dir = clamp(dir, -1, 1);
				direction = base_direction + 90 * dir;	
			}
		}

		// Placing the floors:	
		carve_circle(1, 1, biome);
		
		if hasmet = true && !place_meeting(x, y, island){
			goal--;
		}
	}

	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		instance_destroy();
	}
	
	x += lengthdir_x(grid_scale, direction);
	y += lengthdir_y(grid_scale, direction);

}until (goal <= 0 || _i >= 1)
if goal <= 0 instance_destroy();