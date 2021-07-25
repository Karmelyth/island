/// @description Insert description here
// You can write your code in this editor

var _e = irandom(3)  // size factor
goal = 1;            // not relevant here
biome = biome_lake;	 // biome index
max_margin = 999999; // how many tiles the carver is allowed to deviate
direction = 0;		 // only change this in steps of 90

width = 1 + irandom(1);   // current river width
dir = 0;     // for remembering turns
island = -4; // the island its supposed to carve in
hasmet = 0;  // if the carver has touched ground before