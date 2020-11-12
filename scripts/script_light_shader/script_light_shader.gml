
function draw_light_shader() {
	var light_pos = [];
	var light_col = [];
	var light_fal = [];
	var light_lum = [];
	var light_ang = [];

	var skip = 0;
	for (var i = 0; i < min(100, instance_number(obj_light)) - skip; i ++) {
		var light = instance_find(obj_light, i + skip);
		var maxfal = max(light.falloff * 10 * view_width, 1);
		if (!point_in_rectangle(light.x, light.y, x - (view_width / 2) - maxfal, y - (view_height / 2) - maxfal
																						, x + (view_width / 2) + maxfal, y + (view_height / 2) + maxfal)) {
			i--;
			skip++;
			continue;
		}
	
		light_pos[i * 2] = (light.x - view_x) / view_width;
		light_pos[i * 2 + 1] = (light.y - view_y) / view_height;
		light_col[i * 3] = light.blend[0];
		light_col[i * 3 + 1] = light.blend[1];
		light_col[i * 3 + 2] = light.blend[2];
		light_fal[i] = light.falloff;
		light_lum[i] = light.luminocity;
		light_ang[i * 2] = degtorad(light.angle) / 2;
		light_ang[i * 2 + 1] = degtorad(light.dir);
	}
	var drawn_lights = array_length(light_pos) / 2;

	var box_polx = [];
	var box_poly = [];

	var skip = 0;
	for (var i = 0; i < min(100, instance_number(obj_shadowcast)) - skip; i ++) {
		var box = instance_find(obj_shadowcast, i + skip);
		var maxfal = view_width;
		if (!point_in_rectangle(box.x, box.y, x - (view_width / 2) - maxfal, y - (view_height / 2) - maxfal
																				, x + (view_width / 2) + maxfal, y + (view_height / 2) + maxfal)) {
			i--;
			skip++;
			continue;
		}
		box_polx[i * 4]			= (box.polygon_x[0] - view_x) / view_width;
		box_polx[i * 4 + 1] = (box.polygon_x[1] - view_x) / view_width;
		box_polx[i * 4 + 2] = (box.polygon_x[2] - view_x) / view_width;
		box_polx[i * 4 + 3] = (box.polygon_x[3] - view_x) / view_width;
	
		box_poly[i * 4]			= (box.polygon_y[0] - view_y) / view_height;
		box_poly[i * 4 + 1] = (box.polygon_y[1] - view_y) / view_height;
		box_poly[i * 4 + 2] = (box.polygon_y[2] - view_y) / view_height;
		box_poly[i * 4 + 3] = (box.polygon_y[3] - view_y) / view_height;
	
	}
	var drawn_boxes = array_length(box_polx) / 4;

	surface_set_target(light_surf);
	draw_clear_alpha(c_white, 0);
	shader_set(shd_light);

	if (array_length(light_pos) > 0) {
		shader_set_uniform_f_array(u_vLightPos, light_pos);
		shader_set_uniform_f_array(u_vLightCol, light_col);
		shader_set_uniform_f_array(u_fLightFal, light_fal);
		shader_set_uniform_f_array(u_fLightLum, light_lum);
		shader_set_uniform_f_array(u_vLightAng, light_ang);
	}

	if (array_length(box_polx) > 0) {
		shader_set_uniform_f_array(u_vPolyX, box_polx);
		shader_set_uniform_f_array(u_vPolyY, box_poly);
	}

	shader_set_uniform_i(u_iBoxNum, drawn_boxes);
	shader_set_uniform_i(u_iLightNum, drawn_lights);
	shader_set_uniform_f(u_vResolution, view_width * window_scale, view_height * window_scale, a_ratio); 
	shader_set_uniform_i(u_iNormal, 1);
	shader_set_uniform_f(u_vAmb, 0.01, 0.01, 0.01);

	var normal_texture = surface_get_texture(normal_surf);
	texture_set_stage(u_sNormal, normal_texture);
	var illum_texture = surface_get_texture(illum_surf);
	texture_set_stage(u_sIllum, illum_texture);

	draw_surface(illum_surf, 0, 0);
	shader_reset();
	surface_reset_target();
}