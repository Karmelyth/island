/// @description Insert description here
// You can write your code in this editor

var _e = irandom(8)   // size factor
goal = 200 + _e * 30; // how many tiles to create per biome
biome = biome_forest; // biome index
max_margin = 6 + _e;  // how many tiles the carver is allowed to deviate
direction = 0;		  // only change this in steps of 90
