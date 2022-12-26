// window_set_fullscreen(true);
dw = display_get_width();
dh = display_get_height();

room_width = dw;
room_height = dh;
camera_set_view_size(camera_get_default(), dw, dh);

vw = dw;
vh = dh;
ws = 1;

if(vw & 1) vw++;
if(vh & 1) vh++;

window_set_size(vw * ws, vh * ws);

surface_resize(application_surface, vw * ws, vh * ws);

