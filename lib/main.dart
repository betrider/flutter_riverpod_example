// ignore_for_file: invalid_use_of_protected_member, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_example/riverpod/futureProvider/sample_future_provider.dart';
import 'package:flutter_riverpod_example/riverpod/notifierProvider/sample_notifier_provider.dart';
import 'package:flutter_riverpod_example/riverpod/other/sample_async_notifier_provider.dart';
import 'package:flutter_riverpod_example/riverpod/other/sample_family_notifier_provider.dart';
import 'package:flutter_riverpod_example/riverpod/provider/sample_provider.dart';
import 'package:flutter_riverpod_example/riverpod/stateProvider/sample_state_provider.dart';
import 'package:flutter_riverpod_example/riverpod_observer.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0, // Number of method calls to be displayed
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

// ProviderScope 천장
// ref 위치

void main() {
  runApp(
    ProviderScope(
      observers: [RiverpodObserver()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ref.listen(sampleProvider2, (previous, next) {
    //   print('listen0 $previous -> $next');
    // });
    return MaterialApp(
      title: '리버팟 뽀개기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ProviderScopeView();
                    },
                  ),
                );
              },
              child: const Text('ProviderScope'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ReadAndWatchAndWatchView();
                    },
                  ),
                );
              },
              child: const Text('read & watch & select'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProviderScope(
                        overrides: [sampleProvider2.overrideWithValue('투썬')],
                        child: const ProviderView(),
                      );
                    },
                  ),
                );
              },
              child: const Text('provider'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const StateProviderView();
                    },
                  ),
                );
              },
              child: const Text('state provider'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FutureProviderView();
                    },
                  ),
                );
              },
              child: const Text('future provider'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AsyncProviderView();
                    },
                  ),
                );
              },
              child: const Text('async provider'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const FamilyProviderView();
                    },
                  ),
                );
              },
              child: const Text('family provider'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const OtherProviderView();
                    },
                  ),
                );
              },
              child: const Text('other provider'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProviderScopeView extends ConsumerWidget {
  const ProviderScopeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late WidgetRef lateRef1;
    late WidgetRef lateRef2;
    late WidgetRef lateRef3;
    // ref.listen(sampleProvider2, (previous, next) {
    //   print('listen1 $previous -> $next');
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProviderScope'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all()),
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Consumer(
          builder: (context1, ref1, child) {
            lateRef1 = ref1;
            return Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ref1.watch(sampleProvider1)),
                      Text(ref1.watch(sampleStateProvider).toString()),
                      const Divider(),
                      Text('scope:${ProviderScope.containerOf(context1).getAllProviderElements().length.toString()}'),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: ProviderScope.containerOf(context1).getAllProviderElements().length,
                        itemBuilder: (context, index) {
                          var element = ProviderScope.containerOf(context).getAllProviderElements().elementAt(index);
                          return Text(
                              '${element.provider.name} : ${element.provider.runtimeType}(${element.requireState})');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ProviderScope(
                      overrides: [sampleStateProvider.overrideWith(overrideState20)],
                      child: Consumer(
                        builder: (context2, ref2, child) {
                          lateRef2 = ref2;
                          return Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(ref1.watch(sampleProvider1)),
                                Text(ref1.watch(sampleStateProvider).toString()),
                                const Divider(),
                                Text(ref2.watch(sampleProvider1)),
                                Text(ref2.watch(sampleStateProvider).toString()),
                                const Divider(),
                                Text(
                                    'scope:${ProviderScope.containerOf(context2).getAllProviderElements().length.toString()}'),
                                ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: ProviderScope.containerOf(context2).getAllProviderElements().length,
                                  itemBuilder: (context, index) {
                                    var element =
                                        ProviderScope.containerOf(context2).getAllProviderElements().elementAt(index);
                                    return Text(
                                        '${element.provider.name} : ${element.provider.runtimeType}(${element.requireState})');
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: ProviderScope(
                                    overrides: [sampleStateProvider.overrideWith(overrideState10)],
                                    child: Consumer(
                                      builder: (context3, ref3, child) {
                                        lateRef3 = ref3;
                                        return Container(
                                          decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(ref1.watch(sampleProvider1)),
                                              Text(ref1.watch(sampleStateProvider).toString()),
                                              const Divider(),
                                              Text(ref2.watch(sampleProvider1)),
                                              Text(ref2.watch(sampleStateProvider).toString()),
                                              const Divider(),
                                              Text(ref3.watch(sampleProvider1)),
                                              Text(ref3.watch(sampleStateProvider).toString()),
                                              const Divider(),
                                              Text(
                                                  'scope:${ProviderScope.containerOf(context3).getAllProviderElements().length.toString()}'),
                                              ListView.builder(
                                                shrinkWrap: true,
                                                primary: false,
                                                itemCount:
                                                    ProviderScope.containerOf(context3).getAllProviderElements().length,
                                                itemBuilder: (context, index) {
                                                  var element = ProviderScope.containerOf(context3)
                                                      .getAllProviderElements()
                                                      .elementAt(index);
                                                  return Text(
                                                      '${element.provider.name} : ${element.provider.runtimeType}(${element.requireState})');
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            heroTag: '1',
            child: const Text('ref1'),
            onPressed: () {
              lateRef1.read(sampleStateProvider.notifier).update((state) => state + 1);
            },
          ),
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('ref2'),
            onPressed: () {
              lateRef2.read(sampleStateProvider.notifier).update((state) => state + 1);
            },
          ),
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('ref3'),
            onPressed: () {
              lateRef3.read(sampleStateProvider.notifier).update((state) => state + 1);
            },
          ),
        ],
      ),
    );
  }
}

class ReadAndWatchAndWatchView extends ConsumerWidget {
  const ReadAndWatchAndWatchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ReadAndWatchAndWatchView build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('read & watch & select'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                const Text('boolData'),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, child) {
                    print('boolData build');
                    return Text(
                      ref.watch(sampleNotifierProvider).boolData.toString(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(sampleNotifierProvider.notifier).updateBoolData();
                  },
                  child: const Text('update'),
                )
              ],
            ),
            const SizedBox(width: 4),
            const Divider(),
            const SizedBox(width: 4),
            Column(
              children: [
                const Text('intData'),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, child) {
                    print('intData build');
                    return Text(
                      ref.watch(sampleNotifierProvider).intData.toString(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(sampleNotifierProvider.notifier).updateIntData();
                  },
                  child: const Text('update'),
                )
              ],
            ),
            const SizedBox(width: 4),
            const Divider(),
            const SizedBox(width: 4),
            Column(
              children: [
                const Text('stringData'),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, child) {
                    print('stringData build');
                    return Text(
                      ref.watch(sampleNotifierProvider).stringData.toString(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(sampleNotifierProvider.notifier).updateStringData();
                  },
                  child: const Text('update'),
                )
              ],
            ),
            const Divider(),
            Column(
              children: [
                const Text('listData'),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, child) {
                    print('listData build');
                    return Text(
                      ref.watch(sampleNotifierProvider).listData.toString(),
                    );
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref.read(sampleNotifierProvider.notifier).updateListData();
                  },
                  child: const Text('update'),
                )
              ],
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }
}

class ProviderView extends ConsumerWidget {
  const ProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ref.watch(sampleProvider1),
            ),
            Text(
              ref.watch(sampleProvider2),
            ),
            Text(
              ref.watch(sampleProvider3),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '2',
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(sampleStateProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}

class StateProviderView extends ConsumerWidget {
  const StateProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(sampleStateProvider2);
    return Scaffold(
      appBar: AppBar(
        title: const Text('state provider'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Center(child: Text(data[index]));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '2',
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(sampleStateProvider2.notifier).update((state) {
            return [...state, DateTime.now().toString()];
          });
        },
      ),
    );
  }
}

class FutureProviderView extends ConsumerWidget {
  const FutureProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncData = ref.watch(sampleFutureProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('future provider'),
          centerTitle: true,
        ),
        body: asyncData.when(
          data: (data) {
            return Center(child: Text(data.toString()));
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}

class AsyncProviderView extends ConsumerWidget {
  const AsyncProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncData = ref.watch(sampleAsyncNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('async provider'),
        centerTitle: true,
      ),
      body: asyncData.when(
        data: (data) {
          return Center(child: Text(data.toString()));
        },
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '2',
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(sampleAsyncNotifierProvider.notifier).addSuccess1();
          // ref.read(sampleAsyncNotifierProvider.notifier).addSuccess2();
        },
      ),
    );
  }
}

class FamilyProviderView extends ConsumerWidget {
  const FamilyProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('family provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          ref.watch(sampleFamilyNotifierProvider('1050')).toString(),
        ),
      ),
    );
  }
}

class OtherProviderView extends ConsumerStatefulWidget {
  const OtherProviderView({super.key});

  @override
  ConsumerState<OtherProviderView> createState() => _OtherProviderViewState();
}

class _OtherProviderViewState extends ConsumerState<OtherProviderView> {
  @override
  void initState() {
    super.initState();
    ref.listenManual(sampleStateProvider, (previous, next) {
      print('initState listen $previous -> $next');
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(sampleStateProvider, (previous, next) {
      print('build listen $previous -> $next');
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('other provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              ref.watch(sampleStateProvider).toString(),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print(ref.exists(sampleStateProvider));
                  },
                  child: const Text('exists'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(sampleStateProvider);
                  },
                  child: const Text('invalidate'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var result = ref.refresh(sampleStateProvider);
                    print(result);
                  },
                  child: const Text('refresh'),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: '2',
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(sampleStateProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}
