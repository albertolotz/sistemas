/// @description Insert description here
// You can write your code in this editor
event_inherited();

velocidade_maxima = 2;

estado = "parado";
debug = false;

image_speed = 8 / room_speed;

tempo_estado = room_speed *2;
tempo = tempo_estado;

tempo_persegue = room_speed *2;
tempo_persegue_contador = tempo_persegue;

tempo_ataque = room_speed * 0.8;
tempo_ataque_contador = tempo_ataque;

destino_x = 0;
destino_y = 0;

alvo = noone;

campo_visao = 128;

controla_sprite = function(){
	var direcao = point_direction(0, 0, velocidade_horizontal, velocidade_vertical);
	var face = direcao div 90;
	switch(face){
		case 0: sprite_index = spr_cogumelo_right	; break;
		case 1: sprite_index = spr_cogumelo_up		; break;
		case 2: sprite_index = spr_cogumelo_right	; break;
		case 3: sprite_index = spr_cogumelo_down	; break;
	};
};

muda_estado = function(){
	var mouse_sobre = position_meeting(mouse_x,mouse_y ,id);
	var clicou = mouse_check_button_released(mb_middle);

	if(mouse_sobre && clicou){
		estado = get_string("estado","parado");
	};
};

vigia_player = function(){
	var player = collision_circle(x,y,campo_visao,obj_player,false,true);
	if (player && tempo_persegue_contador <= 0){
		estado = "persegue_player";
		alvo = player;
	};
};


controla_estado = function(){
	image_blend = c_white;
	
	switch(estado){
		case "parado":
			image_speed = 4 / room_speed;
			if(tempo_persegue_contador > 0 ) tempo_persegue_contador --;
			
			tempo --;
			velocidade_horizontal = 0;
			velocidade_vertical = 0;
			if(tempo<=0){
				estado = choose("parado", "andando", "persegue_player");
				tempo = tempo_estado;
			};
			vigia_player();
			
		break;
		
		case "andando":
			image_speed = 8 / room_speed;
			if(tempo_persegue_contador > 0 ) tempo_persegue_contador --;
			
			tempo --;
			
			var distancia_ate_alvo = point_distance(x,y,destino_x, destino_y);
			
			if(destino_x == 0 or destino_y == 0 or distancia_ate_alvo < 20){
				destino_x = random_range(0, room_width);
				destino_y = random_range(0, room_height);
			};
			
			var direcao = point_direction(x,y,destino_x, destino_y);
			velocidade_horizontal = lengthdir_x(velocidade_maxima,direcao);
			velocidade_vertical = lengthdir_y(velocidade_maxima,direcao);
			
			if(place_meeting(x + velocidade_horizontal, y + velocidade_vertical ,obj_chao)){
				estado = "parado";
				destino_x = 0;
				destino_y = 0;
				tempo = tempo_estado;
			};
			
			if(tempo<=0){
				estado = choose("parado", "andando","persegue_player");
				destino_x = 0;
				destino_y = 0;
				tempo = tempo_estado;
			};
			
			vigia_player();
			
		break;
		
		case "persegue_player":
			image_speed = 10 / room_speed;
			
			image_blend = c_orange;
			
			//var distancia_ate_alvo = point_distance(x,y,destino_x, destino_y);
			if instance_exists(obj_player) alvo = obj_player;
			
			if(alvo){
				destino_x = alvo.x;
				destino_y = alvo.y;
			}else{
				estado = choose("parado", "parado", "persegue_player");
				destino_x = 0;
				destino_y = 0;
				tempo = tempo_estado;
			};
			
			
			var direcao = point_direction(x,y,destino_x, destino_y);
			velocidade_horizontal = lengthdir_x(velocidade_maxima,direcao);
			velocidade_vertical = lengthdir_y(velocidade_maxima,direcao);
			
			var distancia_ate_alvo = point_distance(x,y,destino_x, destino_y);
			
			if(distancia_ate_alvo > campo_visao * 2){
				estado = choose("parado", "andando", "persegue_player");
				destino_x = 0;
				destino_y = 0;
			};
			
			if(distancia_ate_alvo < 100){
				estado = "carrega_ataque";
			};
			
		break;
		
		case "carrega_ataque":
			image_speed = 2 / room_speed;
			tempo_ataque_contador --;
			var _green = (tempo_ataque_contador / tempo_ataque) * 79;
			var _blue = _green;
			
			image_blend = make_color_rgb(255,_green,_blue);
			velocidade_horizontal = 0;
			velocidade_vertical = 0;
			if(tempo_ataque_contador<=0){
				estado="ataque";
				tempo_ataque_contador = tempo_ataque;
			};
		break;
		
		case "ataque":
			tempo_persegue_contador = tempo_persegue;
			image_blend = c_red;
			if instance_exists(obj_player) alvo = obj_player;
			
			
			var direcao = point_direction(x,y,destino_x, destino_y);
			velocidade_horizontal = lengthdir_x(velocidade_maxima * 3,direcao);
			velocidade_vertical = lengthdir_y(velocidade_maxima * 3 ,direcao);
			
			var distancia_ate_alvo = point_distance(x,y,destino_x, destino_y);
			
			if(distancia_ate_alvo<16){
				estado="parado";
				//obj_player.velocidade_horizontal =  10;
				//obj_player.velocidade_vertical =  10;
			};

		break;
	
	};
};
