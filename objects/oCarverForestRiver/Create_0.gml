/// @description Insert description here
// You can write your code in this editor

var _e = irandom(4)		 // size factor
goal = 500 + _e * 80;	 // how many tiles to create per biome
biome = biome_forest;    // biome index
max_margin = 16 + _e * 3;// how many tiles the carver is allowed to deviate
direction = 0;		     // only change this in steps of 90

rivers   = 0; // amount of lakes generated
failsafe = 0; // counts failed placement attempts  
lx = x;
rx = x;
ty = y;
by = y;