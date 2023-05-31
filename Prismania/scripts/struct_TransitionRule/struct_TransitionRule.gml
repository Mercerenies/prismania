
function TransitionRule() constructor {

  static goto = function(player_y) {
    // Abstract function.
  }

}

function ConstantTransitionRule(room_id_, xx_, yy_) : TransitionRule() constructor {
  room_id = room_id_;
  xx = xx_;
  yy = yy_;

  static goto = function(player_y) {
    ctrl_UnlockedAbilities.spawn_x = xx;
    ctrl_UnlockedAbilities.spawn_y = yy;
    ctrl_UnlockedAbilities.respawn_x = xx;
    ctrl_UnlockedAbilities.respawn_y = yy;

    if (ctrl_UnlockedAbilities.respawn_x < 0) {
      ctrl_UnlockedAbilities.respawn_x += 32;
    }

    if (ctrl_UnlockedAbilities.respawn_x > room_width - 32) {
      ctrl_UnlockedAbilities.respawn_x -= 32;
    }

    room_goto(room_id);
  }

}

// Takes two different transition rules as arguments
function SplitTransitionRule(top_, bottom_) : TransitionRule() constructor {
  top = top_;
  bottom = bottom_;

  static goto = function(player_y) {
    if (player_y < room_height / 2) {
      top.goto(player_y);
    } else {
      bottom.goto(player_y);
    }
  }

}
