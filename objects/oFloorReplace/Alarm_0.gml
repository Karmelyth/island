/// @description REPLACE SELF

if !instance_exists(parent){
	
	with floor_place(x, y, outline_biome){
		
		parent = other.parent;
		island_index = other.island_index;
	}
	instance_destroy(self, false);
	exit;
}

alarm[0] = max(current_frame mod 100, 1);