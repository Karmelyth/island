/// CARVER FUNCTIONS:
//[real] Spawns a carver with coord correction:
function carver_create(X, Y, CARVER){
	return instance_create_layer(modulate(X, grid_scale), modulate(Y, grid_scale), "lFloor", CARVER);
}

function carve_room(WIDTH, HEIGHT, BIOME){
	var _g = grid_scale,
		_a = 0; // amount of floors created
		
	for (var _j = 0; _j < WIDTH; _j++){
		
		for (var _i = 0; _i < HEIGHT; _i++){
			
			_a += floor_place(x + _g * _j - modulate(WIDTH * _g / 2, _g), y + _g * _i - modulate(HEIGHT * _g / 2, _g), BIOME);		
		}	
	}
	
	return _a;
}

function carve_circle(WIDTH, HEIGHT, ACCURACY, BIOME){
	var _g = grid_scale,
		_a = 0;

	for (var _j = 0; _j < WIDTH; _j++){
		
		for (var _i = 0; _i < HEIGHT; _i++){
			
			var _x = x + _g * _j,
			    _y = y + _g * _i;
			if point_distance(_x - WIDTH * _g / 2 + grid_scale / 2, _y - HEIGHT * _g / 2 + grid_scale / 2, x, y) < (floor(ACCURACY / 2) + .5) * _g{
			
				_a += floor_place(_x - modulate(WIDTH * _g / 2, _g), _y - modulate(HEIGHT * _g / 2, _g), BIOME);		
			}
		}	
	}
	
	return _a;
}

/// FLOOR TILE FUNCTIONS:
//[bool] Checks if a floor tile exists on a given coordinate
function floor_check(X, Y){
	var _check = false,
	    _floor = instance_create_layer(X, Y, "lFloor", oFloor);
	
	with _floor if place_meeting(_floor.x, _floor.y, oFloor){
			_check = true;	
	}
	instance_destroy(_floor, false);
		
	return _check;
}

//[real] Returns the id of a possible colliding floor tile
function floor_check_id(X, Y){
	var _near = instance_nearest(X, Y, oFloor);
	if distance_to_object(_near) <= grid_scale / 2{
		return _near;
	}else{
		return noone;
	}
}

//[bool] Places a floor tile, checking all prerequisites:
function floor_place(X, Y, BIOME){
	
	//Check if floor can be placed:
	if !floor_canplace(modulate(X, grid_scale), modulate(Y, grid_scale), BIOME){
		return 0;
	}
	
	with instance_create_layer(modulate(X, grid_scale), modulate(Y, grid_scale), "lFloor", biome_to_floor(BIOME)){
		island_index = other.island_index;
		parent = other;
		outline_biome = other.outline_biome;
		//image_index = floor_get_tile(self);
		
		if BIOME = biome_river{
			direction = modulate(other.direction, 90);
			image_angle = direction;
		}
		
		return 1;
	}
}
	
//[bool] Checks if floor tiles meet placement criteria:
function floor_canplace(X, Y, BIOME){
	
	switch BIOME{
		
		case biome_remove:
		    return true;
			
		case biome_lake: case biome_river:
			instance_destroy(instance_place(X, Y, oFloorSolid), false);	
			if place_meeting(X, Y, oFloorRemove) || collision_point(X, Y, oFloorWater, false, true){
				return false;
			}
			return true;
		
		case biome_replace:
			if place_meeting(X, Y, oFloor){
				return false;				
			}
			return true;
			
		default: 
		
			if place_meeting(X, Y, oFloorNonGen){
				return false;		
			}		
			return true;
	}
}

//[real] returns the image_index for floor tiles to use:
function floor_get_tile(INSTANCE){
	var _wl = place_meeting(INSTANCE.x - 1, INSTANCE.y, oFloor) << 3,
		_wr = place_meeting(INSTANCE.x + 1, INSTANCE.y, oFloor) << 2,
		_wu = place_meeting(INSTANCE.x, INSTANCE.y - 1, oFloor) << 1,
		_wd = place_meeting(INSTANCE.x, INSTANCE.y + 1, oFloor);
		
	return _wl | _wr | _wu | _wd;
}
	
