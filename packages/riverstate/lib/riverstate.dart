library riverstate;

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension InvokeWidget on WidgetRef {
  void act<T extends Object>(StateProvider<T> action, [T? value]) {
    if (value != null) {
      read(action).state = value;
    } else {
      // Trigger update anyways
      read(action).state = read(action).state;
    }
  }

  void actN<T extends Object>(StateProvider<T?> action, [T? value]) {
    read(action).state = value;
  }
}
