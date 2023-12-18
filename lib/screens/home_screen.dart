import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: ElevatedButton(
          onPressed: () => context.go('/details', extra: '1'),
          child: const Text('Next page')),
    );
  }
}
