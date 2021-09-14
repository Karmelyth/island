/// @description Insert description here
// You can write your code in this editor
if instance_exists(carver_parent){exit}

var _i = 0;
if csb >= 1 do{ // its awesome now :)
	csb = 0;
	_i++;
	
	if chance(carve_turnchance){
		direction += 18 * choose( 1, 1, 1, 1, -1, -1, -1);
	}
	
	x += lengthdir_x(grid_scale, direction);
	y += lengthdir_y(grid_scale, direction);	
	
	// Placing the floors:
	if outline_size >= 0 goal_total += carve_room(carve_width + outline_size, carve_height + outline_size, biome_replace);
	carve_goal -= carve_room(carve_width, carve_height, carve_biome);

	if !place_meeting(x + lengthdir_x(carve_width * grid_scale, direction), y + lengthdir_y(carve_width * grid_scale, direction), oFloor){
		instance_destroy(self, true);
		exit;
	}

}until (_i >= carve_speed)
csb += carve_speed;