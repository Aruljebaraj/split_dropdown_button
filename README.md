# split_dropdown_button

A customizable Flutter widget that separates the main button tap and dropdown action — ideal for adding more control to your dropdowns.

![Pub Version](https://img.shields.io/pub/v/split_dropdown_button) ![Platform](https://img.shields.io/badge/platform-flutter-blue)

## ✨ Features

- 🔘 Split tap and dropdown behavior
- 🎯 Customizable child widget
- 💻 Supports Android, iOS, and Web
- 🧱 Easy to integrate into existing UIs

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  split_dropdown_button: ^1.0.0


🚀 Quick Example

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


🤝 Contributing

Found a bug or want to improve this? PRs and issues are welcome. Let’s build together. 🙌
