
// Initialize all room linkages up front. These ds_maps are
// never freed.
left_links = ds_map_create();
right_links = ds_map_create();

var LEFTX = -8;
var RIGHTX = 1358;

right_links[? "Room1"] = new ConstantTransitionRule(Room2, LEFTX, 288);

left_links[? "Room2"] = new ConstantTransitionRule(Room1, RIGHTX, 288);
right_links[? "Room2"] = new SplitTransitionRule(
  new ConstantTransitionRule(Room2, LEFTX, 288),
  new ConstantTransitionRule(Room1, LEFTX, 96),
);
