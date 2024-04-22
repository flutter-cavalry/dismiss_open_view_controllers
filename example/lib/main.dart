import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:dismiss_open_view_controllers/dismiss_open_view_controllers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dismissOpenViewControllersPlugin = DismissOpenViewControllers();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: OutlinedButton(
          onPressed: () async {
            await Future.wait(
                [_presentImagePicker(), _dismissAllControllers()]);
          },
          child: const Text(
              'Present a file picker controller and dismiss it after 3 secs.'),
        )),
      ),
    );
  }

  Future<void> _presentImagePicker() async {
    final file = await openFile();
    print('picker result: $file');
  }

  Future<void> _dismissAllControllers() async {
    await Future.delayed(const Duration(seconds: 3));
    await _dismissOpenViewControllersPlugin.dismiss(isAnimated: true);
    print('dismissed all controllers.');
  }
}
