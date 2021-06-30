import 'package:devquiz_nlw/secondApp/secondApp_state.dart';
import 'package:flutter/foundation.dart';

class SecondAppController{

  final stateNotifier = ValueNotifier<PressButtonState>(PressButtonState.unpressed);
  set state (PressButtonState state) => stateNotifier.value = state;
  PressButtonState get state => stateNotifier.value;


}