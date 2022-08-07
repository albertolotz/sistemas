// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_centraliza(){
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
};

function draw_text_default(){
	draw_set_valign(-1);
	draw_set_halign(-1);
};
function desenha_sombra(_sprite,_scala, _cor=c_white, _alpha=0.2 ){
	draw_sprite_ext(_sprite, 0, x, y,_scala, _scala, 0, _cor, _alpha);
};

function ajusta_produndidade(){
	depth =  -y;
};
