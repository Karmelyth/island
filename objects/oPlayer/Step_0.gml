// Movement:
var _kx = keyboard_check(Key.right) - keyboard_check(Key.left),
    _ky = keyboard_check(Key.down) - keyboard_check(Key.up),
	_kz = max(1, abs(_kx) + abs(_ky));
	
hspeed += _kx * (acceleration + friction) / _kz;
vspeed += _ky * (acceleration + friction) / _kz;
if abs(hspeed) > maxspeed{
	hspeed = maxspeed * sign(hspeed);	
}
if abs(vspeed) > maxspeed{
	vspeed = maxspeed * sign(vspeed);	
}

// Water Collision:
var _xx = x + sprite_get_width(collision_index)  * clamp(_kx + sign(hspeed), -1, 1) + _kx,
    _yy = y + sprite_get_height(collision_index) * clamp(_ky + sign(vspeed), -1, 1) + _ky;
if !place_meeting(_xx, _yy, oFloor){
	hspeed = 0;
	vspeed = 0;
}
if !place_meeting(_xx, y, oFloor){
	x -= sign(hspeed);
	hspeed = 0;	
}
if !place_meeting(x, _yy, oFloor){
	y -= sign(vspeed);
	vspeed = 0;	
}	