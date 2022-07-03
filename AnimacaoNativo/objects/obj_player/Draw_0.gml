/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite,image_index_sprite, x, y, xscale, image_yscale,image_angle,image_blend,image_alpha);

if(debug){
	draw_text_centraliza();
	draw_text(x,y - sprite_height*2, estado_txt);
	draw_text_default();
};
