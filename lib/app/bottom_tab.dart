// app/bottom_tab.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/videos')) return 1;
    return 0; // Mặc định là tab "Audios"
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      context.go('/home'); // Chuyển đến trang Home
    } else if (index == 1) {
      context.go('/videos'); // Chuyển đến trang Videos
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = _getSelectedIndex(context);

    return Scaffold(
      body: const SizedBox(), // GoRouter sẽ xử lý phần hiển thị nội dung
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => _onItemTapped(context, index),
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
    );
  }
}
