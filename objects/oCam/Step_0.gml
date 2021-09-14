// Do the thing:
var _mapfac = max(map_width, map_height) / map_size_std; // Change camera coords and zoom based on map size
camera_set_view_pos(view_camera[0], x - window_size / 2 * zoom * _mapfac, y - window_size / 2 * zoom * _mapfac);
camera_set_view_size(view_camera[0], window_size * zoom * _mapfac, window_size * zoom * _mapfac);
camera_set_view_angle(view_camera[0], cam_direction);

// And the turning thing:
 var _xspd = 0,
     _yspd = 0,
	 _wght = 1;
if cam_target != self{
	xpos += lengthdir_x((keyboard_check(Key.right) - keyboard_check(Key.left)) * cam_speed * zoom * _mapfac, abs(cam_direction mod 360))      + lengthdir_y((keyboard_check(Key.up) - keyboard_check(Key.down)) * cam_speed * zoom * _mapfac, cam_direction mod 360 - 180);
    ypos += lengthdir_x((keyboard_check(Key.right) - keyboard_check(Key.left)) * cam_speed * zoom * _mapfac, abs(cam_direction mod 360 - 90)) + lengthdir_y((keyboard_check(Key.up) - keyboard_check(Key.down)) * cam_speed * zoom * _mapfac, cam_direction mod 360 - 270);

	_xspd += cam_target.x * 100;
	_yspd += cam_target.y * 100;
	_wght += 100;
	
	_xspd += mouse_x * 10;
	_yspd += mouse_y * 10;
	_wght += 10;
	
	_xspd += x * cam_smoothing;
	_yspd += y * cam_smoothing;
	_wght += cam_smoothing
}

// Softbordering the cam:	

	var _wmin = map_width  * grid_scale * (1 - camborder_factor),
	    _wmax = map_width  * grid_scale * camborder_factor,
	    _hmin = map_height * grid_scale * (1 - camborder_factor),
	    _hmax = map_height * grid_scale * camborder_factor;
	if !point_in_rectangle(x, y, _wmin, _hmin, _wmax, _hmax){

		var _sbsfac = softborder_factor * cam_speed * zoom * _mapfac,
			_xmin   = abs(min(x, _wmin) - _wmin),
			_xmax   = -1 * (max(x - _wmax + _wmin, _wmin) - _wmin),
			_ymin   = -1 * abs(min(y, _hmin) - _hmin),
			_ymax   = max(y - _hmax + _hmin, _hmin) - _hmin;

		xpos += lengthdir_x((_xmin + _xmax) * _sbsfac, abs(cam_direction mod 360))      + lengthdir_y((_ymin + _ymax) * _sbsfac, cam_direction mod 360 - 180);
		ypos += lengthdir_x((_xmin + _xmax) * _sbsfac, abs(cam_direction mod 360 - 90)) + lengthdir_y((_ymin + _ymax) * _sbsfac, cam_direction mod 360 - 270);
	}

x = (x + _xspd) / _wght + xpos;
y = (y + _yspd) / _wght + ypos;
	
// Scrolling:
var _zadd = mouse_wheel_up() * zoom_factor,
    _zsub = mouse_wheel_down() * zoom_factor;

zoomval -= (_zadd - _zsub) * max(zoom/zoom_max * .8, .01);
zoom = clamp(zoom + zoomval, zoom_min, zoom_max);
zoomval *= zoom_speed;

// Turning:
turnval += (keyboard_check_pressed(Key.cam_turn_right) - keyboard_check_pressed(Key.cam_turn_left)) * 45;
turnval *= .5;
cam_direction += turnval;