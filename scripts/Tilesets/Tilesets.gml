// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tile_get(INSTANCE){
		
	var _i = 0,
		_nort = floor_check(INSTANCE.x, INSTANCE.y - grid_scale),
	    _east = floor_check(INSTANCE.x + grid_scale, INSTANCE.y),
		_sout = floor_check(INSTANCE.x, INSTANCE.y + grid_scale),
		_west = floor_check(INSTANCE.x- grid_scale, INSTANCE.y);
	
	switch _nort{
		case true:
			image_index = 1;
			switch _east{
				case true: 
					image_index = 0;
				break;
			}
			switch _west{
				case true: 
					image_index = 2;
				break;
			}
		break;
	}

	return ;
}