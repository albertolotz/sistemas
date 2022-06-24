/// @description Insert description here
// You can write your code in this editor
draw_self();

if(debug){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(x,y - sprite_height, estado);
	
	draw_set_halign(-1);
	draw_set_valign(-1);
	
	draw_circle(destino_x, destino_y, 16, false);
	
	draw_circle(x,y,campo_visao,true);
};
