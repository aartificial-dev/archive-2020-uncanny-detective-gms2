/// @description Insert description here
// You can write your code in this editor


audio_play_sound(snd_message, 0, 0);
x = obj_cam.view_width;
y = 1;
alpha = 0;
spd = 30;
alarm[0] = spd;

with (obj_message) {
	if (id != other.id) {
		if (alarm[2] == -1) {
			alarm[0] = -1;
			alarm[1] = -1;
			alarm[2] = spd;
		}
	}
}