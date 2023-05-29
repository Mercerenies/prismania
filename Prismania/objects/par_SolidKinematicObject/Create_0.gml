
// Note: This object and par_KinematicObject delegate to
// scr_KinematicObject for all events. In principle, these
// objects share a common parent, but Game Maker does not
// support multiple inheritance, so we sort of pretend.
//
// This means you should never check for collisions against
// par_SolidKinematicObject, since you will miss non-solid
// kinematic objects if you do so.

event_inherited();
createKinematicObject();