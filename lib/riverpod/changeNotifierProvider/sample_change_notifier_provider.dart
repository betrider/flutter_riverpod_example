import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleChangeNotifierProvider = ChangeNotifierProvider<CountProvider>((ref) {
  return CountProvider();
});

class CountProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  add() {
    _count++;
    notifyListeners();
  }

  remove() {
    _count--;
    notifyListeners();
  }
}
