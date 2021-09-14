/// @description Insert description here

var _i = 0;
if csb >= 1 do{ // its awesome now :)
	csb = 0;
	_i++;
	
	//Force Carver to stay close to its origin:
	if max_margin > 0 && point_distance(xstart, ystart, x, y) >= (grid_scale * max_margin){
		var _dir = point_direction(x, y, xstart, ystart);
		direction = _dir - _dir mod 90;
		x += lengthdir_x(grid_scale * (max_failsafe + 1), direction);
		y += lengthdir_y(grid_scale * (max_failsafe + 1), direction);
		
	}else{
				
		// Placing the floors:
		goal -= carve_circle(carve_size, carve_round, biome);
		if outline_size > 0{
			carve_circle(carve_size + outline_size, carve_round, biome_replace);
		}
		
		rx = max(x + (carve_size + outline_size) * grid_scale, rx);
		lx = min(x - (carve_size + outline_size) * grid_scale, lx);
		by = max(y + (carve_size + outline_size) * grid_scale, by);
		ty = min(y - (carve_size + outline_size) * grid_scale, ty);	
	}
	
	// Move the carver:
	var _failsafe = 0;
	do{
		x += lengthdir_x(grid_scale, direction);
		y += lengthdir_y(grid_scale, direction);
		
		x = modulate(x, 1);
		y = modulate(y, 1);
		_failsafe++;
			
		// Randomly change directions:
		if chance(turn_chance){
			direction += choose(-90, 90);	
		}
	}until(_failsafe >= max_failsafe)

}until (goal <= 0 || _i >= carve_speed)

instance_destroy(self, true);