/// @description Insert description here

repeat(lakes){
		var _dir = random(360);
		with carver_create((lx + rx)/2 + lengthdir_x(max_margin * .3 * grid_scale, _dir), (ty + by)/2 + lengthdir_y(max_margin * .3 * grid_scale, _dir), oCarverLake){
			goal = other.lakegoal;
			island_index = other.island_index;
			parent_biome = biome_remove;
			rivers = other.lakerivers;
			biome = biome_remove;
			border_margin = -1;
			max_margin = other.max_margin * .9 // set inner radius here
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
	biome		 = other.biome;
	
	// Experimental Player placement:
	if instance_number(oIsland) = 0{
		var _p = instance_create_layer(oFloor.x, oFloor.y, "lIsland", oPlayer);
		cam_target = _p;
	}
};