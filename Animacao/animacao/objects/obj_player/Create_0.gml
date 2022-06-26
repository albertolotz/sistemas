/// @description Insert description here
// You can write your code in this editor
event_inherited();

velocidade_maxima = 5;
aceleracao_player = 0.2;
acelera = aceleracao_player;

face = 0;
sprite = sprite_index; 
xscale =1; 
estado = noone;
estado_txt = "parado";
debug = false;

sprites =	[
				[spr_player_idle_right, spr_player_idle_up, spr_player_idle_right, spr_player_idle_down],
				[spr_player_run_right, spr_player_run_up, spr_player_run_right, spr_player_run_down],
			];

sprites_index = 0;

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);

estado_parado = function(){
	estado_txt = "parado";
	sprites_index = 0;
	velocidade_horizontal = 0;
	velocidade_vertical = velocidade_horizontal;
	
	var _up		= keyboard_check(vk_up);
	var _down	= keyboard_check(vk_down);
	var _left	= keyboard_check(vk_left);
	var _right	= keyboard_check(vk_right);
	
	sprite = sprites[sprites_index][face];
	
	if((_up xor _down) || (_left xor _right)){
		estado = estado_movendo;
	};
};

estado_movendo = function(){
	estado_txt = "movendo";
	sprites_index = 1;

	sprite = sprites[sprites_index][face];

	if(abs(velocidade_vertical) <= 0.2 && abs(velocidade_horizontal) <= 0.2){
		estado = estado_parado;
	};
};

estado = estado_parado;
