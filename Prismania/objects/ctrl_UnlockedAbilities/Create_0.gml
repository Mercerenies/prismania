
// Abilities
double_jump = false;
wall_jump = false;
archery = false;
bullet_time = false;
personal_crystal = false;

// Other Persistent Help Screens
has_collected_shield = false;
has_collected_crystal = false;

// Which dialogue you've already seen (this
// ds_map is never freed, by design)
visited_rooms = ds_map_create();

visitRoom = function() {
  visited_rooms[? room_get_name(room)] = 1;
}

isRoomVisited = function() {
  return ds_map_exists(visited_rooms, room_get_name(room));
}