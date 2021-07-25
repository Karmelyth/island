/// @description Insert description here
// You can write your code in this editor

var _island_margin = 4; // island detection safety margin
lx += _island_margin * grid_scale;
rx -= _island_margin * grid_scale;
ty += _island_margin * grid_scale;
by -= _island_margin * grid_scale;

with instance_create_layer(lx, by, "lIsland", oIsland){
	image_xscale = other.rx - other.lx;
	image_yscale = other.ty - other.by;
	creator = other;
	var _island = self;
}


if rivers > 0{
	repeat(rivers){
		
	var _axis = irandom(3),
		_dir  = 0,
		_x    = 0,
		_y    = 0;
		
		switch _axis{
			case 0: _x = rx; _y = random_range(ty * .65, by * 1.35); break;
			case 1: _x = random_range(lx * .65, rx * 1.35); _y = ty; break;
			case 2: _x = lx; _y = random_range(ty * .65, by * 1.35); break;
			case 3: _x = random_range(lx *.65, rx * 1.35); _y = by; break;
		}
	
		with instance_create_layer(_x, _y, "lFloor", oCarverRiver){
			direction = 90 * _axis;
			creator = other;
			island = _island; // the island its intended for
		}
	}
}

carver_finalize();