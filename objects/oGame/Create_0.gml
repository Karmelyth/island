/// @description Insert description here
// You can write your code in this editor

// Setting up macros:
GridScale = 16; // the scale of the tile grid
Dev = true;     // enable/disable dev mode
MapSize = 512;  // map dimensions in tiles

#macro grid_scale oGame.GridScale
#macro dev oGame.Dev
#macro map_size oGame.MapSize

// Biome macros for ease of use:
#macro biome_forest   0
#macro biome_beach    1
#macro biome_lake     2
#macro biome_mountain 3

// Keybinds:
enum Key {
	up = vk_up,
	down = vk_down,
	left = vk_left,
	right = vk_right,
	cam_turn_left = ord("Q"),
	cam_turn_right = ord("E")
}

// Setting up the basics:
game_set_speed(60, gamespeed_fps);
draw_set_font(fNormal);
randomize(); // seed magic goes here

room_width = map_size * grid_scale;
room_height = map_size * grid_scale;
x = room_width / 2;
y = room_height / 2;

instance_create_layer(x, y, "lInstances", oCam)

instance_create_layer(x, y, "lFloor", oCarverCont);