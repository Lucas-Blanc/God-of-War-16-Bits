

#region		//Définir des variables

///		Place les entrées	
var kPause		= (keyboard_check_pressed( vk_escape ) || gamepad_button_check_pressed(0, gp_start));
var kDown		= (gamepad_button_check_pressed(0, gp_padd) || keyboard_check_pressed( ord("S") )  );
var kUp			= (gamepad_button_check_pressed(0, gp_padu) || keyboard_check_pressed( ord("Z") ) );
var kConfirm	= (gamepad_button_check_pressed(0, gp_face2) || keyboard_check_pressed( vk_space) );


screen_alpha	= Approach( screen_alpha, screen_alpha_set, .1 );

#endregion

#region		//Controls


// Open PauseMenu when you minimize the window 
/*
if ( !window_has_focus() ){
	window = true;
} else {
	window = false;
}

if ( window != windowPrev ){
	if ( !window ){
		kPause = true;
	}
	windowPrev = window;
}
*/


///		Trigger PauseMenu	///
if ( kPause ){
	if ( pause ){
		alarm[0]	= 2; //Resume
	} else {
		alarm[1]	= 2; //Pause
	}
	pause = !pause
}


#endregion

#region		//Buttons		


if ( pause ){
	///		Button Pos		///
	for( var i = 0; i< bc; i++; ){
		var x_set		= cx;
		var y_set		= cy- (bgap* ( b- i )); //align the vertical offset of the buttons
		var xoff_set	= 0;
		var yoff_set	= 0;
		var sca_set		= 1;
		var alpha_set	= 1;
		var col_set		= c_white;
		var diff		= abs( b-i );

		///		Hovered Button		///
		if ( b == i ){ 
		//x_set		= cx+ bxoff[i]; 
		sca_set		= 2.5;		 // scale
		alpha_set	= 1;		// alpha
		col_set		= c_white; //color
		xoff_set	= 15;	  // offset to the right

		///		Other Buttons	///
		} else {		
		//x_set		= cx;
		sca_set		= 2- (0.2* diff);
		alpha_set	= 1- (0.2* diff);
		col_set		= c_gray;
		xoff_set	= 0;
		}
		///		Set Temp variables into the specified button array		///
		bx[ i ]		= x_set+ bxoff[ i ];
		by[ i ]		= lerp( by[i], y_set, 0.2 );
		bsca[ i ]	= lerp( bsca[i], sca_set, .2 );
		balpha[ i ]	= lerp( balpha[i], alpha_set, .2 );
		bcol[ i ]	= col_set;
		
		bxoff[ i ]	= lerp( bxoff[ i ], xoff_set, .2 );
		byoff[ i ]  = yoff_set;
		
	}

	
	
	///		Scroll through buttons		///
	if ( kDown ){
		b  = Approach( b, bc- 1, 1 );
		audio_play_sound(sonSelec, 5, false);
	} else if ( kUp ){
		b	= Approach( b, 0, 1 );
		audio_play_sound(sonSelec, 5, false);
	}
	
	
	///		Select Button	///
	if ( kConfirm ){
		if ( pause ){
			audio_play_sound(sonValidation, 5, false);
		switch( b ){
			case 0: // Resume
				alarm[0]	= room_speed* 0.1; //resume timer 
				screen_alpha_set	= 0; 
			break;
			case 1: // Restart
				room_restart();

			break;
			case 2: // MainMenus
				game_restart();

			break;
			case 3: // Exit
				game_end();
			break;
		}
		}
		} //end Confirm statement
} 

#endregion
