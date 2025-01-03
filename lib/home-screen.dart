import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/src/framework.dart';

final StateProvider<int> counterProvider = StateProvider<int>((ref) {
  return 0;
});

final StateProvider<bool> switchProvider = StateProvider<bool>((ref) {
  return false;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build");
    return Scaffold(
      body: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Text(
                ref.watch(counterProvider).toString(),
                style: TextStyle(fontSize: 30),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) => Switch(
              value: ref.watch(switchProvider),
              onChanged: (value) {
                ref.read(switchProvider.notifier).state = value;
              },
            ),
          ),
          Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state++;
                  },
                  icon: Icon(Icons.add)),
              IconButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).state--;
                  },
                  icon: Icon(Icons.remove))
            ],
          )
        ],
      ),
    );
  }
}
