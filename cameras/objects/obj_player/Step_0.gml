/// @description Insert description here
// You can write your code in this editor

var _up		= keyboard_check(vk_up);
var _down	= keyboard_check(vk_down);
var _left	= keyboard_check(vk_left);
var _right	= keyboard_check(vk_right);

if (_up)	face = 1;
if (_down)	face = 3;
if (_left)	{face = 2; xscale = -1;};
if (_right)	{face = 0; xscale = 1};

var estou_no_gelo = instance_place(x,y,obj_gelo);

if(estou_no_gelo){
	acelera = estou_no_gelo.aceleracao_gelo;
}else{
	acelera = aceleracao_player; 
}

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

estado();
