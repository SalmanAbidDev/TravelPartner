import 'package:booking_application/bookings_screen/bookings_section.dart';
import 'package:booking_application/saved_screen/saved_section.dart';
import 'package:booking_application/search_screen/search_section.dart';
import 'package:booking_application/signin_screen/signin_section.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _sections = <Widget>[
    SearchSection(),
    SavedSection(),
    BookingsSection(),
    SignInSection(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: _sections[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purpleAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bagShopping),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.circleUser),
              label: 'Sign in',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700
          ),
          showUnselectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black45,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}