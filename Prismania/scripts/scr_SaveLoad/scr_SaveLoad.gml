
function _copyMapInto(target, key, map_value) {
  var new_map = ds_map_create();
  ds_map_copy(new_map, map_value);
  ds_map_add_map(target, key, new_map);
}

function slurpFile(filename) {
  var file = file_text_open_read(filename);
  var s = "";
  while (!file_text_eof(file)) {
    s += file_text_readln(file);
  }
  file_text_close(file);
  return s;
}

function hasSaveFile() {
  return file_exists(FILENAME);
}

function saveGame() {

  var map = ds_map_create();
  with (ctrl_UnlockedAbilities) {
    map[? "room"] = room_get_name(room);
    map[? "double_jump"] = double_jump;
    map[? "wall_jump"] = wall_jump;
    map[? "archery"] = archery;
    map[? "personal_crystal"] = personal_crystal;
    map[? "bullet_time"] = bullet_time;
    map[? "has_collected_shield"] = has_collected_shield;
    map[? "has_collected_crystal"] = has_collected_crystal;
    map[? "has_collected_coin"] = has_collected_coin;
    map[? "spawn_x"] = spawn_x;
    map[? "spawn_y"] = spawn_y;
    map[? "boss1_met"] = boss1_met;
    map[? "boss1_defeated"] = boss1_defeated;
    map[? "boss2_met"] = boss2_met;
    map[? "boss2_defeated"] = boss2_defeated;
    map[? "boss3_met"] = boss3_met;
    _copyMapInto(map, "visited_rooms", visited_rooms);
    _copyMapInto(map, "coined_rooms", coined_rooms);
  }

  var file = file_text_open_write(FILENAME);
  file_text_write_string(file, json_encode(map));
  file_text_close(file);
  ds_map_destroy(map);
}

function loadGame() {
  if (!hasSaveFile()) {
    return;
  }

  var contents = slurpFile(FILENAME);
  var map = json_decode(contents);
  var target_room = asset_get_index(map[? "room"]);
  with (ctrl_UnlockedAbilities) {
    double_jump = map[? "double_jump"];
    wall_jump = map[? "wall_jump"];
    archery = map[? "archery"];
    bullet_time = map[? "bullet_time"];
    personal_crystal = map[? "personal_crystal"];
    has_collected_shield = map[? "has_collected_shield"];
    has_collected_crystal = map[? "has_collected_crystal"];
    has_collected_coin = map[? "has_collected_coin"];
    spawn_x = map[? "spawn_x"];
    spawn_y = map[? "spawn_y"];
    respawn_x = undefined;
    respawn_y = undefined;
    boss1_met = map[? "boss1_met"];
    boss1_defeated = map[? "boss1_defeated"];
    boss2_met = map[? "boss2_met"];
    boss2_defeated = map[? "boss2_defeated"];
    boss3_met = map[? "boss3_met"];
    visited_rooms = ds_map_create();
    coined_rooms = ds_map_create();
    ds_map_copy(visited_rooms, map[? "visited_rooms"]);
    ds_map_copy(coined_rooms, map[? "coined_rooms"]);
  }
  ds_map_destroy(map);
  room_goto(target_room);
}
