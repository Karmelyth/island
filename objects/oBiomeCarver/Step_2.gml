/// @description Insert description here

if instance_exists(island_object) with island_object{
	
	cur_x = other.x;
	cur_y = other.y;
	
	lx = min(other.lx, lx);
	rx = max(other.rx, rx);
	ty = min(other.ty, ty);
	by = min(other.by, by);
	image_xscale = (lx - rx) / 2;
	image_yscale = (ty - by) / 2;
	x = image_xscale;
	y = image_yscale;
}