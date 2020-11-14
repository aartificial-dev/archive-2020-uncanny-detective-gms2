/// @description Insert description here
// You can write your code in this editor

if (cur_text != out_text) {
	let len = string_length(out_text) + 1;
	out_text = string_copy(cur_text, 1, len);
	let ch = string_char_at(cur_text, len);
	alarm[0] = 3;
	if (ch != " " && ch != "." && ch != "," && ch != "?" && ch != "!" && ch != "\n") {
		audio_play_sound(snd_dialog, 0, 0);
	} else if (ch != " ") {
		alarm[0] = 10;
	}
}