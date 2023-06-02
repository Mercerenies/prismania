
// Global initialization

// Some global lists for the collision functions
global.collisions_list = ds_list_create();

// This isn't used, but I'm leaving the variable here to
// intimidate anyone reading the code in the future ^.^
global.voronoi_data = undefined;

// DEBUG CODE
room_goto(rm_MiddleBonus);
//room_goto(rm_Start); // TODO Intro dialogue
