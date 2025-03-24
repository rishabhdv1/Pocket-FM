import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayPodcastScreen extends StatefulWidget {
  final Map<String, dynamic> book;
  const PlayPodcastScreen({super.key, required this.book});

  @override
  State<PlayPodcastScreen> createState() => _PlayPodcastScreenState();
}

class _PlayPodcastScreenState extends State<PlayPodcastScreen> {
  List<Map<String, dynamic>> menuData = [
    {"title": "Speed", "speed": "1.75x", "icon": Icons.speed, "route": ""},
    {"title": "Sleep timer", "icon": Icons.dark_mode_outlined, "route": ""},
    {"title": "Share", "icon": Icons.ios_share, "route": ""},
    {"title": "Video Quality", "quality": "Auto", "icon": Icons.desktop_windows_outlined, "route": ""},
    {"title": "Car Mode", "icon": Icons.car_crash_rounded, "route": ""},
  ];

  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _isLoading = true;
  String? _errorMessage;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudio();
    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() => _isPlaying = false);
      }
    });
    _audioPlayer.positionStream.listen((position) {
      setState(() => _position = position);
    });
    _audioPlayer.durationStream.listen((duration) {
      setState(() => _duration = duration ?? Duration.zero);
    });
  }

  Future<void> _initAudio() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
      
      final audioUrl = widget.book['audio_url'] ?? '';
      if (audioUrl.isEmpty) {
        throw Exception('Audio URL is empty');
      }
      
      await _audioPlayer.setUrl(audioUrl);
      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load audio: ${e.toString()}';
      });
    }
  }

  void _togglePlayPause() async {
    if (_isLoading) return;
    
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
      setState(() => _isPlaying = false);
    } else {
      await _audioPlayer.play();
      setState(() => _isPlaying = true);
    }
  }

  void _seekForward() async {
    final newPosition = _position + const Duration(seconds: 10);
    if (newPosition < _duration) {
      await _audioPlayer.seek(newPosition);
    } else {
      await _audioPlayer.seek(_duration);
    }
  }

  void _seekBackward() async {
    final newPosition = _position - const Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      await _audioPlayer.seek(newPosition);
    } else {
      await _audioPlayer.seek(Duration.zero);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.withValues(alpha: 0.2),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),icon: const Icon(Icons.keyboard_arrow_down
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Bluetooth and Connectivity",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          const Divider(),
                          const ListTile(
                            minTileHeight: 20,
                            title: Text("Current Device"),
                          ),
                          ListTile(
                            leading: const Icon(Icons.phone_android_rounded),
                            title: Text(
                              "This Phone",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.mobile_screen_share),
                            title: Text(
                              "Allow bluetooth permission",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            subtitle: const Text("Go to Settings and allow 'Nearby devices' to pair and play your favourite audio series"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)
                                )
                              ),
                              onPressed: () {},
                              child: const SizedBox(
                                width: double.infinity,
                                child: Center(child: Text("Go to Settings")),
                              )
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                );
              },
              icon: const Icon(Icons.mobile_screen_share),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: menuData.length,
                        itemBuilder: (context, index) {
                          final entry = menuData[index];
                          return ListTile(
                            leading: Icon(entry['icon']),
                            trailing: Text(entry['speed'] ?? ''),
                            title: Text("${entry['title']}"),
                            onTap: () {},
                          );
                        }
                      ),
                    );
                  }
                );
              },
              icon: const Icon(Icons.more_vert),
            )
          ],
          // backgroundColor: Colors.blue.withOpacity(0.2),
          
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue.withValues(alpha: 0.2), Colors.transparent],
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
                            widget.book['image'] ?? "N/A",
                            width: 250,
                            errorBuilder: (context, error, stackTrace) => 
                              const Icon(Icons.error_outline, size: 250),
                          ),
                        ),
                        const SizedBox(height: 10),
                        if (_errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _errorMessage!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ListTile(
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                              "${widget.book['image']}",
                              errorBuilder: (context, error, stackTrace) => 
                                const Icon(Icons.error_outline),
                            ),
                          ),
                          title: Text(widget.book['title'] ?? 'N/A'),
                          subtitle: Text(widget.book['title'] ?? 'N/A'),
                          trailing: Container(
                            color: Colors.grey.withValues(alpha: 0.2),
                            child: const SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(child: Icon(Icons.check_circle_outline)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: const Center(
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
                                child: const Center(
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
                                child: const Center(
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
                                child: const Center(
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
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Slider(
                              value: _position.inSeconds.toDouble(),
                              min: 0,
                              max: _duration.inSeconds.toDouble(),
                              onChanged: (value) async {
                                await _audioPlayer.seek(Duration(seconds: value.toInt()));
                              },
                              thumbColor: Colors.transparent,
                              activeColor: Colors.blue,
                              inactiveColor: Colors.grey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_formatDuration(_position)),
                                Text(_formatDuration(_duration)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_previous_rounded,size: 40),
                            ),
                            IconButton(
                              onPressed: _seekBackward,
                              icon: Icon(Icons.replay_10,size: 40),
                            ),
                            IconButton(
                              onPressed: _togglePlayPause,
                              icon: Icon(
                                _isPlaying ? Icons.pause_circle : Icons.play_circle,size: 60
                              ),
                            ),
                            IconButton(
                              onPressed: _seekForward,
                              icon: Icon(Icons.forward_10,size: 40),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.skip_next_rounded,size: 40),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: Colors.red,
                        tabs: [
                          Tab(child: Text('Chapters')),
                          Tab(child: Text('Reviews')),
                        ]
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ListView.builder(
                              itemCount: widget.book['chapters'].length ?? 0,
                              itemBuilder: (context, index) {
                                final chapter = widget.book['chapters'][index];
                                return ListTile(
                                  leading: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      "${widget.book['image']}",
                                      errorBuilder: (context, error, stackTrace) => 
                                        const Icon(Icons.error_outline),
                                    ),
                                  ),
                                  title: Text(
                                    chapter['title'],
                                  ),
                                  subtitle: Text(widget.book['title'] ?? 'N/A'),
                                  trailing: Icon(Icons.lock_clock_rounded),
                                  // title: Text("Ch - ${index + 1}"),
                                );
                              }
                            ),
                            _buildAllReviewsView(),
                          ]
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildAllReviewsView() {
  // Collect all reviews from all chapters
  final allReviews = <Map<String, dynamic>>[];
  
  for (final chapter in widget.book['chapters'] ?? []) {
    if (chapter['reviews'] != null && chapter['reviews'].isNotEmpty) {
      for (final review in chapter['reviews']) {
        allReviews.add({
          ...review,
          'chapterTitle': chapter['title'] ?? 'Unknown Chapter',
        });
      }
    }
  }

  return allReviews.isEmpty
    ? Center(
        child: Text(
          "No reviews yet",
          style: TextStyle(color: Colors.grey),
        ),
      )
      : ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            final review = allReviews[index];
            return Column(
              children: [
                ListTile(
                  /* 
                  CircleAvatar(
                    child: Text(review['user_name']?.substring(0, 1) ?? '?'),
                  )
                  */
                  leading: CircleAvatar(
                    child: Image.network(
                      "N/A",
                    ),
                  ),
                  title: Text("${review['user_name']} • 1yr ago"),
                  subtitle: Text(
                    review['chapterTitle'],
                    style: TextStyle(fontSize: 12),
                  ),
                  /* subtitle: Text(
                    "⭐⭐⭐⭐⭐",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ), */
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
                    review['comment'] ?? 'No comment provided',
                    style: TextStyle(color: Colors.grey,),
                  ),
                ),
                Divider()
              ],
            );
          }
        );
    }
}