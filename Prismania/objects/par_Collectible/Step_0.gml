
if (isShowingModal()) {
  exit;
}

if (collidesWith(self, obj_Player)) {
  self.onCollect();
}
