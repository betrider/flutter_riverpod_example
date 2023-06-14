import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/stateProvider/sample_state_provider.dart';

final sampleProvider1 = Provider<String>(
  (ref) {
    return 'betrider';
  },
  name: 'sampleProvider1',
);

final sampleProvider2 = Provider<String>((ref) {
  throw UnimplementedError();
});

final sampleProvider3 = Provider<String>((ref) {
  var aa = ref.watch(sampleStateProvider);
  return 'sampleProvider3($aa)';
});
