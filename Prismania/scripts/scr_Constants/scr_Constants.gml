
#macro GAMESPEED 60
#macro INACTIVE_CRYSTAL_COLOR $b93081
#macro ACTIVE_CRYSTAL_COLOR $ead42d
#macro GRAVITY_CONSTANT 1.2
#macro ARROW_GRAVITY_CONSTANT (GRAVITY_CONSTANT / 6)
#macro BULLET_TIME_SPEED_MULTIPLIER 0.1

// Can be used as a bitmask.
enum World {
  REGULAR = 1,
  MIRROR = 2,
}

enum AttackType {
  PLAYER = 0,
  NEUTRAL = 1,
  ENEMY = 2,
}
