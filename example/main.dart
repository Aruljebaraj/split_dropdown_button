import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:split_dropdown_button/Button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Split Dropdown Example')),
        body: Center(
          child: SplitDropdownButton(
            prefixIcon: const Icon(Icons.ac_unit),
            suffixIcon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.white,
            ),
            options: const ['Apple', 'Banana', 'Cherry'],
            onSelected: (value) {
              log('Selected value: $value');
            },
            onMainButtonPressed: (val) {
              log(val);
            },
          ),
        ),
      ),
    );
  }
}
