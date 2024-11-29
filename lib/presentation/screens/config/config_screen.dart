import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcial/presentation/widgets/drawer.dart';
import 'package:parcial/providers/theme_provider.dart';

class ConfigScreen extends ConsumerWidget {
    static const name = "config_screen";
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final int value = ref.watch(selectColorProvider);
    final List<Color> listColor = ref.watch(colorListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Config'),),
      drawer: Menu(),
      body: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: listColor.asMap().entries.map((entry){
              int index =entry.key;
              Color res = entry.value;
              return RadioListTile(
                title: Text("Colors"),
                value: res, 
                groupValue: listColor[value], 
                onChanged: (Color? value){
                  ref.read(selectColorProvider.notifier).state = 
                  listColor.indexOf(value!);
                }
                );
            }).toList(),
          )
        ],
      ),
    );
  }
}