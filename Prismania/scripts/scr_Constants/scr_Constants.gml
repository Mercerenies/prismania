
#macro GAMESPEED 60
#macro INACTIVE_CRYSTAL_COLOR $b93081
#macro ACTIVE_CRYSTAL_COLOR $ead42d
#macro GRAVITY_CONSTANT 1.2
#macro ARROW_GRAVITY_CONSTANT (GRAVITY_CONSTANT / 6)
#macro BULLET_TIME_SPEED_MULTIPLIER 0.1
#macro PLAYER_PERSONAL_CRYSTAL_RADIUS 80
#macro FILENAME "savegame_prismania.json"

// Can be used as a bitmask.
enum World {
  NONE = 0,
  REGULAR = 1,
  MIRROR = 2,
}

enum AttackType {
  PLAYER = 0,
  NEUTRAL = 1,
  ENEMY = 2,
}

enum DialogueMugshot {
  PROFESSOR = 0,
  GENERAL = 1,
  KING = 2,
  OLD_GENERAL = 3, // Unused, old artwork
}
