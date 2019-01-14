// Verifie que le jeu est bien en pause
if (game_paused = true && visible = true)
  {
  // S'assure que les instances ne sont pas encore désactivées pour capturer l'écran
  if (deactivated = false)
    {
    // Capture l'ecran
    pause_bg = scr_screen_capture();
    // Désactiver toutes les instances en dehors du contrôleur
    instance_deactivate_all(true);
    deactivated = true;
    }
  // Dessine l'ecran de "PAUSE"
  draw_background_ext(pause_bg,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),1,1,0,pause_col,1); 
  draw_set_font(fnt_pause);
  draw_text_colour((room_width/2)-60,(room_height/2)-30,string_hash_to_newline("PAUSE"),c_white,c_white,c_white,c_white,1);
  }

