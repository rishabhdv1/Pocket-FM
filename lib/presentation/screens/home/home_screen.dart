import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Sample book data
  final List<Map<String, dynamic>> categories = [
    {
      "category_name": "Continue Reading for 'UserName'",
      "content": [
        {
          "title": "Insta Empire",
          "author": "J.D. Salinger",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Divya Naag Garuda Yoddha",
          "author": "George Orwell",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Zero Cultivation",
          "author": "Harper Lee",
          "image": "assets/images/thumbnail.png",
        },
      ],
    },
    {
      "category_name": "Popular on Pocket Novels",
      "content": [
        {
          "title": "Ek Ladki Ko Dekha To",
          "author": "J.D. Salinger",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Insta Empire",
          "author": "George Orwell",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Malang",
          "author": "Harper Lee",
          "image": "assets/images/thumbnail.png",
        },
      ],
    },
    {
      "category_name": "Eastern Fantasy",
      "content": [
        {
          "title": "The Catcher in the Rye",
          "author": "J.D. Salinger",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "1984",
          "author": "George Orwell",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "To Kill a Mockingbird",
          "author": "Harper Lee",
          "image": "assets/images/thumbnail.png",
        },
      ],
    },
  ];

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
            onPressed: () {},
            icon: Icon(Icons.search, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.language, size: 30),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final catContent = categories[index]['content'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                minTileHeight: 20,
                contentPadding: EdgeInsets.only(
                  left: 8,
                ),
                title: Text(
                  '${cat['category_name']}',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios_rounded)
                ),
              ),
              SizedBox(
                height: 235,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catContent.length,
                  itemBuilder: (context, bookIndex) {
                    final book = catContent[bookIndex];
                    return _buildBookCard(book);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBookCard(Map<String, String> book) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 155,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(book["image"]!, fit: BoxFit.cover),
            ),
            const SizedBox(height: 10),
            Text(
              book["title"]!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              book["author"]!,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
