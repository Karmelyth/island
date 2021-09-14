/// @description Insert description here
// You can write your code in this editor

var _i = 0;
if csb >= 1 do{ // yeah this is taking too long
	csb = 0;
	_i++;
		
	// Turning:
	
	dirextra += 1;
	direction = dirextra;
	
	var _x = x + lengthdir_x(grid_scale * (size + border_margin), direction),
		_y = y + lengthdir_y(grid_scale * (size + border_margin), direction);
		
	// Placing the floors:	
	goal -= carve_circle(carve_size, carve_round, biome);
	if outline_size > 0{
		carve_circle(carve_size + outline_size, carve_round + outline_size, outline_biome);
	}

	if x <= grid_scale * 2 || x >= room_width - grid_scale * 2 || y <= grid_scale * 2 || y >= room_height - grid_scale * 2{
		instance_destroy();
	}
	
	x += lengthdir_x(grid_scale, direction);
	y += lengthdir_y(grid_scale, direction);

}until (goal <= 0 || _i >= 1 || dirextra >= 420)
csb += carve_speed;

if goal <= 0 || dirextra >= 420 instance_destroy();