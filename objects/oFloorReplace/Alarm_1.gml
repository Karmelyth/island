/// @description FLOOR COLLISION 
if collision_point(x, y, oFloor, false, true){
	instance_destroy(self, false);	
}

alarm[1] = 1//max(current_frame mod 100, 1);