import 'package:flutter/material.dart';

class NovelDashboard extends StatelessWidget {
  final Map<String, dynamic> book; // Receive book data


  const NovelDashboard({super.key, required this.book});

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
              icon: Icon(Icons.share),
            ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.check_circle),
                              label: Text("Library"),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                )
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu_book_sharp,
                                color: Colors.white,
                              ),
                              label: Text("Read Now"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headlineSmall,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "863k",
                                  ),
                                  Text(
                                    "Reads",
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Badge(
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    label: Text('4.0'),
                                  ),
                                  Text(
                                    "${book['duration'] ?? "N/A"} Reviews",
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.file_upload_outlined,
                                        color: Colors.blueAccent,
                                      ),
                                      Badge(
                                        backgroundColor: Colors.transparent,
                                        label: Icon(Icons.info_outline, size: 10),
                                        child: Text("0 Ch/Week"),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Updated 1mon ago",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          book['description_hi'] ?? "N/A",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10),
                        /* Text(
                          entry['description_en'],
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.start,
                        ) */
                        ListTile(
                          leading: CircleAvatar(
                            child: Image.network(
                              "N/A",
                            ),
                          ),
                          title: Text(book['author_name'] ?? "N/A"),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.red
                              ),
                            )
                          ),
                        ),
                        SizedBox(height: 10),
                        TabBar(
                          indicatorColor: Colors.red,
                          tabs: [
                            Tab(child: Text('Chapters')),
                            Tab(child: Text('Reviews')),
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
