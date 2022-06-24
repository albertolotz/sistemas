/// @description Insert description here
// You can write your code in this editor
event_inherited();

velocidade_maxima = 2;

estado = "parado";
debug = false;

tempo_estado = room_speed *2;
tempo = tempo_estado;

destino_x = 0;
destino_y = 0;

alvo = noone;

campo_visao = 128;

muda_estado = function(){
	var mouse_sobre = position_meeting(mouse_x,mouse_y ,id);
	var clicou = mouse_check_button_released(mb_middle);

	if(mouse_sobre && clicou){
		estado = get_string("estado","parado");
	};
};

vigia_player = function(){
	var player = collision_circle(x,y,campo_visao,obj_player,false,true);
	if (player){
		estado = "persegue_player";
		alvo = player;
	};
};


controla_estado = function(){
	image_blend = c_white;
	switch(estado){
		case "parado":
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
			tempo --;
			
			var distancia_ate_alvo = point_distance(x,y,destino_x, destino_y);
			
			if(destino_x == 0 or destino_y == 0 or distancia_ate_alvo < 20){
				destino_x = random_range(0, room_width);
				destino_y = random_range(0, room_height);
			};
			
			var direcao = point_direction(x,y,destino_x, destino_y);
			velocidade_horizontal = lengthdir_x(velocidade_maxima,direcao);
			velocidade_vertical = lengthdir_y(velocidade_maxima,direcao);
			
			if(tempo<=0){
				estado = choose("parado", "andando","persegue_player");
				destino_x = 0;
				destino_y = 0;
				tempo = tempo_estado;
			};
			vigia_player();
			
		break;
		
		case "persegue_player":
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
		break;
	
	};
};
