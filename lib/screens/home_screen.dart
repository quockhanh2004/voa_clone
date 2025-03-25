// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:voa_clone/screens/home_page/audio_page.dart';
import 'package:voa_clone/screens/home_page/video_page.dart';
import 'package:voa_clone/widgets/media_active.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const AudioPage(), const VideoPage()];
  final List<String> _pageLabels = ['Audios', 'Videos'];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageLabels[_selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(index: _selectedIndex, children: _pages),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const MediaActive(isDetailScreen: false),
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onTabSelected,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.headphones),
                label: 'Audios',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video),
                label: 'Videos',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
