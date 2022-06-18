/// @description Insert description here
// You can write your code in this editor

//Sistema Colisão e Movimentação Horizontal

repeat(abs(velh)){
	if(place_meeting(x + sign(velh), y, obj_chao)){
		velh=0;
		break;
	}else{
		x += sign(velh);
	};
};

