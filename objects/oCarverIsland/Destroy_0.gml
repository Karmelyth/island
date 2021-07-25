/// @description Insert description here
// You can write your code in this editor

if lakes > 0{
	var _x = xstart + grid_scale * irandom(6) * choose(-1, 1),
		_y = ystart + grid_scale * irandom(6) * choose(-1, 1);

	repeat(lakes){
		instance_create_layer(_x, _y, "lFloor", oCarverLake);
		_x = xstart + grid_scale * irandom(6) * choose(-1, 1);
		_y = ystart + grid_scale * irandom(6) * choose(-1, 1);
	}
}