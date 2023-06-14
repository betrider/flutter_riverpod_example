import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleStateProvider = StateProvider<int>(
  (ref) {
    print('create sampleProvider2');

    ref.onResume(() {
      print('onResume');
    });

    ref.onAddListener(() {
      print('onAddListener');
    });

    ref.onCancel(() {
      print('onCancel');
    });

    ref.onDispose(() {
      print('onDispose');
    });

    ref.listenSelf((previous, next) {
      print('listenSelf previous:$previous next:$next');
    });

    return 55;
  },
  name: 'sampleProvider2',
);

int overrideState20(StateProviderRef<int> ref) {
  return 20;
}

int overrideState10(StateProviderRef<int> ref) {
  return 10;
}

final sampleStateProvider2 = StateProvider<List<String>>((ref) {
  return [];
});
