/// @description Insert description here
// You can write your code in this editor

var _up		= keyboard_check(ord("W"));
var _down	= keyboard_check(ord("S"));
var _left	= keyboard_check(ord("A"));
var _right	= keyboard_check(ord("D"));

velh = (_right - _left ) * max_velh;
velv = (_down -_up  ) * max_velv;



