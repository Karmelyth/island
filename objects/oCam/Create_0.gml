//Aspect rationing:
aspect_ratio = display_get_width()/display_get_height();

view_height = 200;
view_width  = round(view_height*aspect_ratio);
 
if(view_width & 1) view_width++;
if(view_height & 1) view_height++;

max_window_scale = min(floor(display_get_width()/view_width),floor(display_get_height()/view_height));
if(view_height * max_window_scale == display_get_height())
    max_window_scale--;
    
window_scale = max_window_scale;

window_size = min(view_width*window_scale,view_height*window_scale)
window_set_size(window_size, window_size);
alarm[0]=1;

surface_resize(application_surface, window_size, window_size);

// Setting up vars:
image_xscale = .1;
image_yscale = .1;

zoom = 20; 		   // how deep the camera is zoomed in, multiplier
zoom_factor = .4;  // how fast to scroll
cam_speed   = 15;  // how fast the camera moves
zoomval = 0;       // zoom amount to change
turnval = 0;       // turn amonut to change
turn_factor = 1;   // how fast to turn
cam_direction = 0; // where the camera is directed