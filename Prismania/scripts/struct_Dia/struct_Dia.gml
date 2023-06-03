
function Dia(mugshot_, text_, trigger_function_) constructor {
  mugshot = mugshot_;
  text = text_;
  trigger_function = trigger_function_;

  static onTrigger = function() {
    if (!is_undefined(trigger_function)) {
      trigger_function();
    }
  }

}