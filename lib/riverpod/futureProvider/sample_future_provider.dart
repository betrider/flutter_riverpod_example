import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleFutureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 5;
});
