/// @description Insert description here
// You can write your code in this editor

// Setting up vars for macros:
GridScale = 32;   // the scale of the tile grid
Dev = true;       // enable/disable dev mode
MapWidth  = 1024; // map width in tiles
MapHeight = 1024; // map height in tiles
CurrentFrame = 0; // frame count at game start
GoalTotal = 0;

// Setting up macros:
#macro grid_scale    oGame.GridScale
#macro dev			 oGame.Dev
#macro map_width     oGame.MapWidth
#macro map_height    oGame.MapHeight
#macro current_frame oGame.CurrentFrame
#macro goal_total	 oGame.GoalTotal
#macro map_size_std  1024

// Biome macros for ease of use:
// biome indexes < 0 are only there for technical reasons, dont have them around when map is done generating floors
#macro biome_remove   -2
#macro biome_replace  -1
#macro biome_none      0
#macro biome_forest    1
#macro biome_beach     2
#macro biome_mountain  3
#macro biome_lake      4
#macro biome_river     5

// Keybinds:
enum Key {
	up    = vk_up,
	down  = vk_down,
	left  = vk_left,
	right = vk_right,
	cam_turn_left  = ord("Q"),
	cam_turn_right = ord("E"),
	devtoggle = ord("B")
}

// Setting up the basics:
game_set_speed(60, gamespeed_fps);
draw_set_font(fNormal);
randomize(); // seed magic goes here

room_width  = map_width  * grid_scale;
room_height = map_height * grid_scale;
x = room_width  / 2;
y = room_height / 2;

// Place cam:
with instance_create_layer(x, y, "lInstances", oCam){
	cam_target = other;	
}