// Do the thing:
camera_set_view_pos(view_camera[0], x - window_size / 2 * zoom, y - window_size / 2 * zoom);
camera_set_view_size(view_camera[0], window_size * zoom, window_size * zoom);
camera_set_view_angle(view_camera[0], cam_direction);

// And the turning thing:
var _xspd = lengthdir_x((keyboard_check(Key.right) - keyboard_check(Key.left)) * cam_speed * zoom, abs(cam_direction mod 360))      + lengthdir_y((keyboard_check(Key.up) - keyboard_check(Key.down)) * cam_speed * zoom, cam_direction mod 360 - 180),
	_yspd = lengthdir_x((keyboard_check(Key.right) - keyboard_check(Key.left)) * cam_speed * zoom, abs(cam_direction mod 360 - 90)) + lengthdir_y((keyboard_check(Key.up) - keyboard_check(Key.down)) * cam_speed * zoom, cam_direction mod 360 - 270);
x = clamp(x + _xspd, 0, room_width);
y = clamp(y + _yspd, 0, room_height);

// Scrolling:
zoomval -= mouse_wheel_up() * zoom_factor - mouse_wheel_down() * zoom_factor;
zoom = clamp(zoom + zoomval, .4, 20);
zoomval *= .6;

// Turning:
turnval += (keyboard_check_pressed(Key.cam_turn_right) - keyboard_check_pressed(Key.cam_turn_left)) * 45;
turnval *= .5;
cam_direction += turnval;