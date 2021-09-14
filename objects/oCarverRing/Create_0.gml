/// @description Insert description here

event_inherited();

goal		 = 1;           
biome		 = biome_river;
parent_biome = biome_forest;

max_margin = 999999;

basedir  = 0;        // where the carver goes
dirextra = 0;        // direction deviation
size = 1;            // how thick the river is
edge = 1;            // how much edge smoothing to use
border_margin = 1;   // safety land edge WIDTH

width = 1 + irandom(1);   // current river width
island = -4; // the island its supposed to carve in