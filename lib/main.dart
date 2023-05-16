import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  // runApp(const MaterialApp(home: MyApp())); //　MaterialAppで先にラップする
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) {
        showDialog<void>(
          context: context,
          builder: (context) => const SampleDialog(),
        );
      }
    });

    return const Scaffold(
      body: Center(
        child: MyWidget(),
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
