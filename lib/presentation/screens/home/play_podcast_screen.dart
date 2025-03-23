import 'package:flutter/material.dart';

class PlayPodcastScreen extends StatelessWidget {
  final Map<String, dynamic> book; // Receive book data


  const PlayPodcastScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final title = "${book['title']} | ${book['title_hi']}";
    final chapters = book['chapters'] as List<dynamic>?;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.keyboard_arrow_down)
          ),
          // ignore: deprecated_member_use
          backgroundColor: Colors.blue.withOpacity(0.2),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mobile_screen_share),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned(
            top: 0, // Start from the top of the screen
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2, // Half the screen height
              decoration: BoxDecoration(
                // Gradient from transparent to black (or any color you like)
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // ignore: deprecated_member_use
                  colors: [Colors.blue.withOpacity(0.2), Colors.transparent], // Customize the color and opacity
                ),
              ),
            ),
          ),
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(
                            book['image'] ?? "N/A",
                            width: 250,
                          ),
                        ),
                        SizedBox(height: 10),
                        ListTile(
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                              "${book['image']}",
                            ),
                          ),
                          title: Text(title),
                          subtitle: Text(book['title']),
                          trailing: Container(
                            // ignore: deprecated_member_use
                            color: Colors.grey.withOpacity(0.2),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(child: Icon(Icons.check_circle_outline)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.speed),
                                      Text("Speed (1.5x)"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.dark_mode_outlined),
                                      Text("Sleep timer"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.chat_bubble_outline_rounded),
                                      Text("15 Comments"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(Icons.file_download_outlined),
                                      Text("Download"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(thickness: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "01:13",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "09:03",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_previous_rounded,size: 50),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.replay_10,size: 50),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.play_circle,size: 50),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.forward_10,size: 50),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_next_rounded,size: 50),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        TabBar(
                          indicatorColor: Colors.red,
                          tabs: [
                            Tab(child: Text('Next Series')),
                            Tab(child: Text('Currentl Playing')),
                          ]
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        itemCount: chapters?.length,
                        itemBuilder: (context, index) {
                          if (chapters != null && index < chapters.length) {
                            var chapter = chapters[index];
                            return ListTile(
                              leading: SizedBox(
                                width: 80,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${index + 1}"),
                                    SizedBox(
                                      width: 50,
                                      height: 70,
                                      child: Image.network(book['image_url'] ?? "N/A"),
                                    ),
                                  ],
                                ),
                              ),
                              title: Text(chapter['title'] ?? "N/A"),
                              subtitle: Text("${chapter['views'] ?? "N/A"} | 1 yr ago"),
                              onTap: () {
                                // Handle chapter click (e.g., play audio)
                              },
                            );
                          } else {
                            return null;
                          }
                        }
                      ),
                      ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  child: Image.network(
                                    "N/A",
                                  ),
                                ),
                                title: Text("Review ${index + 1} • 1yr ago"),
                                subtitle: Text(
                                  "⭐⭐⭐⭐⭐",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                trailing: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Colors.red
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Lorem ipsum dolor sit amet, consect commod already tristique and nonummy just as it is in the form of a copy",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Divider()
                            ],
                          );
                        }
                      ),
                    ]
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
