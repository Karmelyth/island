/// @description Insert description here
// You can write your code in this editor

if !place_meeting(x, y, oFloor){
	goal--;
	instance_create_layer(x, y, "lFloor", oFloor);
}

x += lengthdir_x(grid_scale, direction);
y += lengthdir_y(grid_scale, direction);

if goal <= 0{
	instance_destroy();	
}