/// @description Insert description here
// You can write your code in this editor

//Sistema Colisão e Movimentação Horizontal

repeat(abs(velocidade_horizontal)){
	velocidade_horizontal_direcao = sign(velocidade_horizontal);
	
	var colisao_obj_chao =  function(){
			return place_meeting(x + velocidade_horizontal_direcao, y, obj_chao)
		};
	
	var colisao_obj_rampa_sobe = place_meeting(x + velocidade_horizontal_direcao, y - 1, obj_chao);
	var colisao_obj_rampa_desce_1p = place_meeting(x + velocidade_horizontal_direcao, y + 1, obj_chao);
	var colisao_obj_rampa_desce_2p = place_meeting(x + velocidade_horizontal_direcao, y + 2, obj_chao);
	
	if(colisao_obj_chao() && !colisao_obj_rampa_sobe){
		y--;
	};
	
	if(!colisao_obj_chao() && !colisao_obj_rampa_desce_1p && colisao_obj_rampa_desce_2p){
		y++;
	};
//place_meeting(x + velocidade_horizontal_direcao, y, obj_chao)
	if(colisao_obj_chao()){
		velocidade_horizontal=0;
		break;
	}else{
		x += velocidade_horizontal_direcao;
	};
};

//Sistema Colisão e Movimentação vertical
repeat(abs(velocidade_vertical)){
	var velocidade_vertical_direcao = sign(velocidade_vertical);
	
	if(place_meeting(x, y + velocidade_vertical_direcao, obj_chao)){
		velocidade_vertical=0;
		break;
	}else{
		y += velocidade_vertical_direcao;
	};
};

