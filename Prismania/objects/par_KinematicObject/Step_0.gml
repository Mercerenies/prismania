
var bt = ctrl_BulletTimeManager.global_speed_multiplier;

var xprev = x;
var yprev = y;

x += velocity_x * bt;
y += velocity_y * bt;

// Gravity
velocity_y += GRAVITY_CONSTANT * bt;

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
}
