import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final int currentIndex;

  MyBottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11),
        child: GNav(
          selectedIndex: currentIndex, 
          backgroundColor: Colors.black,
          color: const Color(0xfff7f6f0),
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          padding: EdgeInsets.all(16),
          onTabChange: (index) {
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (index == 1) {
              Navigator.pushReplacementNamed(context, '/translate');
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, '/3dmodel');
            } else if (index == 3) {
              Navigator.pushReplacementNamed(context, '/chat');
            }
          },
          tabs: [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.scanner, text: 'Translate'),
            GButton(icon: Icons.square_foot_outlined, text: '3D Model'),
            GButton(icon: Icons.chat_bubble, text: 'Chat'),
          ],
        ),
      ),
    );
  }
}
