/// @description Insert description here
// You can write your code in this editor

var _e = irandom(6)   // size factor
goal = 3000 + _e * 50; // how many tiles to create per biome
biome = biome_forest; // biome index
max_margin = 40 + _e * 2;// how many tiles the carver is allowed to deviate
direction = 0;		  // only change this in steps of 90
carve_speed = 20; // how fast the carver builds

lakes    = 1 + floor(_e/3); // amount of lakes generated
failsafe = 0; // counts failed placement attempts  
lx = x;
rx = x;
ty = y;
by = y;

island_index = -1;