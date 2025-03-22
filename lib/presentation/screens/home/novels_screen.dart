import 'package:flutter/material.dart';

class NovelsScreen extends StatelessWidget {
  const NovelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Novels Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: Text('Novels Screen'),
      ),
    );
  }
}