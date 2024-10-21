import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maum_frontend/home_page.dart';
import 'package:maum_frontend/calendar.dart';
import 'package:maum_frontend/chat.dart';
import 'package:maum_frontend/mypage.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    Chat(),
    Calendar(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _children[_selectedIndex], // 현재 선택된 인덱스의 위젯을 보여줍니다.
      bottomNavigationBar: _selectedIndex == 1
          ? null
          : BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/home-icon.svg",
                        color: _selectedIndex == 0
                            ? Colors.black
                            : Color(0xff474747).withOpacity(0.5)),
                    label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/chat-icon.svg",
                        color: _selectedIndex == 1
                            ? Colors.black
                            : Color(0xff474747).withOpacity(0.5)),
                    label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/calendar-icon.svg",
                        color: _selectedIndex == 2
                            ? Colors.black
                            : Color(0xff474747).withOpacity(0.5)),
                    label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/mypage-icon.svg",
                        color: _selectedIndex == 3
                            ? Colors.black
                            : Color(0xff474747).withOpacity(0.5)),
                    label: ''),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
    );
  }
}