//[real] Returns the proper floor tile to a given biome index:
function biome_to_floor(BIOME){
	switch BIOME{
		case biome_remove  : return oFloorRemove;
		case biome_replace : return oFloorReplace;
		case biome_forest  : return oFloorForest;
		case biome_lake	   : return oFloorLake;
		case biome_beach   : return oFloorBeach;
		case biome_river   : return oFloorRiver;
		default: return oFloor;
	}
}
	
//[real] Counts how many adjacent tile a given tile has:
function floor_get_neighbors(X, Y, DEPTH){
	var _x = min(-DEPTH, 0),
		_y = min(-DEPTH, 0),
		_i = 0;
		
	do{
		do{			
			_i += floor_check(X + _x * grid_scale, Y + _y * grid_scale);
			_y++;
			
		}until(_y > DEPTH)
		_y = min(-DEPTH, 0);
		_x++;
	}until(_x > DEPTH)
	return _i - 1;
}

//[real] Counts how many cardinal tiles a given tile has:
function floor_get_neighbors_cardinal(X, Y, DEPTH){
	var _x = min(-DEPTH, 0),
		_y = min(-DEPTH, 0),
		_i = 0;
		
	do{
		if _x = 0 do{			
			_i += floor_check(X + _x * grid_scale, Y + _y * grid_scale);
			_y++;
			
		}until(_y > DEPTH)
		
		_y = min(-DEPTH, 0);
		_x++;		
	}until(_x > DEPTH)
	
	return _i - 1;
}	
	

/// FOR ADDING A FINISHING TOUCH:
//[-] adds a finishing touch to generation:
function carver_finalize(){
	carver_smoothen(2);
	carver_beachify(8);
}

//[-] Removes some ugly singular tiles:
function carver_smoothen(MARGIN){
if instance_exists(oFloor){
		with oFloor{			
			if floor_get_neighbors(x, y) < MARGIN{
				instance_destroy();
			}
		}
	}
}

//[-] turns floors close to water into beach tiles:
function carver_beachify(MARGIN){
	if instance_exists(oFloor){
		with oFloor{
			
			if biome != biome_replace && floor_get_neighbors(x, y) < MARGIN{
				with instance_create_layer(x, y, "lFloor", oFloorBeach){
					island_index = other.island_index;
				}
				instance_destroy();
			}
		}
	}
}
	

/// HANDLING CARVERS PER ISLAND:
//[struct] create a carver:
function carver_add() constructor {
			
	// Setting up some standard vars:
	carve_biome   = -4;
	carve_goal    = 200;
	carve_object  = oCarverForest;
	island_object = noone;
	island_index  = noone;
	carve_speed   = 1;
	carve_turnchance = 80;
	carve_turnvalue  = 90;
	
	
	iterator      = 0;
	carver_parent = -4; // Wait for this carver to be destroyed
}

//[-] a little redundant but i like it:
function carver_write(CARVER, VARIABLE, VALUE){
	variable_struct_set(CARVER, VARIABLE, VALUE);	
}

//[struct] add a carver to another carver:
function carver_write_carver(TARGET, NAME){
	var _s = carver_add();
	variable_struct_set(TARGET, NAME, _s);
	return _s;
}

//[list] turns all carvers given into a list:
function island_create(){
	
	var _q = ds_queue_create(),
		_i = 0;

	repeat(argument_count - _i){
	
		ds_queue_enqueue(_q, argument[_i]);
		_i++;
	}
	
	with instance_create_layer(mouse_x, mouse_y, "lFloor", oIsland){
		
		carver_queue = _q;
		return self;
	}
}

//[id] makes an island create carvers:
function island_create_carver(ISLAND, CARVER){
	
	with carver_create(ISLAND.cur_x, ISLAND.cur_y, CARVER.carve_object){
		CARVER.island_object = ISLAND; // Make ISLAND the parent
		
		var _vars = variable_struct_get_names(CARVER),
			_i    = 0;
			
		repeat(array_length(_vars)){
				
			var _cvar = variable_struct_get(CARVER, _vars[_i]);
			if is_struct(_cvar){ // Create nested carver:
			
				with island_create_carver(ISLAND, _cvar){
					carver_parent = other.id;
				}
			}else{ // Write struct vars to carver instance:
					
				variable_instance_set(self, _vars[_i], _cvar);
			}
			
			_i++;
		}
		
		delete CARVER;
		return self;
	}
}