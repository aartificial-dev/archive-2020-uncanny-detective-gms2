/// @description Insert description here
// You can write your code in this editor

a_ratio = 16/9;

view_width = 320;
view_height = view_width / a_ratio;

window_scale = 4;

window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;
surface_resize(application_surface, view_width * window_scale, view_height * window_scale);
display_set_gui_size(view_width, view_height);

view_x = 0;
view_y = 0;

target = obj_pl;

//shadow_surf = noone;
light_surf = noone;
normal_surf = noone;
illum_surf = noone;
black_surf = noone;
blur_surf = noone;
vhs_surf = noone;
gui_surf = noone;
_t_black = layer_get_id("T_Black");
_t_normal = layer_get_id("T_RoomNormal");
_t_illum = layer_get_id("T_RoomIllum");

normal_colour = make_color_rgb(106, 106, 254);


u_vLightPos = shader_get_uniform(shd_light, "u_vLightPos"); // vec2(x, y)
u_vLightCol = shader_get_uniform(shd_light, "u_vLightCol"); // vec3(r, g, b)
u_fLightFal = shader_get_uniform(shd_light, "u_fLightFal"); // float light falloff (0.5 = half of view_width)
u_fLightLum = shader_get_uniform(shd_light, "u_fLightLum"); // float light luminosity (1 - bright, 0.05 - ambient)
u_vLightAng = shader_get_uniform(shd_light, "u_vLightAng"); // vec2(angle, direction)

u_vPolyX = shader_get_uniform(shd_light, "u_vPolyX"); // shadowcaster x vec4 (clockwise)
u_vPolyY = shader_get_uniform(shd_light, "u_vPolyY"); // shadowcaster y vec4 (clockwise) 

u_iBoxNum = shader_get_uniform(shd_light, "u_iBoxNum"); // number of shadowcasters to draw, int
u_iLightNum = shader_get_uniform(shd_light, "u_iLightNum"); // number of lights to draw, int
u_vResolution = shader_get_uniform(shd_light, "u_vResolution"); // resolution vec3: w, h, aspect

u_iNormal = shader_get_uniform(shd_light, "u_iNormal"); // bool - do draw normal maps (int)
u_vAmb = shader_get_uniform(shd_light, "u_vAmb"); // vec3(r, g, b) - ambient light

u_sNormal = shader_get_sampler_index(shd_light, "u_sNormal"); // normal texture
u_sIllum = shader_get_sampler_index(shd_light, "u_sIllum"); // self-illumination texture

u_iTime = shader_get_uniform(shd_vhs, "iTime");

application_surface_draw_enable(false);
show_debug_overlay(true);
window_set_cursor(cr_none);

draw_light = 1;


/*
func_draw_alpha_0 = function() {draw_set_alpha(0);};
func_draw_alpha_1 = function() {draw_set_alpha(1);};

layer_script_begin(_t_normal, func_draw_alpha_0);
layer_script_begin(_t_illum, func_draw_alpha_0);
layer_script_end(_t_normal, func_draw_alpha_1);
layer_script_end(_t_illum, func_draw_alpha_1);