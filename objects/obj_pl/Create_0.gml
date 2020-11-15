/// @description Init variables
// You can write your code in this editor

list_evidence = ds_list_create();
list_profiles = ds_list_create();
list_tools = ds_list_create();

ds_list_add(list_profiles, new Profile("Me", spr_profiles, 1, "I'm detective."));

ds_list_add(list_profiles, new Profile("MeA", spr_profiles, 1, "1 1 1 1 1 1 2 2 2 2 2 2 3 3 3 3 3 3 4 4 4 4 4 4 5 5 5 5 5 5 6 6 6 6 6 6 7 7 7 7 7 7"));

interact_item = noone;
interact_npc = noone;

spr_dir = pl_dir.s;
notes_offset = vec2(10, (180 - 84) / 2);
detail_offset = vec2(320 - 80 - 10, (180 - 77) / 2);
notes_open = 0;
notes_tab = 0;

talking = 0;

eq_item = noone;

obj_cam.x = x;
obj_cam.y = y;