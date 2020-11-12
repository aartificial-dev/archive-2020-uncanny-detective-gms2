/// @description Move
// You can write your code in this editor

depth = -y;

if (!talking) {

	let _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	let _ver = keyboard_check(ord("W")) - keyboard_check(ord("S"));
	let _move = sign(abs(_hor) + abs(_ver));
	let _dir = radtodeg(arctan2(_ver, _hor));
	let do_hor = 0;
	let do_ver = 0;

	let _x = lendir_x(1, 0, _dir);
	let _y = lendir_y(1, 0, _dir);

	if (!instance_place(x + _x, y, par_unwalk) && _hor != 0) {
		x += _x;
		do_hor = 1;
	}
	if (!instance_place(x, y + _y, par_unwalk) && _ver != 0) {
		y += _y;
		do_ver = 1;
	}

	if (do_ver) {
		if (_ver = 1) {
			spr_dir = pl_dir.n;
		}
		if (_ver = -1) {
			spr_dir = pl_dir.s;
		}
	}
	if (do_hor) {
		if (_hor = 1) {
			spr_dir = pl_dir.e;
		}
		if (_hor = -1) {
			spr_dir = pl_dir.w;
		}
	}

	if ((do_hor || do_ver) && alarm[11] = -1) {
		audio_play_sound(snd_step, 0, 0);
		alarm[11] = 30;
	}

}
//light.x = x;
//light.y = y - 30;