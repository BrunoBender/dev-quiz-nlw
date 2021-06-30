
import 'package:flutter/foundation.dart';

class ChallengeController {
  final currenPageNotifier = ValueNotifier<int>(0);
  int get currentPage => currenPageNotifier.value;
  set currentPage(int value) => currenPageNotifier.value = value;

  int qtdRight = 0 ;
}