// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -1000; // objSurfaceController
global.__objectDepths[1] = -1000; // objBlood
global.__objectDepths[2] = 0; // objBlock
global.__objectDepths[3] = 0; // objBloodController
global.__objectDepths[4] = 0; // objMonster
global.__objectDepths[5] = 0; // objIntro


global.__objectNames[0] = "objSurfaceController";
global.__objectNames[1] = "objBlood";
global.__objectNames[2] = "tSol";
global.__objectNames[3] = "objBloodController";
global.__objectNames[4] = "oEnemy";
global.__objectNames[5] = "objIntro";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for