// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_text_shadow(X, Y, STRING){
	draw_text_colour(X + 2, Y + 2, STRING, c_black, c_black, c_black, c_black, 1);
	draw_text(X, Y, STRING);
}

function draw_text_shadow_color(X, Y, STRING, COLOR, ALPHA){
	draw_text_colour(X + 2, Y + 2, STRING, c_black, c_black, c_black, c_black, 1);
	draw_text_colour(X, Y, STRING, COLOR, COLOR, COLOR, COLOR, ALPHA);
}