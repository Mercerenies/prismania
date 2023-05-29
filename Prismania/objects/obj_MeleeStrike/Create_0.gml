
event_inherited();

// This object's step event determines who it hits.
// After this object hits anything, this flag is set to true.
has_struck = false;

// NOT used for motion on the melee attack. This is only used to
// determine the knockback effect when we hit something.
attack_velocity_x = 0;
