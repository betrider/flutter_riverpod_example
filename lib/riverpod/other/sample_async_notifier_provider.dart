import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleAsyncNotifierProvider = AsyncNotifierProvider<CounterAsyncNotifier, int>(() {
  return CounterAsyncNotifier();
});

class CounterAsyncNotifier extends AsyncNotifier<int> {

  @override
  FutureOr<int> build() async{
    await Future.delayed(const Duration(seconds: 3));
    return 123;
  }

  void addSuccess1() async{
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 3));
    state = await AsyncValue.guard(() async {
      var data = state.value!;
      return data + 1;
    });
  }

  void addSuccess2() async{
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 3));
    try {
      var data = state.value!;
      throw '오류났어용';
      // ignore: dead_code
      state = AsyncValue.data(data + 1);
    } catch (err, stack) {
      state = AsyncValue.error(err, stack);
    }
  }

}
