// Renvoie les données d'arrière-plan capturées à l'écran, qui peuvent ensuite être dessinées ultérieurement.

var ret = -1;
var sfc_width = surface_get_width(application_surface);
var sfc_height = surface_get_height(application_surface);

// Créer une surface de dessin
var sfc = surface_create(sfc_width,sfc_height);
surface_set_target(sfc);
// Clear screen;
// raw_clear et draw_rectangle effaceront l'écran MAIS
// sur certains systèmes, il crée des images fantomatiques, par exemple, lorsque
// les sprites sont animés. Pour empêcher ces images, les deux sont utilisés.
draw_set_colour_write_enable(false,false,false,true);
draw_clear(c_black);
draw_rectangle_colour(0,0,sfc_width,sfc_height,c_black,c_black,c_black,c_black,false);
draw_set_colour_write_enable(true,true,true,false);
// Capture de l'ecran
draw_surface(application_surface,0,0);
ret = background_create_from_surface(sfc,0,0,sfc_width,sfc_height,false,false);
// Finaliser le processus de dessin et effacer la surface de la mémoire
surface_reset_target();
draw_set_colour_write_enable(true,true,true,true);
surface_free(sfc);

return ret;
