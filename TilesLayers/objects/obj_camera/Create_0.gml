/// @description Insert description here
// You can write your code in this editor
alvo = noone;
estado = noone;
escala = 1;

inicial_cam_w = camera_get_view_width(view_camera[0]);
inicial_cam_h = camera_get_view_height(view_camera[0]);

zoom = function(){
	camera_set_view_size(view_camera[0],inicial_cam_w * escala, inicial_cam_h * escala);
	if(mouse_wheel_down()) escala += 0.1;
	if(mouse_wheel_up()) escala -= 0.1;
};

segue_alvo = function(){
    var view_w = camera_get_view_width(view_camera[0]);
	var view_h = camera_get_view_height(view_camera[0]);
	
	var cam_x = x - view_w / 2 ;
	var cam_y = y - view_h / 2 ;
	
	cam_x = clamp(cam_x,0,room_width - view_w);
	cam_y = clamp(cam_y,0,room_height - view_h);
	
	x = lerp(x, alvo.x,0.1);
	y = lerp(y, alvo.y,0.1);
	
	camera_set_view_pos(view_camera[0], cam_x, cam_y);
};

segue_player = function(){
	if(instance_exists(obj_player)) alvo=obj_player;
	if(!instance_exists(obj_player)) estado=segue_nada;
	segue_alvo();
	if(keyboard_check_released(vk_space)) estado=segue_inimigo;
};

segue_inimigo = function(){
	if(instance_exists(obj_inimigo)) alvo=obj_inimigo;
	if(!instance_exists(obj_inimigo)) estado=segue_nada;
    segue_alvo();;
	if(keyboard_check_released(vk_space)) estado=segue_player;
};


segue_nada = function(){
	alvo = noone;
};

estado = segue_player;


