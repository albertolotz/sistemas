/// @description Insert description here
// You can write your code in this editor

var sombra_scale, sombra_scale
sombra_scale = 0.5;
if(image_index > 1){
	sombra_scale = 0.7;	
};

draw_sprite_ext(spr_sombra, 0, x, y,sombra_scale, sombra_scale, 0, c_white, 0.2);

draw_self();

if(debug){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(x,y - sprite_height, estado);
	
	draw_text(x,y - sprite_height - 32, tempo_persegue_contador);
	
	draw_set_halign(-1);
	draw_set_valign(-1);
	
	draw_circle(destino_x, destino_y, 16, false);
	
	draw_circle(x,y,campo_visao,true);
	
};
