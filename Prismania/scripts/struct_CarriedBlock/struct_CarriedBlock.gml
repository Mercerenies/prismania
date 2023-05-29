
function CarriedBlock() constructor {

  static intoBlock = function(xx, yy) {
    // Abstract function
  }

  static onDraw = function(world, xx, yy) {
    // Abstract function
  }

}

function SmallCarriedBlock() : CarriedBlock() constructor {

  static intoBlock = function(xx, yy) {
    return instance_create_layer(xx - 16, yy - 16, "Instances", obj_SmallBlock);
  }

  static onDraw = function(world, xx, yy) {
    var spr = spr_SmallBlock;
    if (world == World.MIRROR) {
      spr = spr_SmallBlockMirrored;
    }
    draw_sprite(spr, 0, xx - 16, yy - 16);
  }

}
