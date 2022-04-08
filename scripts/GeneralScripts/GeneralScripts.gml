/*Gerenral functions
*/

gml_pragma("PNGCrush");

global.font = undefined;
global.game_id = "5a141bbf-a056-4c25-97d9-fae5d1606161";
global.req_fps = 50;
global.gp = undefined;
global.gp_active = false;

// Json stuff
function load_json(afile) {
	var _res = undefined;
	
	if(file_exists(afile)) {
		var _file = file_text_open_read(afile);
		try {
			var _data = file_text_read_string(_file);
			_res = json_parse(_data);
		} catch(_exception) { 
			show_debug_message("Error : in " + afile + " load " + _exception.message);
			_res = undefined;
		} finally {
			file_text_close(_file);
		}
	} else {
		show_debug_message("Can't find : " + afile);
	}
	
	return _res;
}

function save_json(afile, data) {
	var _res = undefined;

	try {
		var _json = json_stringify(data);

		var _file = file_text_open_write(afile);
		try {
			file_text_write_string(_file, _json);
		} catch(_exception) { 
			show_debug_message("Save - Error : in " + afile + " save " + _exception.message);
			_res = undefined;
			game_end();
		} finally {
			file_text_close(_file);
		}
	} catch(_exception) { 
			show_debug_message("Save - Caught JSON Error : " + _exception.message);
	}
	
	return _res;
}

function change_pad() {
	padsel++;
	show_debug_message("Pad = " + string(padsel));
	if(!((padsel >= 0) && (padsel < global.gp_active))) {
		padsel = 0;
	}
}

// Load the font
if(is_undefined(global.font)) {
	global.font = font_add("IBMPlexMono-Bold.woff", 24, true, true, 32, 128);
}

draw_set_font(global.font);
global.font_info = font_get_info(global.font);
show_debug_message(json_stringify(global.font_info));
show_debug_message(draw_get_font());

function check_gamepad() {
	var gp_active = 0;
	global.gp_mapped = 0;

	if(gamepad_is_supported()) {
		var gp_num = gamepad_get_device_count();
		if(gp_num > 0) {
			global.gp = array_create(gp_num, false);
			global.gp_map = array_create(0, 0);
			for (var i = 0; i < gp_num; i++;) {
			   if(gamepad_is_connected(i)) {
				   global.gp[i] = true;
				   array_resize(global.gp_map, global.gp_mapped + 1);
				   global.gp_map[global.gp_mapped] = i;
				   global.gp_mapped++;
				   gp_active++;
			   } else {
				   global.gp[i] = false;
			   }
			}
		}
	} else {
		gp_active = -1;
	}

	return gp_active;
}

global.gp_active = check_gamepad();

game_set_speed(global.req_fps, gamespeed_fps);


