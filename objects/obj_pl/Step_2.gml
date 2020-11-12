/// @description Interact
// You can write your code in this editor

interact_npc = noone;
interact_item = noone;
let view_x = obj_cam.view_x;
let view_y = obj_cam.view_y;
let mx = mouse_x - view_x;
let my = mouse_y - view_y;
let can_click = !(collision_point(mx, my, par_gui, 0, 1));
let dist = point_distance(x, y, mouse_x, mouse_y);

let collide = collision_point(mouse_x, mouse_y, par_item, 0, 1);
if (collide && can_click && dist < 75) {
	interact_item = collide;
}

if (interact_item && mouse_check_button_pressed(mb_right) && can_click && !talking) {
	with (interact_item) {
		event_user(0);
	}
	interact_item = noone;
}
collide = collision_point(mouse_x, mouse_y, par_npc, 0, 1);
if (collide && can_click && dist < 75) {
	interact_npc = collide;
}

if (interact_npc && mouse_check_button_pressed(mb_right) && can_click && !talking) {
	with (interact_npc) {
		event_user(0);
	}
}

if (keyboard_check_pressed(vk_tab)) {
	audio_play_sound(snd_button, 0, 0);
	notes_open = !notes_open;
}

if (notes_open) {
	if (!instance_exists(obj_notes_gui)) {
		instance_create_layer(notes_offset.x, notes_offset.y, "I_GUI", obj_notes_gui);
	}
} else {
	if (instance_exists(obj_notes_gui)) {
		instance_destroy(obj_notes_gui);
	}
	if (instance_exists(obj_detail_gui)) {
		instance_destroy(obj_detail_gui);
	}
}