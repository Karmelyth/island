/// @description Insert description here
// You can write your code in this editor

var _e = irandom(3)  // size factor
goal = 4 + _e * 2;   // how many tiles to create per biome
biome = biome_lake;	 // biome index
max_margin = 2 + _e; // how many tiles the carver is allowed to deviate
direction = 0;		 // only change this in steps of 90
maxgoal = goal;

island_index = -1;