/// @description Insert description here
// You can write your code in this editor


draw_sprite_ext(spr_sombra, 0, x, y,sombra_scale, sombra_scale, 0, c_white, 0.2);

draw_sprite_ext(sprite,image_index_sprite, x, y, xscale, image_yscale,image_angle,image_blend,image_alpha);

if(debug){
	draw_text_centraliza();
	draw_text(x,y - sprite_height*2, estado_txt);
	draw_text_default();
};
