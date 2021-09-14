/// @description Insert description here

var _i = 0;
do{ // its awesome now :)
	_i++;
	
	//Force Carver to stay close to its origin:
	if max_margin > 0 && point_distance(xstart, ystart, x, y) >= (grid_scale * max_margin){
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
			if chance(90){
				direction += choose(-90, 90);	
			}
		}until(!floor_check(x, y) || _failsafe >= max_failsafe)
	
		// Placing the floors:
		var _size = 1,
			_edge = 0;
			
		if irandom(6) != 0{
			_size = 2 + irandom(1);
			_edge = 1 + irandom(1);
			
			if irandom(4) = 0 _size += 1 + irandom(1);
			if _size = 2 _edge = 1;	
		}
		goal -= carve_circle(_size, _edge, biome);
		
		lx = max(x + _size * grid_scale, lx);
		rx = min(x - _size * grid_scale, rx);
		ty = max(y + _size * grid_scale, ty);
		by = min(y - _size * grid_scale, by);
	}

    // Turn around if carver is out of bounds:
	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		direction -= 180;
	}
	
}until (goal <= 0 || _i >= carve_speed)

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