/// @description Insert description here
// You can write your code in this editor

if (cur_text != out_text) {
	let len = string_length(out_text) + 1;
	out_text = string_copy(cur_text, 1, len);
	alarm[0] = 3;
	if (string_char_at(cur_text, len + 1) != " ") {
		audio_play_sound(snd_dialog, 0, 0);
	}
}