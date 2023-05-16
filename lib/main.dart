import 'package:flutter/material.dart';

void main() {
  // runApp(const MyApp());
  runApp(const MaterialApp(home: MyApp())); //　MaterialAppで先にラップする
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        showDialog<void>(
          context: context,
          builder: (context) => const SampleDialog(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello, World!',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class SampleDialog extends StatelessWidget {
  const SampleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(title: Text('This is sample'));
  }
}
