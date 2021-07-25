/// @description Insert description here
// You can write your code in this editor

var _e = irandom(3)   // size factor
goal = 1;             // it dont matter
biome = biome_forest; // biome index;
max_margin = 5 + _e * 2;  // how many tiles the carver is allowed to deviate
direction = 0;		  // only change this in steps of 90

lakes    = 0; // amount of lakes generated
failsafe = 0; // counts failed placement attempts  
margin   = 0; // move this many tiles before creating islands