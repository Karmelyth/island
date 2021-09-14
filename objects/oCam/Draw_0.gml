/// @description Insert description here
// You can write your code in this editor
if dev{
	
	var _mw = map_width  * grid_scale,
	    _mh = map_height * grid_scale;
	draw_rectangle_color(0 + _mw * (1 - camborder_factor), 0 + _mh * (1 - camborder_factor), 0 + _mw * camborder_factor, 0 + _mh * camborder_factor, c_orange, c_orange, c_orange, c_orange, true);

	draw_sprite_ext(sprite_index, 0, x, y, image_xscale * zoom, image_yscale * zoom, cam_direction, image_blend, image_alpha);
}