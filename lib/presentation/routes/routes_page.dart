import 'package:flutter/material.dart';
import 'package:pocket_fm/presentation/screens/home/audio_list_detail_screen.dart';
import 'package:pocket_fm/presentation/screens/home/play_podcast_screen.dart';

Map<String, WidgetBuilder> routesPage = {
  '/audio_details': (context) => AudioListDetailScreen(entry: {},),
  '/play_podcast': (context) => PlayPodcastScreen(book: {},),
};