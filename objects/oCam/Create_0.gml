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

CamTarget         = self;   // what to follow
cam_speed		  = 1.5;    // how fast the camera moves
cam_smoothing	  = 500;    // camera smoothing, keep above 0
softborder_factor = .00060; // How harsh the pushback from being outside the map is
camborder_factor  = 1.00;   // size factor for map_border -> cam_border

zoom = 70; 		   // how deep the camera is zoomed in, multiplier
zoom_factor = 3;   // amount of "zoom intervalls"
zoom_speed  = .80; // how fast to zoom in, set to 0-1
zoom_max    = 70;  // maximum amount of zoom allowed
zoom_min    = 1;   // minimum amount of zoom allowed
zoomval     = 0;   // zoom amount to change
xpos = 0;
ypos = 0;

turnval = 0;       // turn amonut to change
cam_direction = 0; // where the camera is directed

// Setting up macros:
#macro cam_target oCam.CamTarget