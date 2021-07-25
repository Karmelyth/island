// This is the object that controls generation, the Carver Controller

// Generation settings:
goal       = 1000; // amount of tiles to create per island, average size of island
goaldev    = .2;   // size deviation, dont set this beyond 1 please
max_margin = 24;   // maximum deviation of how far a carver can deviate from its origin, "inner island consistency"
islands    = 6;    // how many main islands to create
lakes      = 0;    // how many lakes to create per island
rivers     = 0;    // how many rivers to create per island

island_dex = array_create(islands, -4);
done = false;

var _d = random(360),
    _x = x + lengthdir_x(grid_scale * map_size / 3, _d),
	_y = y + lengthdir_y(grid_scale * map_size / 3, _d),
	_g = round(goal * random_range(.9, 1.1)),
	_i = 0;

if islands > 0 repeat(islands){
	
	with instance_create_layer(_x, _y, "lFloor", oCarverForestLake){
		deviation = random_range(-other.goaldev, other.goaldev);
		goal = round(_g * (1 + deviation));
		max_margin = floor(other.max_margin + 5 * deviation);
		
		var _lakes = 0;
		if other.lakes > 0{
			lakes = max(irandom(other.lakes), 1);	
		}else{
			lakes = 0;
		}
		
		island_index = _i;
		
		other.island_dex[_i] = self;
	}

	_d += 360 / islands;
	_x = x + lengthdir_x(grid_scale * map_size / 3, _d);
	_y = y + lengthdir_y(grid_scale * map_size / 3, _d);	
	_i++;
}