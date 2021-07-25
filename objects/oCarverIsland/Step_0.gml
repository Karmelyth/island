/// @description Insert description here
// You can write your code in this editor

var _i = 0;
do{ // yeah this is taking too long
	
	_i++;
	if margin > 0{
		margin--;	
		if margin = 0{
			xstart = x;
			ystart = y;
		}
	}else{
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
		
			// Placing the floors:
			if !floor_check(x, y){
				
				var _r = 2 + irandom(4),
				    _d = choose(-1, 1);
				
				carve_circle(_r, max(_r - 1, 1), biome);
				x -= lengthdir_x(grid_scale * (2 + irandom(1)) * _d, direction);
				y -= lengthdir_y(grid_scale * (2 + irandom(1)) * _d, direction);
				_r = max(_r - irandom(2), 2);
				carve_circle(_r, max(_r - 2, 1), biome_lake);
				goal--;
				
			}else{
				failsafe = 0;	
			}
		}
	}

	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		instance_destroy();
		exit;
	}
	x += lengthdir_x(grid_scale, direction);
	y += lengthdir_y(grid_scale, direction);

}until (goal <= 0 || _i >= 1 || failsafe >= 200)
if goal <= 0 instance_destroy();