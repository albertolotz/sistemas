/// @description Insert description here
// You can write your code in this editor



ajusta_produndidade();

if(place_meeting(x + velocidade_horizontal, y, obj_chao)){
	var colidiu_chao = instance_place(x + velocidade_horizontal, y ,obj_chao);
	
	if(colidiu_chao){
		if(velocidade_horizontal > 0 ){
			x = colidiu_chao.bbox_left - (x + bbox_right);
		}else if(velocidade_horizontal>0){
			x = colidiu_chao.bbox_right + (x - bbox_left);
		}
	};	
	
	velocidade_horizontal = 0;
};

x += velocidade_horizontal;

var colidiu_chao = instance_place(x, y + velocidade_vertical,obj_chao);
if(colidiu_chao){
	if(velocidade_vertical > 0 ){
		y = colidiu_chao.bbox_top;
	}else if (velocidade_vertical<0) {
		y = colidiu_chao.bbox_bottom + (y-bbox_top);
	};
	velocidade_vertical = 0;
};

y += velocidade_vertical;





