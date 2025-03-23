import 'package:flutter/material.dart';
import 'package:pocket_fm/presentation/screens/home/play_podcast_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLanguage = '';
  final List<Map<String, dynamic>> categories = [
    {
      "category_name": "Continue Reading for 'UserName'",
      "content": [
        {
          "title": "The New Avatar",
          "title_hi": "ड न्यू अवतार",
          "author": "J.D. Salinger",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Divya Naag Garuda Yoddha",
          "title_hi": "दिव्य नाग गरुड़ योद्धा",
          "author": "George Orwell",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Zero Cultivation",
          "title_hi": "जीरो कल्टीवेशन",
          "author": "Harper Lee",
          "image": "assets/images/thumbnail.png",
        },
      ],
    },
    {
      "category_name": "Popular on Pocket Novels",
      "content": [
        {
          "title": "Shivam : The Hidden Warrior",
          "title_hi": "शिवम् : ड हिडन वारियर",
          "author": "J.D. Salinger",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Insta Empire",
          "title_hi": "इन्स्टा एम्पायर",
          "author": "George Orwell",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "Malang",
          "title_hi": "मलंग",
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
          "title_hi": "द कैचर इन द रये",
          "author": "J.D. Salinger",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "1984",
          "title_hi": "१९८४",
          "author": "George Orwell",
          "image": "assets/images/thumbnail.png",
        },
        {
          "title": "To Kill a Mockingbird",
          "title_hi": "टू किल्ल अ मोकिंगबर्ड",
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Select your preferred language'),
                    content: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        _buildLanguageButton("हिंदी"),
                        _buildLanguageButton("English"),
                        _buildLanguageButton("Bengali"),
                        _buildLanguageButton("Tamil"),
                        _buildLanguageButton("Malyalam"),
                        _buildLanguageButton("Kannad"),
                        _buildLanguageButton("Odishi"),
                        _buildLanguageButton("Portugues"),
                      ],
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          // Close the dialog and perform search
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Close the dialog and perform search
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  );
                }
              );
            },
            icon: Icon(Icons.language, size: 30),
          ),
          Badge(
            label: Text("6"),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.whatshot, size: 30),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.network(
              "assets/images/thumbnail.png",
            ),
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
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return PlayPodcastScreen(book: book);
            }
          );
          /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlayPodcastScreen(book: book)
            )
          ); */
        },
        child: SizedBox(
          width: 155,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(book["image"]!, height: 150, width: 150, fit: BoxFit.cover),
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
      ),
    );
  }
  Widget _buildLanguageButton(String language) {
    bool isSelected = language == selectedLanguage;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey.shade300,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        fixedSize: Size(130, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedLanguage = language; // Update selected language
        });
      },
      child: Text(
        language,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}