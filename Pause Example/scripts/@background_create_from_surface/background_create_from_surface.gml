/// @description Crée un arrière-plan en copiant une zone d'une surface.
/// @param index L'index de la surface à créer.
/// @param x La position x à partir de laquelle copier.
/// @param y La position y à partir de laquelle copier.
/// @param w La largeur de la zone à copier (à partir de la position x).
/// @param h Hauteur de la zone à copier (à partir de la position y).
/// @param removeback Indique s'il faut rendre tous les pixels de la même couleur (pixel en bas à gauche) transparents.
/// @param smooth Indique s'il faut lisser les bords.
/// @returns {numéro} nom de la ressource pour le nouvel arrière-plan

return sprite_create_from_surface(argument0, argument1, argument2, argument3, argument4, argument5, argument6, 0, 0);