
// Initialise le tableau global qui permet la recherche de la profondeur d'un objet donné
// GM2.0 n'a pas de profondeur sur les objets, donc lors de l'importation à partir de 1.x, un tableau global est créé.
gml_pragma( "global", "__global_object_depths()");

// Insére les tableaux générés ici
global.__objectDepths[0] = 0; // obj_something
global.__objectDepths[1] = -2000000; // obj_controller_pause
global.__objectDepths[2] = -2000001; // obj_pause_screen


global.__objectNames[0] = "obj_something";
global.__objectNames[1] = "obj_controller_pause";
global.__objectNames[2] = "obj_pause_screen";



// crée un autre tableau avec les entrées correctes
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // fin si
} // Fini si