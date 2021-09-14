/// ISLAND PRESETS

function bp_forest(){
	var _i0 = new carver_add();
	_i0.carve_object = oCarverForest;
	_i0.carve_biome  = biome_forest;
	_i0.carve_margin = 52;
	_i0.carve_speed  = 40;
	_i0.carve_goal   = 3400;
	_i0.carve_width  = 7;
	_i0.carve_height = 7;
	_i0.carve_round  = 6;
	_i0.carve_turnchance = 80;

	_i0.l0 = new carver_add();
	_i0.l0.carve_object = oCarverLake;
	_i0.l0.carve_biome  = biome_lake
	_i0.l0.carve_goal   = 250;
	_i0.l0.carve_width  = 7;
	_i0.l0.carve_height = 7;
	_i0.l0.carve_round  = 6;
	_i0.l0.direction = random(360);
	_i0.l0.outline_biome = biome_forest;
	_i0.l0.outline_size  = 4;
	
	_i0.l0.r0 = new carver_add();
	_i0.l0.r0.carve_object = oCarverRiver;
	_i0.l0.r0.carve_biome = biome_river;
	_i0.l0.r0.direction = random(360);
	_i0.l0.r0.carve_speed = .5;
	_i0.l0.r0.carve_width  = 2;
	_i0.l0.r0.carve_height = 2;
	_i0.l0.r0.carve_turnchance = 45;
	
	_i0.l0.r1 = new carver_add();
	_i0.l0.r1.carve_object = oCarverRiver;
	_i0.l0.r1.carve_biome = biome_river;
	_i0.l0.r1.direction = random(360);
	_i0.l0.r1.carve_speed = .5;
	_i0.l0.r1.carve_width  = 3;
	_i0.l0.r1.carve_height = 3;
	_i0.l0.r1.carve_turnchance = 70;
	island_create(i0);
}