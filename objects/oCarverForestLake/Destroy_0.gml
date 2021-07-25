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

var _island_margin = 4; // island detection safety margin
lx += _island_margin * grid_scale + grid_scale / 2;
rx -= _island_margin * grid_scale + grid_scale / 2;
ty += _island_margin * grid_scale + grid_scale / 2;
by -= _island_margin * grid_scale + grid_scale / 2;

with instance_create_layer(lx, by, "lIsland", oIsland){
	image_xscale = other.rx - other.lx;
	image_yscale = other.ty - other.by;
	island_index = other.island_index;
}