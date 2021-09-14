/// @description DELETE SELF

if !instance_exists(parent){
	instance_destroy(self, false);
	exit;
}

alarm[0] = room_speed / 2;