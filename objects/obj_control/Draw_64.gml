/// @description Insert description here
// You can write your code in this editor

var _btn_br = false;

draw_set_color(c_white);
// draw_set_font();

draw_set_valign(fa_top);
draw_set_halign(fa_left);

var lh = 32;
var lt = 16;

draw_text(16, lt + (lh *  0), "GUI Width  = " + string(display_get_gui_width()));
draw_text(16, lt + (lh *  1), "GUI Height = " + string(display_get_gui_height()));
draw_text(16, lt + (lh *  2), "Roow Width  = " + string(room_width));
draw_text(16, lt + (lh *  3), "Roow Height = " + string(room_height));
draw_text(16, lt + (lh *  4), "Window Width  = " + string(window_get_width()));
draw_text(16, lt + (lh *  5), "Window Height = " + string(window_get_height()));
draw_text(16, lt + (lh *  6), "Display Width  = " + string(display_get_width()));
draw_text(16, lt + (lh *  7), "Display Height = " + string(display_get_height()));
draw_text(16, lt + (lh *  8), "Surface Width  = " + string(surface_get_width(application_surface)));
draw_text(16, lt + (lh *  9), "Surface Height = " + string(surface_get_height(application_surface)));
draw_text(16, lt + (lh * 10), "Camera Width  = " + string(camera_get_view_width(view_camera)));
draw_text(16, lt + (lh * 11), "Camera Height = " + string(camera_get_view_height(view_camera)));
draw_text(16, lt + (lh * 12), "Camera Left  = " + string(camera_get_view_x(view_camera)));
draw_text(16, lt + (lh * 13), "Camera Top   = " + string(camera_get_view_y(view_camera)));

draw_text(16, lt + (lh * 14), "Tilt X = " + string_format(device_get_tilt_x(), 1 , 6));
draw_text(16, lt + (lh * 15), "Tilt Y = " + string_format(device_get_tilt_y(), 1 , 6));
draw_text(16, lt + (lh * 16), "Tilt Z = " + string_format(device_get_tilt_z(), 1 , 6));

draw_text(16, lt + (lh * 17), "Mouse X = " + string_format(device_mouse_x(0), 5, 1));
draw_text(16, lt + (lh * 18), "Mouse Y = " + string_format(device_mouse_y(0), 5, 1));

if(mouse_check_button(mb_left)) {
	draw_text(16, lt + (lh * 19), "Mouse Left = Pressed");
} else {
	draw_text(16, lt + (lh * 19), "Mouse Left = Released");
}
if(mouse_check_button(mb_right)) {
	draw_text(16, lt + (lh * 20), "Mouse Right = Pressed");
} else {
	draw_text(16, lt + (lh * 20), "Mouse Right = Released");
}
if(mouse_check_button(mb_middle)) {
	draw_text(16, lt + (lh * 21), "Mouse Middle = Pressed");
} else {
	draw_text(16, lt + (lh * 21), "Mouse Middle = Released");
}
			
if(keyboard_key) {
draw_text(16, lt + (lh * 25), "Key = " + string_format(keyboard_key, 5, 0));
}

var _width = display_get_width();
var _height = display_get_height();

