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
		
	}

    // Turn around if carver is out of bounds:
	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		instance_destroy(self, true);
		exit;
	}
	
	goal = 0;
}until (goal <= 0 || _i >= carve_speed)

instance_destroy(self, true);