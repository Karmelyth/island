/// @description Insert description here
if instance_exists(carver_parent){exit}

var _i = 0;
if csb >= 1 do{ // its awesome now :)
	csb = 0;
	_i++;
	
	//Force Carver to stay close to its origin:
	if carve_margin > 0 && point_distance(xstart, ystart, x, y) >= (grid_scale * carve_margin){
		var _dir = point_direction(x, y, xstart, ystart);
		direction = _dir - _dir mod 90;
		x += lengthdir_x(grid_scale * (max_failsafe + 1), direction);
		y += lengthdir_y(grid_scale * (max_failsafe + 1), direction);
		
	}else{
			
		// Move the carver:
		var _failsafe = 0;
		do{
			x += lengthdir_x(grid_scale, direction);
			y += lengthdir_y(grid_scale, direction);
			_failsafe++;
			
			// Randomly change directions:
			if chance(carve_turnchance){
				direction += choose(-carve_turnvalue, carve_turnvalue);	
			}
		}until(_failsafe >= max_failsafe)
	
		// Placing the floors:
		var _size = 1,
			_edge = 0;
			
		if irandom(6) != 0{
			_size = 2 + irandom(1);
			_edge = 1 + irandom(1);
			
			if irandom(4) = 0 _size += 1 + irandom(1);
			if _size = 2 _edge = 1;	
		}
		
		if outline_size > 0{
			var _a = choose(0, 0, 1);
			goal_total += carve_circle(carve_width + _size*_a + outline_size * 2, carve_height + _size*_a + outline_size * 2, carve_round + _size*_a + outline_size * 2 + 1, biome_replace);
			
		}
		carve_goal -= carve_circle(carve_width + _size, carve_height + _size, carve_round  + _size, carve_biome);
	}

    // Turn around if carver is out of bounds:
	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		direction -= 180;
	}
	
}until (carve_goal <= 0 || _i >= carve_speed)
csb += carve_speed;

// If the carver has created too many floors, delete them until 100% accuracy is reached:
if carve_goal < 0{
	var _overshoot = abs(carve_goal) * !can_overshoot,
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