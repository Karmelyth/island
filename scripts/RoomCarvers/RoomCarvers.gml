// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Checks if a floor tile exists on a given coordinate
function floor_check(X, Y){
	var _f = false;
	
	if instance_exists(oFloor){
		var _bro = instance_nearest(X, Y, oFloor);
		if point_distance(X, Y, _bro.x, _bro.y) < grid_scale{
			_f = true;	
		}
	}
		
	return _f;
}

function carve_room(WIDTH, HEIGHT, BIOME){
	// carve_room(2, 4) would make a 4 x 8 room (WIDTH AND HEIGHT are diameters)
	var _w = WIDTH * 2 + 1,  // room width to create
	    _h = HEIGHT * 2 + 1, // room height to create
		_x = -grid_scale * WIDTH,
		_y = -grid_scale * HEIGHT,
		_a = 0; // amount of floors created
		
	do{
		do{
			
			if floor_check(x + _x, y + _y){
				with instance_nearest(x + _x, y + _y, oFloor){
					instance_destroy();	
					_a--;
				}
			}
			with instance_create_layer(x + _x, y + _y, "lFloor", biome_to_floor(BIOME)){
				island_index = other.island_index;
				//image_index = tile_get(self);
			}
			_a++;
				
			_h--;
			_y += grid_scale;
			
		}until (_h <= 0)
		
		_w--;
		_x += grid_scale;
		
		_h = HEIGHT * 2 + 1;
		_y -= grid_scale * _h;
	}until (_w <= 0)
	
	return _a;
}

function carve_rectangle(WIDTH, HEIGHT, BIOME){
	var _a = 0,
		_w = WIDTH,
		_h = HEIGHT,
		_x = -grid_scale * _w,
		_y = -grid_scale * _h;
	
	do{
		do{
			
			if place_meeting(x + _x, y + _y, oFloor){
				with instance_nearest(x + _x, y + _y, oFloor){
					instance_destroy();	
				}
				_a--;
			}
			with instance_create_layer(x + _x, y + _y, "lFloor", biome_to_floor(BIOME)){
				island_index = other.island_index;
				//image_index = tile_get(self);
			}
			_a++;
				
			_h--;
			_y += grid_scale;
			
		}until (_h <= 0)
		
		_w--;
		_x += grid_scale;
		
		_h = HEIGHT;
		_y -= grid_scale * _h;
	}until (_w <= 0)
	
	return _a;
}

function carve_circle(RADIUS, ACCURACY, BIOME){
	var _a = 0,
	    _n = ACCURACY,
	    _w = RADIUS - ACCURACY,
		_h = RADIUS;
	do{
		_a += carve_room(max(_w, 0), max(_h, 0), BIOME);
		_w++;
		_n--;
		_h--;
	}until (_n < 0)
	
	return _a;
}

function biome_to_floor(BIOME){
	switch BIOME{
		case biome_forest: return oFloorForest;
		case biome_lake  : return oFloorLake;
		case biome_beach : return oFloorBeach;
		default: return oFloor;
	}
}

// Counts how many adjacent tile a given tile has:
function floor_get_neighbors(X, Y){
	var _x = -1,
		_y = -1,
		_i = 0;
		
	do{
		do{			
			_i += floor_check(X + _x * grid_scale, Y + _y * grid_scale);
			_y++;
			
		}until(_y > 1)
		_y = -1;
		_x++;
	}until(_x > 1)
	return _i - 1;
}

// Removes some ugly singular tiles:
function carver_finalize(){
	if instance_exists(oFloor){
		with oFloor{
			
			if floor_get_neighbors(x, y) < 1{
				instance_destroy();
			}
		}
	}
}