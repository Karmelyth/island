//@description KEY BINDINGS
CurrentFrame++;

if keyboard_check_pressed(ord("R")){
	game_restart();	
}
if keyboard_check_pressed(Key.devtoggle){
	if !dev{
		dev = true;	
	}else{
		dev = false;	
	}
}