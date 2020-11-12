/// @description Insert description here
// You can write your code in this editor

let view_width = obj_cam.view_width;
let view_height = obj_cam.view_height;
let view_x = obj_cam.view_x;
let view_y = obj_cam.view_y;
let mx = mouse_x - view_x;
let my = mouse_y - view_y;
let mw = mouse_wheel_down() - mouse_wheel_up();
let mlb = mouse_check_button_pressed(mb_left);


if (point_in_rectangle(mx, my, x + 70, y + 1, x + 79, y + 10)) {
	cursor = cursor_type.finger;
	if (mlb) {
		audio_play_sound(snd_button, 0, 0);
		instance_destroy();
	}
}

if (point_in_rectangle(mx, my, x + 1, y + 1, x + 68, y + 9) && !drag) {
	cursor = cursor_type.hover;
	if (mlb) {
		drag = 1;
		st_x = mx - x;
		st_y = my - y;
		audio_play_sound(snd_button, 0, 0);
	}
}

if (drag) {
	cursor = cursor_type.hold;
	x = mx - st_x;
	y = my - st_y;
	
	if (mouse_check_button_released(mb_left)) {
		drag = 0;
		audio_play_sound(snd_button, 0, 0);
	}
}

if (point_in_rectangle(mx, my, x + 1, y + 67, x + 78, y + 75)) {
	if (instanceof(item) == "Tool") {
		cursor = cursor_type.finger;
		if (mlb) {
			obj_pl.eq_item = item;
			audio_play_sound(snd_button, 0, 0);
		}
	} else if (obj_pl.talking) {
		cursor = cursor_type.finger;
		if (mlb) {
			// present
			audio_play_sound(snd_button, 0, 0);
		}
	}
}

x = clamp(x, 0, view_width - sprite_get_width(sprite_index));
y = clamp(y, 0, view_height - sprite_get_height(sprite_index));

obj_pl.detail_offset = vec2(x, y);