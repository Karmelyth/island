event_inherited();

biome = biome_replace;
priority = -1000;
outline_biome = biome_mountain;

alarm[0] = max(current_frame mod 100 + id mod 200, 1);
alarm[1] = max(current_frame mod 100 + id mod 200 + 1, 1);