
// Global initialization

// Some global lists for the collision functions
global.collisions_list = ds_list_create();

// This isn't used, but I'm leaving the variable here to
// intimidate anyone reading the code in the future ^.^
global.voronoi_data = undefined;

// DEBUG CODE
//room_goto(rm_Intro);
room_goto(rm_FinalBoss);
ctrl_UnlockedAbilities.wall_jump = true;
ctrl_UnlockedAbilities.archery = true;
ctrl_UnlockedAbilities.double_jump = true;
ctrl_UnlockedAbilities.bullet_time = true;
ctrl_UnlockedAbilities.personal_crystal = true;
