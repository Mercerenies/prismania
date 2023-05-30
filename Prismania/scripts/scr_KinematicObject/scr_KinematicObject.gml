
function createKinematicObject() {

  _repelAwayFrom = function(collisions) {
    // Calculate average direction to the collided objects.
    var bt = ctrl_BulletTimeManager.global_speed_multiplier;
    var center_x = mean(bbox_left, bbox_right);
    var center_y = mean(bbox_top, bbox_bottom);
    var xx = 0;
    var yy = 0;
    for (var i = 0; i < ds_list_size(collisions); i++) {
      var c = collisions[| i];
      var collision_center_x1 = c.bbox_left; // max(bbox_left, c.bbox_left);
      var collision_center_y1 = c.bbox_top; // max(bbox_top, c.bbox_top);
      var collision_center_x2 = c.bbox_right; // min(bbox_right, c.bbox_right);
      var collision_center_y2 = c.bbox_bottom; // min(bbox_bottom, c.bbox_bottom);
      xx += (mean(collision_center_x1, collision_center_x2) - center_x);
      yy += (mean(collision_center_y1, collision_center_y2) - center_y);
    }
    if ((xx == 0) && (yy == 0)) {
      // If we're at the center of an object, just start floating up.
      yy += 0.2;
    }
    var length = sqrt(sqr(xx) + sqr(yy));
    xx /= length;
    yy /= length;
    // To avoid getting squished between two objects, put a slight bias on the upward direction.
    if (abs(yy) < 0.1) {
      yy += 0.2;
    }
    //show_debug_message(string(xx) + " " + string(yy));
    x -= bt * 3 * xx;
    y -= bt * 3 * yy;
  }

  onHitWall = function() {
    // Called when we hit a wall to the left or right.
  }

  velocity_x = 0;
  velocity_y = 0;

  repel_panic_timer = 0;

}

function stepKinematicObject() {

  var bt = ctrl_BulletTimeManager.global_speed_multiplier;

  var xprev = x;
  var yprev = y;

  x += velocity_x * bt;
  y += velocity_y * bt;

  // Gravity
  velocity_y += GRAVITY_CONSTANT * bt;

  var repelled = false;

  // Collisions
  if (collidesWith(self, par_Solid)) {
    var ycurrent = y;
    y = yprev;
    if (collidesWith(self, par_Solid)) {
      y = ycurrent;
      x = xprev;
      if (collidesWith(self, par_Solid)) {
        x = xprev;
        y = yprev;
        // Corner collision
        velocity_x = 0;
        velocity_y = 0;
        var lst = ds_list_create();
        getCollisions(self, par_Solid, lst);
        if (!ds_list_empty(lst)) {
          // If still inside, repel self away from the objects in question.
          _repelAwayFrom(lst);
          repel_panic_timer += bt;
          repelled = true;
        }
        ds_list_destroy(lst);
        onHitWall();
      } else {
        // X collision
        moveToCollision(self, sign(velocity_x) * 0.6, 0, par_Solid, 20);
        velocity_x = 0;
        onHitWall();
      }
    } else {
      // Y collision
      moveToCollision(self, 0, sign(velocity_y) * 0.6, par_Solid, 20);
      velocity_y = 0;
    }

    if (!repelled) {
      repel_panic_timer = 0;
    } else if (repel_panic_timer > 90) {
      // Avoiding softlocks in the most hacky way possible.
      while (collidesWith(self, par_Solid)) {
        y -= 4;
      }
      show_debug_message("Physics panic!");
      velocity_y = 0;
    }

  }

}
