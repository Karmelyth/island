/// @description Insert description here
// You can write your code in this editor

var _e = irandom(4)   // size factor
goal = 200 + _e * 30; // how many tiles to create per biome
biome = biome_forest; // biome index
max_margin = 8 + _e * 2;// how many tiles the carver is allowed to deviate
direction = 0;		  // only change this in steps of 90

islands  = 12; // amount of lakes generated
failsafe = 0; // counts failed placement attempts  

leftx   = x; // leftmost x coord of the island
rightx  = x; // rightmost x coord
topy    = y; // topmost y coord  
bottomy = y; // bottommost y coord