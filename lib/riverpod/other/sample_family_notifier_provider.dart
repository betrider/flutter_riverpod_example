import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleFamilyNotifierProvider = NotifierProvider.family<CounterFamilyNotifier, int, String>(() {
  return CounterFamilyNotifier();
});

class CounterFamilyNotifier extends FamilyNotifier<int, String> {
  @override
  int build(String arg) {
    return int.parse(arg);
  }

  void increment() {
    state++;
  }
}
