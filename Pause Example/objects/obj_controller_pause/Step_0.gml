/// @description  Vérifiez que la touche pause est enfoncée ou non

if keyboard_check(ord("P"))
  {
  // Permet d'appuyer une fois sur la touche pause
  io_clear();
  if (visible = false)
    {
    // Définit les variables globales avant de commencer le processus de pause
    // obtenir les variables privées des objets
    // stocker dans une variable globale pouvant
    // être lu par les objets après l'affichage de l'écran de pause.
    with obj_something
      {
      global.anim_count = my_anim_count;
      }
    // Dire au controlleur de mettre le jeu en pause
    visible = true;
    game_paused = true;
    }
  else
    {game_paused = false;}
  }

if (visible = false) {exit;}



// Reactiver toutes les instances et enleve la pause 
if (game_paused = false && deactivated = true)
  {
  //Detruit les instance visible dans le menu pause ( si il y en a )
  if (instance_exists(obj_pause_screen))
    {
    with obj_pause_screen {instance_destroy();}
    }
  // Mémoire libre du background
  if (background_exists(pause_bg) = true) {background_delete(pause_bg)}
  // Reactiver tout les objets
  instance_activate_all();
  deactivated = false;
  // Cacher le menu pause
  visible = false;
  }

