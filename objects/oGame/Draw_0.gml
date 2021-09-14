/// @description Insert description here

if dev{	
	draw_set_alpha(.2);
	draw_rectangle_color(0, 0, room_width, room_height, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
	draw_set_alpha(1);

	// GOOD FOR ADJACENCY TESTING
	var _bro = instance_nearest(mouse_x, mouse_y, oFloor),
		_place_margin = grid_scale * 4;


	if instance_exists(_bro) && point_distance(mouse_x, mouse_y, _bro.x, _bro.y) <= _place_margin{

		var _maxx = 5,
		    _maxy = 5,
			_x = -_maxx,
			_y = -_maxy;
				
		// Place floor tiles:
		draw_sprite(sFloorPreview, 0, _bro.x,_bro.y);
		draw_set_alpha(.35);	
		
		/*draw_circle(_bro.x, _bro.y, grid_scale / 2, false);	
		do{
			do{			
				if (_y != 0 || _x != 0) && floor_check(_bro.x + _x * grid_scale, _bro.y + _y * grid_scale){
					draw_circle_color(_bro.x + _x * grid_scale, _bro.y + _y * grid_scale, grid_scale / 4, c_red, c_red, false)	
				}
				_y++;
			
			}until(_y > _maxy)
			_y = -_maxy;
			_x++;
		}until(_x > _maxx)*/
	
		draw_set_alpha(1);
	}
}


if mouse_check_button_pressed(mb_left){
		
	i0 = new carver_add();
	i0.carve_object = oCarverForest;
	i0.carve_biome  = biome_forest;
	i0.carve_margin = 12;
	i0.carve_speed  = 40;
	i0.carve_goal   = 300;
	i0.carve_width  = 3;
	i0.carve_height = 3;
	i0.carve_round  = 2;
	i0.carve_turnchance = 80;
	i0.outline_biome = biome_beach;
	i0.outline_size  = 4;
	
	i0.b0 = new carver_add();
	i0.b0.carve_object = oCarverForest;
	i0.b0.carve_biome  = biome_beach;
	i0.b0.carve_goal   = 400;
	i0.b0.carve_width  = 7;
	i0.b0.carve_height = 7;
	i0.b0.carve_round  = 5;
	i0.b0.direction    = random(360);
	i0.b0.carve_turnchance = 40;
	i0.b0.carve_turnvalue  = 12;
	
	i0.b0.i0 = new carver_add();
	i0.b0.i0.carve_object = oCarverForest;
	i0.b0.i0.carve_biome  = biome_forest;
	i0.b0.i0.carve_margin = 12;
	i0.b0.i0.carve_speed  = 40;
	i0.b0.i0.carve_goal   = 300;
	i0.b0.i0.carve_width  = 3;
	i0.b0.i0.carve_height = 3;
	i0.b0.i0.carve_round  = 2;
	i0.b0.i0.carve_turnchance = 80;
	i0.b0.i0.outline_biome = biome_beach;
	i0.b0.i0.outline_size  = 4;

	island_create(i0);
	
}
/*if mouse_check_button(mb_right) && floor_check(_x, _y){
	with instance_nearest(_x, _y, oFloor) instance_destroy(self, false);
}*/