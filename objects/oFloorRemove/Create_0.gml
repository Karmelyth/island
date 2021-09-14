event_inherited();

biome = biome_remove;
priority = 1;

alarm[0] = room_speed / 2;

with instance_place(x, y, oFloor){
	instance_destroy(self, false);	
}