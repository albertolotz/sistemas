/// @description Insert description here
// You can write your code in this editor
var estou_no_chao = place_meeting(x, y+1 ,obj_chao);

var _pulo	= keyboard_check_pressed(ord("K"));
var _left	= keyboard_check(ord("A"));
var _right	= keyboard_check(ord("D"));

velocidade_horizontal	= (_right - _left )	* velocidade_horizontal_maxima;
velocidade_vertical		= clamp(velocidade_vertical,-velocidade_vertical_maxima ,velocidade_vertical_maxima);

if(estou_no_chao){
		qtd_pulos = qtd_pulos_maximo
	}else{
		velocidade_vertical += gravidade;
};

if(_pulo && qtd_pulos > 0){
	velocidade_vertical = -velocidade_vertical_maxima;
	qtd_pulos --
};


