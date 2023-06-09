
// Note: This object and par_SolidKinematicObject delegate to
// scr_KinematicObject for all events. In principle, these
// objects share a common parent, but Game Maker does not
// support multiple inheritance, so we sort of pretend.
//
// This means you should never check for collisions against
// par_KinematicObject, since you will miss solid kinematic
// objects if you do so.

event_inherited();
createKinematicObject();