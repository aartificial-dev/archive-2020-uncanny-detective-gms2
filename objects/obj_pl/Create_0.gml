/// @description Insert description here
// You can write your code in this editor

list_evidence = ds_list_create();
list_profiles = ds_list_create();
list_tools = ds_list_create();

ds_list_add(list_profiles, new Profile("Me", spr_profiles, 1, "I'm detective."));
ds_list_add(list_profiles, new Profile("Mr.Shade", spr_profiles, 2, "Shady guy. He's somewhere around."));
ds_list_add(list_profiles, new Profile("Mr.FuCho", spr_profiles, 3, "Cool guy."));
ds_list_add(list_profiles, new Profile("Mr.Shade", spr_profiles, 2, "Shady guy. He's somewhere around."));
ds_list_add(list_profiles, new Profile("Mr.FuCho", spr_profiles, 3, "Cool guy."));
ds_list_add(list_profiles, new Profile("Mr.FuCho", spr_profiles, 3, "Cool guy."));
ds_list_add(list_profiles, new Profile("Mr.FuCho", spr_profiles, 3, "Cool guy."));

interact_item = noone;
interact_npc = noone;

spr_dir = pl_dir.s;
 // 180 / 2 - 94 / 2
notes_offset = vec2(10, (180 - 84) / 2);
detail_offset = vec2(320 - 80 - 10, (180 - 77) / 2);
notes_open = 0;
notes_tab = 0;

talking = 0;

eq_item = noone;


//light = instance_create_layer(x, y, "I_Light", obj_light);
//light.luminocity = 0.05;
//light.falloff_screen = 0.2;