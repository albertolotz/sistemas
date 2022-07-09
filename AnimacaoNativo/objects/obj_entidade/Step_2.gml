/// @description Insert description here
// You can write your code in this editor



/*
if(place_meeting(x + velocidade_horizontal, y, obj_chao)){
	var velocidade_horizontal_direcao = sign(velocidade_horizontal)
	while(!place_meeting(x + velocidade_horizontal_direcao, y, obj_chao)){
		x += velocidade_horizontal_direcao;
	};
	velocidade_horizontal = 0;
};

x += round(velocidade_horizontal);

if(place_meeting(x, y + velocidade_vertical, obj_chao)){
	var velocidade_vertical_direcao = sign(velocidade_vertical);
	while(!place_meeting(x, y + velocidade_vertical_direcao, obj_chao)){
		y += velocidade_vertical_direcao;
	};
	velocidade_vertical = 0;
};

y += round(velocidade_vertical);
*/

if(place_meeting(x + velocidade_horizontal, y, obj_chao)){
	var colidiu_chao = instance_place(x + velocidade_horizontal, y ,obj_chao);
	
	if(colidiu_chao){
		if(velocidade_horizontal > 0 ){
			x = colidiu_chao.bbox_left - sprite_width/2;
		}else if(velocidade_horizontal>0){
			x = colidiu_chao.bbox_right + sprite_width/2;
		}
	};	
	
	velocidade_horizontal = 0;
};

x += velocidade_horizontal;

var colidiu_chao = instance_place(x, y+velocidade_vertical,obj_chao);
if(colidiu_chao){
	if(velocidade_vertical > 0 ){
		y = colidiu_chao.bbox_top;
	}else if (velocidade_vertical<0) {
		y = colidiu_chao.bbox_bottom + (y-bbox_top);
	};
	velocidade_vertical = 0;
};

y += velocidade_vertical;





