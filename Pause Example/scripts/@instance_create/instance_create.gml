/// @description Crée une instance d'un objet donné à une position donnée.
/// @param x La position x à laquelle l'objet sera créé.
/// @param y La position y sur laquelle l'objet sera créé.
/// @param obj L'objet pour lequel créer une instance de.
var myDepth = object_get_depth( argument2 );
return instance_create_depth( argument0, argument1, myDepth, argument2 );
