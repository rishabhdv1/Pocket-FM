import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pocket Novel',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.blue),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context, MaterialPageRoute(
              //     builder: (context) => BookListScreen()
              //   )
              // );
            },
            icon: Icon(Icons.search, size: 30),
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context, MaterialPageRoute(
              //     builder: (context) => BookListScreen()
              //   )
              // );
            },
            icon: Icon(Icons.language, size: 30),
          ),
        ],
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}