if(global.gp_active > 0) {
	if(!((padsel >= 0) && (padsel < global.gp_active))) {
		padsel = 0;
	}

	var _siri = string_pos("Siri Remote", gamepad_get_description(global.gp_map[padsel]));

	if ((os_type == os_tvos)  && (string_pos("Siri Remote", gamepad_get_description(global.gp_map[padsel]))<>0)) {
	    gamepad_set_option(global.gp_active, "dpad_absolute",true);
		if gamepad_get_option(global.gp_active, "allow_rotation") {
			draw_text(16, lt + (lh * 26), "Remote = allow_rotation = TRUE");
		} else {
			draw_text(16, lt + (lh * 26), "Remote = allow_rotation = FALSE");
		}
		if gamepad_get_option(global.gp_active, "dpad_absolute") {
			draw_text(16, lt + (lh * 27), "Remote = dpad_absolute = TRUE");
		} else {
			draw_text(16, lt + (lh * 27), "Remote = dpad_absolute = FALSE");
		}
	
	}

	draw_text(16, lt + (lh * 22), "Gamepad Count = " + string_format(global.gp_active, 1, 0) + " ( " + string(global.gp_map[padsel]) + ")");
	draw_text(16, lt + (lh * 23), "Gamepad GUID = " + gamepad_get_guid(global.gp_map[padsel]));
	draw_text(16, lt + (lh * 24), "Gamepad Description = " + gamepad_get_description(global.gp_map[padsel]));
	
	draw_set_halign(fa_right);

	draw_text(_width - 16, lt + (lh *  20), "Gamepad Button Count = " + string(gamepad_button_count(global.gp_map[padsel])));

	
	draw_text(_width - 16, lt + (lh *  0), "Gamepad Btn A = " + string(gamepad_button_check(global.gp_map[padsel], gp_face1)));
	draw_text(_width - 16, lt + (lh *  1), "Gamepad Btn B = " + string(gamepad_button_check(global.gp_map[padsel], gp_face2)));
	draw_text(_width - 16, lt + (lh *  2), "Gamepad Btn X = " + string(gamepad_button_check(global.gp_map[padsel], gp_face3)));
	draw_text(_width - 16, lt + (lh *  3), "Gamepad Btn Y = " + string(gamepad_button_check(global.gp_map[padsel], gp_face4)));

	draw_text(_width - 16, lt + (lh *  4), "Gamepad Btn Select = " + string(gamepad_button_check(global.gp_map[padsel], gp_select)));
	draw_text(_width - 16, lt + (lh *  5), "Gamepad Btn Start = " + string(gamepad_button_check(global.gp_map[padsel], gp_start)));

	draw_text(_width - 16, lt + (lh *  6), "Gamepad LB = " + string(gamepad_button_check(global.gp_map[padsel], gp_shoulderl)));
	draw_text(_width - 16, lt + (lh *  7), "Gamepad LT = " + string(gamepad_button_check(global.gp_map[padsel], gp_shoulderlb)));
	draw_text(_width - 16, lt + (lh * 8), "Gamepad RB = " + string(gamepad_button_check(global.gp_map[padsel], gp_shoulderr)));
	draw_text(_width - 16, lt + (lh * 9), "Gamepad RT = " + string(gamepad_button_check(global.gp_map[padsel], gp_shoulderrb)));

	draw_text(_width - 16, lt + (lh * 10), "Gamepad DPad Right = " + string(gamepad_button_check(global.gp_map[padsel], gp_padr)));
	draw_text(_width - 16, lt + (lh * 11), "Gamepad DPad Up = " + string(gamepad_button_check(global.gp_map[padsel], gp_padu)));
	draw_text(_width - 16, lt + (lh * 12), "Gamepad DPad Left = " + string(gamepad_button_check(global.gp_map[padsel], gp_padl)));
	draw_text(_width - 16, lt + (lh * 13), "Gamepad DPad Down = " + string(gamepad_button_check(global.gp_map[padsel], gp_padd)));

	draw_text(_width - 16, lt + (lh * 14), "Gamepad Left Stick H = " + string_format(gamepad_axis_value(global.gp_map[padsel], gp_axislh), 1, 4));
	draw_text(_width - 16, lt + (lh * 15), "Gamepad Left Stick V = " + string_format(gamepad_axis_value(global.gp_map[padsel], gp_axislv), 1, 4));
	draw_text(_width - 16, lt + (lh * 16), "Gamepad Left Stick Btn = " + string(gamepad_button_check(global.gp_map[padsel], gp_stickl)));
	
	draw_text(_width - 16, lt + (lh * 17), "Gamepad Right Stick H = " + string_format(gamepad_axis_value(global.gp_map[padsel], gp_axisrh), 1, 4));
	draw_text(_width - 16, lt + (lh * 18), "Gamepad Right Stick V = " + string_format(gamepad_axis_value(global.gp_map[padsel], gp_axisrv), 1, 4));
	draw_text(_width - 16, lt + (lh * 19), "Gamepad Right Stick Btn = " + string(gamepad_button_check(global.gp_map[padsel], gp_stickr)));

	if(global.gp_active > 1) {
		var _mouse_click = false;
		var _mouse_down = false;
		var _mouse_over = false;
/*
		if( (mouse_x > (_width / 2) - (128)) &&
			(mouse_y > 4) && 
			(mouse_x < (_width / 2) + (128)) &&
			(mouse_y < 52)
			) {
				_mouse_over = true;
				if(mouse_check_button_pressed(mb_left)) {
					_mouse_click = true;
				}
				if(mouse_check_button(mb_left)) {
					_mouse_down = true;
				}
			}
		if(_mouse_over) {
			draw_set_color(c_blue);
		} else {
			draw_set_color(c_gray);
		}
		draw_button((_width / 2) - (128), 4, 
					(_width / 2) + (128), 52, _mouse_down);
		if(_mouse_click) {
			change_pad();
		}
*/
		draw_set_color(c_black);
		draw_set_halign(fa_left);
		var _tw = string_width("Change Pad");
		draw_text((_width / 2) - (128) + ((256 - _tw) / 2), 8, "Change Pad");
	}
} else {
		draw_text(16, 364, "No Gamepads");
}


