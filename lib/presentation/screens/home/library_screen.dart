import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> historyData = [
      {"title": "Insta Empire", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "Divya Naag Garuda Yodha", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "Zero Cultivation", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "Zombie Warriors", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "The Invincible Warriors", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
    ];
    List<Map<String, dynamic>> myListData = [
      {"title": "Insta Empire 2", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "Divya Naag Garuda Yodha 2", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "Zero Cultivation 2", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "Zombie Warriors 2", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
      {"title": "The Invincible Warriors 2", "description": "Description", "thumbnail": "assets/images/thumbnail.png"},
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Library',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  child: Center(
                    child: Text('History'),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text('My List'),
                  ),
                ),
              ]
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _historyTab(historyData),
                  _myListTab(myListData),
                  Text("2"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
Widget _historyTab(List<Map<String, dynamic>> historyData) {
  return ListView.builder(
    itemCount: historyData.length,
    itemBuilder: (context, index) {
      final entry = historyData[index];
      return ListTile(
        // leading: Image.asset("assets/images/thumbnail.png"),
        title: Text(entry['title']),
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(entry['title']),
                          subtitle: Text(entry['description']),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.remove_red_eye_outlined),
                          title: Text('Read Now'),
                        ),
                        ListTile(
                          leading: Icon(Icons.menu),
                          title: Text('More Info'),
                        ),
                        ListTile(
                          leading: Icon(Icons.remove_circle_outline),
                          title: Text('Remove from Library'),
                        ),
                      ],
                    );
                  }
                );
              }
            );
          },
          icon: Icon(Icons.more_vert)
        ),
      );
    },
  );
}

Widget _myListTab(List<Map<String, dynamic>> myListData) {
  return ListView.builder(
    itemCount: myListData.length,
    itemBuilder: (context, index) {
      final entry = myListData[index];
      return ListTile(
        // leading: Image.asset(entry['thumbnail']),
        title: Text(entry['title']),
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(entry['title']),
                          subtitle: Text(entry['description']),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.remove_red_eye_outlined),
                          title: Text('Read Now'),
                        ),
                        ListTile(
                          leading: Icon(Icons.menu),
                          title: Text('More Info'),
                        ),
                        ListTile(
                          leading: Icon(Icons.remove_circle_outline),
                          title: Text('Remove from Library'),
                        ),
                      ],
                    );
                  }
                );
              }
            );
          },
          icon: Icon(Icons.more_vert),
        ),
      );
    }
  );
}