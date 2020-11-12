/// @description Insert description here
// You can write your code in this editor

event_inherited();


greet = "Sir, how can I help You?";
inter = "What else can I do for you?";
desl = "I'm sorry, Sir. I can't help you with this.";
name = "NPC";
profile = new Profile("Mr.Coen", spr_profiles, 2, "Butler");
face = 1;

resp = response_init();
let dia_knife = dialog_init();
dialog_add(dia_knife, "Do you know something about it?", 0, 1, noone, 0);
dialog_add(dia_knife, "Oh, I haven't seen these in days.", 1, -1, noone, 0);
dialog_add(dia_knife, "But I'm greatly sorry but I can't help you in it.", 1, -1, new Tool("Pistol", spr_evidence, 1, "Detto."), 0);
response_add(resp, "Knife", dia_knife);

let dia_me = dialog_init();
dialog_add(dia_me, "Sir surely looks great!", 1, -1, noone, 0);
response_add(resp, "Me", dia_me);

let dia_butler = dialog_init();
dialog_add(dia_butler, "Can you tell me something about yourself?", 0, 1, noone, 0);
dialog_add(dia_butler, "Sorry, Sir, I'm just a butler.", 1, -1, noone, 0);
let prof_upd = new Profile("Mr.Coen", spr_profiles, 2, "Butler. Serves in mansion.");
dialog_add(dia_butler, "I serve in this mansion. That's all.", 1, -1, prof_upd, 1);
response_add(resp, "Mr.Coen", dia_butler);