
function isShowingModal() {
  return instance_exists(par_Modal);
}

function showUpgradeBox(sprite, img_index, title_, text_) {
  with (instance_create_layer(room_width / 2, room_height / 2, "Instances_UI", obj_UpgradeBox)) {
    thumbnail_sprite = sprite;
    thumbnail_index = img_index;
    title = title_;
    text = text_;
  }
}

function showUpgradeBoxFor(upgrade_index) {
  var title = "";
  var text = "";
  switch (upgrade_index) {
  case 0: // Wall jump
    title = "Unlocked Wall Jump!";
    text = "Patented high-friction gloves allow you to hit W or SPACEBAR while sliding down a wall to bounce off it.";
    break;
  case 1: // Archery
    title = "Unlocked Archery!";
    text = "Prismankind's oldest ranged weapon. Use LEFT MOUSE to fire arrows at the mouse position.";
    break;
  case 2: // Bullet Time
    title = "Unlocked Bullet Time!";
    text = "Take a deep breath and focus. Drawing your bow slows time down.";
    break;
  case 3: // Double Jump
    title = "Unlocked Double Jump!";
    text = "Who needs a ground to jump? Now you can jump in the air an extra time with W or SPACEBAR.";
    break;
  case 4: // Crystal Core
    title = "Unlocked Crystal Core!";
    text = "Pick up portable crystals, and then hold RIGHT MOUSE to activate your own portable crystal core.";
    break;
  }
  showUpgradeBox(spr_PermanentUpgrade, upgrade_index, title, text);
}

function summonDia(dialogue_array) {
  with (instance_create_layer(room_width / 2, room_height - 4, "Instances_UI", obj_DiaBox)) {
    dia = dialogue_array;
  }
}
