/// @description Insert description here
// You can write your code in this editor


xoffset = (sprite_get_width(sprite_index)  - sprite_get_xoffset(sprite_index))  * image_xscale;
yoffset = (sprite_get_height(sprite_index)  - sprite_get_yoffset(sprite_index))  * image_yscale;

polygon_x = [x + lendir_x(-xoffset, -xoffset, image_angle), 
						 x + lendir_x(xoffset, -xoffset, image_angle), 
						 x + lendir_x(xoffset, xoffset, image_angle), 
						 x + lendir_x(-xoffset, xoffset, image_angle)];

polygon_y = [y + lendir_y(-yoffset, -yoffset, image_angle), 
						 y + lendir_y(yoffset, -yoffset, image_angle), 
						 y + lendir_y(yoffset, yoffset, image_angle), 
						 y + lendir_y(-yoffset, yoffset, image_angle)];