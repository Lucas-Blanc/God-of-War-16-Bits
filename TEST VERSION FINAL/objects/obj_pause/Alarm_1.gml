/// @description Pause
instance_deactivate_all( true );
audio_pause_all();


screen_alpha_set	= 0.8;



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