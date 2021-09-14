//[list] turns given arguments into a queue
function queue_generate(){ 
	
		var _q = ds_queue_create(),
			_i = 0;

		repeat(argument_count - 1){
	
			ds_queue_enqueue(_q, argument[_i]);
			_i++;

		return _q;
	}
}

//[bool] If a point is in view of the cam or not:
function point_seen(X, Y){
	var _c = view_camera[0],
	    _x = camera_get_view_x(_c),
		_w = camera_get_view_width(_c)/ 2,
		_y = camera_get_view_y(_c),
		_h = camera_get_view_height(_c) / 2;

	if X > _x - _w && X < _x + _w && Y > _y - _h && Y < _y + _h{
		
		return true;
	}
	
	return false;
}