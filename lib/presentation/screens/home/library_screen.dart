import 'package:flutter/material.dart';
import 'package:pocket_fm/presentation/screens/home/audio_list_detail_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> historyData = [
      {
        "status": true,
        "data": [
          {
            "id": "1",
            "title": "Insta Empire",
            "title_hi": "इंस्टा एम्पायर",
            "description_hi": "A book summary on habits.",
            "description_en": "A book summary on habits.",
            "image_url": "https://d2wxtuh5s9v3ty.cloudfront.net/shows/media_5cb31cf0ba1860c4cd2f984b135d10c84e4650c3.webp",
            "author_name": "James Clear",
            "audio_url": "https://example.com/audio1.mp3",
            "category": "Self-help",
            "duration": "1200",
            "created_at": "2025-03-23 10:37:53",
            "chapters": [
              {"id": "1", "title": "Ch 1 - The Dreamer", "views": "45k"},
              {"id": "2", "title": "Ch 2 - The Quest Begins", "views": "45k"},
              {"id": "3", "title": "Ch 3 - The Final Battle", "views": "90k"},
            ]
          },
          {
            "id": "2",
            "title": "Divya Naag Garuda Yodha",
            "title_hi": "दिव्य नाग गरुड योद्धा",
            "description_hi": "A short story about dreams.",
            "description_en": "A short story about dreams.",
            "image_url": "assets/images/thumbnail.png",
            "author_name": "Paulo Coelho",
            "audio_url": "https://example.com/audio2.mp3",
            "category": "Motivation",
            "duration": "1800",
            "created_at": "2025-03-23 10:37:53",
            "chapters": [
              {"id": "1", "title": "Ch 1 - The Dreamer", "views": "45k"},
              {"id": "2", "title": "Ch 2 - The Quest Begins", "views": "45k"},
              {"id": "3", "title": "Ch 3 - The Final Battle", "views": "90k"},
            ]
          },
          {
            "id": "3",
            "title": "Zero Cultivation",
            "title_hi": "ज़ीरो कल्टीवेशन",
            "description_hi": "A book summary on habits.",
            "description_en": "A book summary on habits.",
            "image_url": "assets/images/thumbnail.png",
            "author_name": "James Clear",
            "audio_url": "https://example.com/audio1.mp3",
            "category": "Self-help",
            "duration": "1200",
            "created_at": "2025-03-23 10:37:53",
            "chapters": [
              {"id": "1", "title": "Ch 1 - The Dreamer", "views": "45k"},
              {"id": "2", "title": "Ch 2 - The Quest Begins", "views": "45k"},
              {"id": "3", "title": "Ch 3 - The Final Battle", "views": "90k"},
            ]
          },
          {
            "id": "4",
            "title": "Zombie Warriors",
            "title_hi": "ज़ोंबी वारियर्स",
            "description_hi": "A short story about dreams.",
            "description_en": "A short story about dreams.",
            "image_url": "assets/images/thumbnail.png",
            "author_name": "Paulo Coelho",
            "audio_url": "https://example.com/audio2.mp3",
            "category": "Motivation",
            "duration": "1800",
            "created_at": "2025-03-23 10:37:53",
            "chapters": [
              {"id": "1", "title": "Ch 1 - The Dreamer", "views": "45k"},
              {"id": "2", "title": "Ch 2 - The Quest Begins", "views": "45k"},
              {"id": "3", "title": "Ch 3 - The Final Battle", "views": "90k"},
            ]
          },
          {
            "id": "5",
            "title": "The Invincible Warriors",
            "title_hi": "द इन्विंसिबल वारियर्स",
            "description_hi": "A short story about dreams.",
            "description_en": "A short story about dreams.",
            "image_url": "assets/images/thumbnail.png",
            "author_name": "Paulo Coelho",
            "audio_url": "https://example.com/audio2.mp3",
            "category": "Motivation",
            "duration": "1800",
            "created_at": "2025-03-23 10:37:53",
            "chapters": [
              {"id": "1", "title": "Ch 1 - The Dreamer", "views": "45k"},
              {"id": "2", "title": "Ch 2 - The Quest Begins", "views": "45k"},
              {"id": "3", "title": "Ch 3 - The Final Battle", "views": "90k"},
            ]
          },
          {
            "id": "6",
            "title": "Brahmand Yoddha",
            "title_hi": "ब्रह्माण्ड योद्धा",
            "description_hi": "क्षितिज एक राजकुमार है छोटे राज्य नवांगन का जहा पर महाराज रणसिंह का राज था यह राज्य छोटा होते हुए भी सुखी और सम्पन्न था। लेकिन इस सुखी राज्य को किसी की नजर लग गई। उनके राज्य दो सौवी लेवल के ड्रैगन का हमला होता है और पूरा का पूरा राज्य मिट जाता है। लेकिन उसमे बच जाता है अकेली क्षितिज । फिर क्या ढूंढ पाएगा अपने परिवार ? और राज्य के कातिलों कों ? जानने के लिए सुनते रहिए \"Brahmand Yoddha\" सिर्फ \"Pocket FM\" पर।",
            "description_en": "This show may contain expletives, strong language, and mature content for adult listeners, including sexually explicit content and themes of violence. This is a work of fiction and any resemblance to real persons, businesses, places or events is coincidental. This show is not intended to offend or defame any individual, entity, caste, community, race, religion or to denigrate any institution or person, living or dead. Listener's discretion is advised.",
            "image_url": "https://d2wxtuh5s9v3ty.cloudfront.net/show_assets/media_be7584db56e812f8b34ae7df5a0713e98c7d4fed.webp",
            "author_name": "vaibhav bachhav",
            "audio_url": "https://example.com/audio2.mp3",
            "category": "Motivation",
            "duration": "1800",
            "created_at": "2025-03-23 10:37:53",
            "chapters": [
              {"id": "1", "title": "Ch 1 - Introduction", "views": "30k"},
              {"id": "2", "title": "Ch 2 - The Power of Habits", "views": "35k"},
              {"id": "3", "title": "Ch 3 - Creating Lasting Habits", "views": "55k"},
            ]
          }
        ]
      }
    ];

    List<Map<String, dynamic>> myListData = [
      {
        "status": true,
        "data": [
          {
            "id": "1",
            "title": "The Power of Habits 2",
            "description": "A book summary on habits.",
            "image_url": "https://example.com/image1.jpg",
            "author_name": "James Clear",
            "audio_url": "https://example.com/audio1.mp3",
            "category": "Self-help",
            "duration": "1200",
            "created_at": "2025-03-23 10:37:53"
          },
          {
            "id": "2",
            "title": "The Alchemist Story 2",
            "description": "A short story about dreams.",
            "image_url": "https://example.com/image2.jpg",
            "author_name": "Paulo Coelho",
            "audio_url": "https://example.com/audio2.mp3",
            "category": "Motivation",
            "duration": "1800",
            "created_at": "2025-03-23 10:37:53"
          }
        ]
      }
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Library',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert)
            )
          ],
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(child: Center(child: Text('History'))),
                Tab(child: Center(child: Text('My List'))),
              ]
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _bookListTab(historyData),
                  _bookListTab(myListData),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _bookListTab(List<Map<String, dynamic>> bookData) {
  if (bookData.isEmpty || bookData[0]['data'] == null) {
    return Center(child: Text("No books available"));
  }

  List<dynamic> books = bookData[0]['data'];

  return ListView.builder(
    itemCount: books.length,
    itemBuilder: (context, index) {
      final entry = books[index];
      final title = "${entry['title']} | ${entry['title_hi']}";
      return ListTile(
        leading: SizedBox(
          width: 50,
          height: 75,
          child: Image.network(entry['image_url']),
        ),
        title: Text(title),
        trailing: _modalWidget(context, entry, title),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AudioListDetailScreen(entry: entry)
            )
          );
        },
      );
    },
  );
}

Widget _modalWidget(BuildContext context, Map<String, dynamic> entry, title) {
  return IconButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 280,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(title),
                  subtitle: Text(entry['author_name']), // Fix incorrect key
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.remove_red_eye_outlined),
                  title: const Text('Read Now'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.menu),
                  title: const Text('More Info'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.remove_circle_outline),
                  title: const Text('Remove from Library'),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      );
    },
    icon: Icon(Icons.more_vert),
  );
}