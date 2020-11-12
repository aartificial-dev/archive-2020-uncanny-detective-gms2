/// @description Insert description here
// You can write your code in this editor

if (resp == noone) {
	scr_message("Seems I can't talk to them");
	exit;
}

if (profile != noone) {
	if (check_evidence(obj_pl.list_profiles, profile.name) == -1) {
		ds_list_add(obj_pl.list_profiles, profile);
		scr_message("Profile gathered");
	}
}

obj_pl.talking = instance_create_layer(0, 0, "I_GUI", obj_dialog);
obj_pl.talking.resp = resp;
obj_pl.talking.face = face;
obj_pl.talking.greet = greet;
obj_pl.talking.inter = inter;
obj_pl.talking.desl = desl;