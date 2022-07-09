/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x + velocidade_horizontal, y, obj_chao)){
	var colidiu_chao = instance_place(x + velocidade_horizontal, y ,obj_chao);
	
	if(colidiu_chao){
		if(velocidade_horizontal > 0 ){
			x = colidiu_chao.bbox_left - sprite_width/2;
		}else if(velocidade_horizontal<0){
			x = colidiu_chao.bbox_right + sprite_width/2;
		}
	};	
	
	velocidade_horizontal = 0;
};

x += velocidade_horizontal;

//if(place_meeting(x , y + velocidade_vertical, obj_chao)){
//	var colidiu_chao = instance_place(x , y + velocidade_horizontal ,obj_chao);
//	show_debug_message(colidiu_chao);
//	if(colidiu_chao){
//		if(velocidade_vertical > 0 ){
//			y = colidiu_chao.bbox_top;
//		}else if(velocidade_vertical<0){
//			y = colidiu_chao.bbox_right + 11;
//		}
//	};	
//	
//	velocidade_vertical = 0;
//};
//
//y += velocidade_vertical;

var colidiu_chao = instance_place(x, y + velocidade_vertical,obj_chao);
if(colidiu_chao){
	if(velocidade_vertical > 0 ){
		y = colidiu_chao.bbox_top;
	}else if (velocidade_vertical<0) {
		y = colidiu_chao.bbox_bottom + (y- bbox_top);
	};
	velocidade_vertical = 0;
};

y += velocidade_vertical;
