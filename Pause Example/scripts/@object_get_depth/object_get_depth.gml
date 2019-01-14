/// @description Renvoie la profondeur de l'objet spécifié.
/// @param {Number} obj L'index de l'objet à vérifier
/// @return {Number} profondeur de l'objet

var objID = argument0;
var ret = 0;
if (objID >= 0) && (objID < array_length_1d(global.__objectID2Depth)) {
	ret = global.__objectID2Depth[objID];
} // Fini si
return ret;