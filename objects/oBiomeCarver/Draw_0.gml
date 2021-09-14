/// @description Insert description here

if dev{
	if carve_margin > 0{
		draw_set_alpha(.35);
		draw_circle_color(xstart, ystart, grid_scale * carve_margin, c_orange, c_orange, true);
		draw_set_alpha(1);
	}
	draw_self();
	draw_circle((lx + rx)/2, (ty + by)/2, grid_scale, false);
	draw_line_width_color(x, y, xstart, ystart, 16, c_red, c_red);
}