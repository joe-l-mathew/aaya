import 'package:aaya/screens/bottom_sheet/activities/activites_screen.dart';
import 'package:aaya/screens/bottom_sheet/screens/add/add_screen.dart';
import 'package:aaya/screens/bottom_sheet/screens/home/home_screen.dart';
import 'package:aaya/screens/bottom_sheet/screens/search/search_screen.dart';
import 'package:aaya/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigatonScreen extends StatefulWidget {
  const BottomNavigatonScreen({super.key});

  @override
  State<BottomNavigatonScreen> createState() => _BottomNavigatonScreenState();
}

class _BottomNavigatonScreenState extends State<BottomNavigatonScreen> {
  int selectedIndex = 0;
  List<Widget> pageList = const [
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    ActivitiesScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (e) {
          setState(() {
            selectedIndex = e;
          });
        },
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? const Icon(Icons.home)
                  : const Icon(
                      Icons.home_outlined,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: selectedIndex == 0
                  ? const Icon(Icons.search)
                  : const Icon(
                      Icons.search_outlined,
                    ),
              label: "Search"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.post_add_outlined), label: "Add"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_outlined), label: "Activities"),
          BottomNavigationBarItem(
              icon: selectedIndex == 4
                  ? const Icon(Icons.person)
                  : const Icon(
                      Icons.person_2_outlined,
                    ),
              label: "Profile")
        ],
      ),
    );
  }
}
