/// @description Insert description here
// You can write your code in this editor
event_inherited();

velocidade_maxima = 3;
aceleracao_player = 0.2;
acelera = aceleracao_player;
velocidade_rolando = 3;

face = 0;
sprite = sprite_index; 
xscale =1; 
estado = noone;
estado_txt = "parado";
debug = false;
attack = false;
shield = false;
roll = false;
image_index_sprite = 0;
image_speed_sprite_indice = 2;
image_speed_sprite = image_speed_sprite_indice / room_speed;
image_total_sprite = 1;

sprites =	[
				[spr_player_idle_right, spr_player_idle_up, spr_player_idle_right, spr_player_idle_down],
				[spr_player_run_right, spr_player_run_up, spr_player_run_right, spr_player_run_down],
				[spr_player_attack_right, spr_player_attack_up, spr_player_attack_right, spr_player_attack_down],
				[spr_player_shield_right, spr_player_shield_up, spr_player_shield_right, spr_player_shield_down],
				[spr_player_roll_right, spr_player_roll_up, spr_player_roll_right, spr_player_roll_down]
			];

sprites_index = 0;

keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("D"), vk_right);
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("J"), ord("C"));
keyboard_set_map(ord("L"), ord("Z"));
keyboard_set_map(ord("K"), ord("X"));

controla_player = function(){
	var _up		= keyboard_check(vk_up);
	var _down	= keyboard_check(vk_down);
	var _left	= keyboard_check(vk_left);
	var _right	= keyboard_check(vk_right);
	attack = keyboard_check_pressed(ord("C"));
	shield = keyboard_check(ord("Z"));
	roll = keyboard_check_pressed(ord("X"));

	if (_up)	face = 1;
	if (_down)	face = 3;
	if (_left)	{face = 2; xscale = -1;};
	if (_right)	{face = 0; xscale = 1};
	
	if((_up xor _down) || (_left xor _right)){
		var direcao = point_direction(0,0,(_right - _left) ,(_down - _up));
		var velocidade_horizontal_maxima	= lengthdir_x(velocidade_maxima,direcao);
		var velocidade_vertical_maxima	= lengthdir_y(velocidade_maxima,direcao);
	
		velocidade_horizontal	= lerp(velocidade_horizontal,velocidade_horizontal_maxima,acelera);
		velocidade_vertical		= lerp(velocidade_vertical, velocidade_vertical_maxima, acelera);
	}else{
		velocidade_horizontal	= lerp(velocidade_horizontal,0,acelera);
		velocidade_vertical		= lerp(velocidade_vertical,0,acelera);
	};
};

ajusta_sprite = function(indice_array){
	if(sprite != sprites[indice_array][face]) image_index_sprite = 0;
	sprite = sprites[indice_array][face];
	image_total_sprite = sprite_get_number(sprite);
	image_index_sprite += image_speed_sprite;
	image_index_sprite %= image_total_sprite;
};

estado_rolando = function(){
	
	sprites_index = 4;
	
	if(estado_txt != "rolando"){
		var _up		= keyboard_check(vk_up);
		var _down	= keyboard_check(vk_down);
		var _left	= keyboard_check(vk_left);
		var _right	= keyboard_check(vk_right);
		
		if((_up xor _down) or (_right xor _left)){
			var direcao = point_direction(0,0,_right - _left, _down - _up);
			velocidade_horizontal = lengthdir_x(velocidade_rolando, direcao);
			velocidade_vertical = lengthdir_y(velocidade_rolando, direcao);
		}else{
			velocidade_horizontal = lengthdir_x(velocidade_rolando, face*90);
			velocidade_vertical = lengthdir_y(velocidade_rolando, face*90);
		};
	};
	estado_txt = "rolando";
	
	ajusta_sprite(sprites_index);
	
	image_speed_sprite = sprite_get_number(sprite) / (room_speed / image_speed_sprite_indice);
	
	if(image_index_sprite + image_speed_sprite   >= image_total_sprite){
		estado=estado_parado;
		image_speed_sprite = image_speed_sprite_indice / room_speed;
	}
};

estado_defesa = function(){
	sprites_index = 3;
	estado_txt = "defesa";
	controla_player();
	ajusta_sprite(sprites_index);
	velocidade_horizontal = 0;
	velocidade_vertical = 0;
	if(!shield)estado=estado_parado;
};

estado_ataque = function(){
	sprites_index = 2;
	estado_txt = "ataque";
	ajusta_sprite(sprites_index);
	velocidade_horizontal = 0;
	velocidade_vertical = 0;
	if(image_index_sprite + image_speed_sprite >= image_total_sprite) estado=estado_parado;
};

estado_parado = function(){
	controla_player();
	estado_txt = "parado";
	sprites_index = 0;
	velocidade_horizontal = 0;
	velocidade_vertical = velocidade_horizontal;
	
	var _up		= keyboard_check(vk_up);
	var _down	= keyboard_check(vk_down);
	var _left	= keyboard_check(vk_left);
	var _right	= keyboard_check(vk_right);
	
	ajusta_sprite(sprites_index);
	
	if((_up xor _down) || (_left xor _right)){
		estado = estado_movendo;
	};
	
	if(attack){
		estado = estado_ataque;
	};
	
	if(shield){
		estado = estado_defesa;
	}
	
	if(roll){
		estado = estado_rolando;
	}
	
};

estado_movendo = function(){
	controla_player();
	estado_txt = "movendo";
	sprites_index = 1;

	ajusta_sprite(sprites_index);

	if(abs(velocidade_vertical) <= 0.2 && abs(velocidade_horizontal) <= 0.2){
		estado = estado_parado;
	};
	
	if(attack){
		estado = estado_ataque;
	};
	
	if(shield){
		estado = estado_defesa;
	}
	
	if(roll){
		estado = estado_rolando;
	}
};

estado = estado_parado;
