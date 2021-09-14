/// @description Insert description here

var _i = 0;
if csb >= 1 do{ // its awesome now :)
	csb = 0;
	_i++;
	
	//Force Carver to stay close to its origin:
	if max_margin >= 0 && point_distance(xstart, ystart, x, y) >= (grid_scale * max_margin){
		var _dir = point_direction(x, y, xstart, ystart);
		direction = _dir - _dir mod 90;
		x += lengthdir_x(grid_scale * (max_failsafe + outline_size + 1), direction);
		y += lengthdir_y(grid_scale * (max_failsafe + outline_size + 1), direction);
		
	}else{

	
		// Placing the floors:	
		goal -= carve_rectangle(carve_width, carve_height, biome);
		if outline_size > 0{
			carve_rectangle(carve_width + outline_size, carve_height + outline_size, outline_biome);
		}
		
		rx = max(x + (carve_size + outline_size) * grid_scale, rx);
		lx = min(x - (carve_size + outline_size) * grid_scale, lx);
		by = max(y + (carve_size + outline_size) * grid_scale, by);
		ty = min(y - (carve_size + outline_size) * grid_scale, ty);
		
		// Move the carver:
		var _failsafe = 0;
		do{
			x += lengthdir_x(grid_scale, direction);
			y += lengthdir_y(grid_scale, direction);
			_failsafe++;
			
			// Randomly change directions:
			if chance(turn_chance){
				direction += choose(-90, 90);	
			}
		}until(_failsafe >= max_failsafe)
	}

    // Turn around if carver is out of bounds:
	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		instance_destroy(self, true);
		exit;
	}
	
}until (goal <= 0 || _i >= carve_speed)
csb += carve_speed;

// If the carver has created too many floors, delete them until 100% accuracy is reached:
if goal < 0{
	var _overshoot = abs(goal) * can_overshoot,
	    _i = 0;
	do{
		_i++;
		with oFloor{
			if island_index = other.island_index && _overshoot > 0{
				_overshoot--;
				instance_destroy();
			}
		}
	}until(_overshoot = 0 || _i >= carve_speed);
	instance_destroy(self, true);
}