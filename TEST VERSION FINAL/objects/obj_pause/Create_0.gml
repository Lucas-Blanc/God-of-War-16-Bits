layer_set_visible("Map", false);
room_speed = 60;
gpu_set_tex_filter( false );
audio_play_sound(sonJeu, 1, true);

#region  

font	= font_add_sprite( Ecriture, ord(" "), 1, 1);
draw_set_font( font );

pause		= false;
gwidth		= display_get_gui_width();
gheight		= display_get_gui_height();
cx			= gwidth/2;
cy			= gheight/2;
screen_alpha		= 0;
screen_alpha_set	= 0;


window		= true;
windowPrev	= true;


#endregion

#region 7

b		= 1; //selected
bc		= 0;
bgap	= 40; //vertical spacing between buttons


var	n = 0;
bstring[ n ]	= " RESUME "; n++;
bstring[ n ]	= " RESTART "; n++;
bstring[ n ]	= " MAINMENU "; n++;
bstring[ n ]	= " EXIT "; n++;
bc		= n; //total button count;


//Initialise La valeur des buttons
for( var i = 0; i< bc; i++; ){
	bx[ i ]		= 0;
	by[ i ]		= 0;
	bsca[ i ]	= 1;
	bcol[ i ]	= c_white;
	balpha[ i ]	= 1;
	bspd[ i ]	= 0;
	bxoff[ i ]	= 0;
	byoff[ i ]	= 0;
	byspd[ i ]	= 0;
}


#endregion

