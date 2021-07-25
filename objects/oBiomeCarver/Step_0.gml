/// @description Insert description here
// You can write your code in this editor

if !place_meeting(x, y, oFloor){
	if irandom(0) != 0{
		goal--;
		carve_room(0, 0, biome);
	}else{
		goal -= carve_room(2 + irandom(3), 2 + irandom(3), biome);	
	}
}

if irandom(1) = 0{
	direction += 90 * irandom(2);	
}
if x <= grid_scale || x >= room_width - grid_scale || y <= grid_scale || y >= room_height - grid_scale{
	direction -= 180;
}
x += lengthdir_x(grid_scale, direction);
y += lengthdir_y(grid_scale, direction);