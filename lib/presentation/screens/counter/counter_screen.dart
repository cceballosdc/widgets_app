import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/counter_provider.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
              icon: isDarkMode
                  ? Icon(Icons.dark_mode_outlined)
                  : Icon(Icons.light_mode_outlined),
              onPressed: () {
                //ref.read(isDarkModeProvider.notifier).state = isDarkMode ? false : true;
                ref
                    .read(isDarkModeProvider.notifier)
                    .update((state) => !state);
              })
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          //ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}