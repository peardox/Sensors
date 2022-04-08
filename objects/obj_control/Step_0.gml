/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(vk_escape)) {
	game_end();
}

if(global.gp_active != -1) {
	global.gp_active = check_gamepad();
}

if((global.gp_active > 1) && (keyboard_check_pressed(vk_tab))) {
	change_pad();
}

