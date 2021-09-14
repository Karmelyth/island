/// @description Insert description here

direction = 0;  // only change this in steps of 90

iterator = 0; // iterator of higher value wait before iterator of lower value finished generating

/// ISLAND RELATED:
island_index  = noone; // What island this carver belongs to
island_object = -4;    // Parent island id

/// ISLAND RELATED:
carve_goal       = 50;  // how many tiles to create per biome
carve_biome      = -1;  // The biome index of the floors to carve
carve_speed      = 100; // The speed at wich the carver operates, -1 = instant
carve_margin     = -1;  // How far away the carver is allowed to move away form its origin, -1 = no limits
carve_turnchance = 0;   // Chance for carver to turn direction

/// CARVE DIMENSIONS:
carve_width   = 1; // Rect carve width  
carve_height  = 1; // Rect carve height
carve_round   = 1; // Circle carve rounding

// OUTLINE CARVING:
outline_biome = 0;  // Biome of the outline
outline_size  = -4; // Size of the outline, 0 for no outline

/// INTERNAL:
failsafe      = 0;    // Keeps track of failed placement attempts
max_failsafe  = 1;    // How many places to skip if floor tiles are found
csb           = 1;    // Carve speed buffer, for speeds < 1
can_overshoot = true; // If generating too many floor tiles can be reverted for 100% accuracy
carver_parent = -4;   // Only start carving if this instance does not exist

lx = x; // Coords for island dimensions
rx = x;
ty = y;
by = y;

alarm[0] = 1;