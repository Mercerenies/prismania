
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
right_links[? "rm_Start"] = new SplitTransitionRule(
  384,
  new ConstantTransitionRule(rm_Start1, LEFTX, 352),
  new ConstantTransitionRule(rm_Start1, LEFTX, 608),
);

left_links[? "rm_Start1"] = new SplitTransitionRule(
  384,
  new ConstantTransitionRule(rm_Start, RIGHTX, 352),
  new ConstantTransitionRule(rm_Start, RIGHTX, 608),
);

right_links[? "rm_Start1"] = new SplitTransitionRule(
  192,
  new ConstantTransitionRule(rm_Start2, LEFTX, 160),
  new ConstantTransitionRule(rm_Start2, LEFTX, 608),
);
left_links[? "rm_Start2"] = new SplitTransitionRule(
  192,
  new ConstantTransitionRule(rm_Start1, RIGHTX, 160),
  new ConstantTransitionRule(rm_Start1, RIGHTX, 608),
);

right_links[? "rm_Start2"] = new ConstantTransitionRule(rm_Start3, LEFTX, 544);
left_links[? "rm_Start3"] = new ConstantTransitionRule(rm_Start2, RIGHTX, 544);

right_links[? "rm_Start3"] = new ConstantTransitionRule(rm_Start4, LEFTX, 224);
left_links[? "rm_Start4"] = new ConstantTransitionRule(rm_Start3, RIGHTX, 224);

right_links[? "rm_Start4"] = new ConstantTransitionRule(rm_Start5, LEFTX, 608);
left_links[? "rm_Start5"] = new ConstantTransitionRule(rm_Start4, RIGHTX, 224);

right_links[? "rm_Start5"] = new SplitTransitionRule(
  354,
  new ConstantTransitionRule(rm_LoloPath, LEFTX, 640),
  new ConstantTransitionRule(rm_WallJump1, LEFTX, 224),
);
left_links[? "rm_WallJump1"] = new ConstantTransitionRule(rm_Start5, RIGHTX, 576);
left_links[? "rm_LoloPath"] = new SplitTransitionRule(
  320,
  new ConstantTransitionRule(rm_LoloBoss, RIGHTX, 640),
  new ConstantTransitionRule(rm_Start5, RIGHTX, 148),
);
right_links[? "rm_LoloBoss"] = new ConstantTransitionRule(rm_LoloPath, LEFTX, 192);

right_links[? "rm_WallJump1"] = new ConstantTransitionRule(rm_WallJump2, LEFTX, 192);
left_links[? "rm_WallJump2"] = new ConstantTransitionRule(rm_WallJump1, RIGHTX, 512);

right_links[? "rm_LoloPath"] = new SplitTransitionRule(
  260,
  new ConstantTransitionRule(rm_LoloHub, LEFTX, 224),
  new ConstantTransitionRule(rm_LoloHub, LEFTX, 608),
);
left_links[? "rm_LoloHub"] = new SplitTransitionRule(
  260,
  new ConstantTransitionRule(rm_LoloPath, RIGHTX, 224),
  new ConstantTransitionRule(rm_LoloPath, RIGHTX, 608),
);

right_links[? "rm_Arrow1"] = new SplitTransitionRule(
  300,
  undefined, // TODO
  new ConstantTransitionRule(rm_LoloBoss, LEFTX, 192),
);
left_links[? "rm_LoloBoss"] = new ConstantTransitionRule(rm_Arrow1, RIGHTX, 672);

right_links[? "rm_Arrow2"] = new ConstantTransitionRule(rm_Arrow1, LEFTX, 256);
left_links[? "rm_Arrow1"] = new ConstantTransitionRule(rm_Arrow2, RIGHTX, 256);

right_links[? "rm_Arrow3"] = new ConstantTransitionRule(rm_Arrow2, LEFTX, 256);
left_links[? "rm_Arrow2"] = new ConstantTransitionRule(rm_Arrow3, RIGHTX, 224);
