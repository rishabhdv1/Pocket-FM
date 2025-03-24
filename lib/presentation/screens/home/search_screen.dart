import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for Audio Series, Episodes or Peoples',
            suffixIcon: Icon(Icons.cancel_outlined),
          ),
        ),
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Search History"),
                TextButton(
                  onPressed: () {},
                  child: Text("Clear History"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      'assets/images/thumbnail.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text("Search History Item $index"),
                  subtitle: Text("402M • Rivansh"),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.cancel_outlined)
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}