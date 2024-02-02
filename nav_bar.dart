import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        
        backgroundColor: const Color(0xff262626),
        selectedItemColor: const Color(0xffF6C92B),
        selectedFontSize: 12,
        
        
        unselectedItemColor: const Color(0xffBDBDBD),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/vector1.png', width: 15.73, height: 21.0),
            label: '나의 목표',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/vector2.png', width: 21, height: 21.0),
            label: '도미노 플랜',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/vector3.png', width: 25, height: 25.0),
            label: '오늘의 도미노',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/vector4.png', width: 23, height: 23.0),
            label: '설정',
          ),
        ],
      );
  }
}