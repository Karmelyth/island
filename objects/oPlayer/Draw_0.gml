/// @description Insert description here
// You can write your code in this editor
draw_self()
if dev{
	var _kx = keyboard_check(Key.right) - keyboard_check(Key.left),
	    _ky = keyboard_check(Key.down) - keyboard_check(Key.up),
		_xx = x + sprite_get_width(collision_index)  * clamp(_kx + sign(hspeed), -1, 1) + _kx,
	    _yy = y + sprite_get_height(collision_index) * clamp(_ky + sign(vspeed), -1, 1) + _ky;
	draw_set_alpha(.35)
	draw_sprite(mPlayer, 1, _xx, _yy)
	draw_set_alpha(1)
}