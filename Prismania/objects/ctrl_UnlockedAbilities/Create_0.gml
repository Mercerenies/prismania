
// Abilities
double_jump = false;
wall_jump = false;
archery = false;
bullet_time = false;
personal_crystal = false;

// Other Persistent Help Screens
has_collected_shield = false;
has_collected_crystal = false;
has_collected_coin = false;

// Player spawn coordinates in the next room. spawn_x and spawn_y are
// the coordinates the player will spawn at the next time a room
// starts. If respawn_x and respawn_y are also set, then they will
// become the new spawn_x and spawn_y after that point. So when we do
// a room transition, we set spawn_x and spawn_y to the positions the
// player will spawn at the first time and then we set respawn_x and
// respawn_y to the coordinates to respawn at if we die.
spawn_x = undefined;
spawn_y = undefined;
respawn_x = undefined;
respawn_y = undefined;

// Which dialogue you've already seen (this
// ds_map is never freed, by design)
visited_rooms = ds_map_create();

visitRoom = function() {
  visited_rooms[? room_get_name(room)] = 1;
}

isRoomVisited = function() {
  return ds_map_exists(visited_rooms, room_get_name(room));
}

// Which room coins you've already collected (this
// ds_map is never freed, by design)
coined_rooms = ds_map_create();

markCoin = function() {
  coined_rooms[? room_get_name(room)] = 1;
}

hasCoin = function() {
  return ds_map_exists(coined_rooms, room_get_name(room));
}

// DEBUG CODE
wall_jump = true;
