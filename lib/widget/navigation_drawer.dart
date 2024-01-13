import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(250),
      ),
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text('Mis comidas'),
            ),
            ListTile(
              title: const Text('Home'),
              //selected: _selectedIndex == 0,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              //selected: _selectedIndex == 1,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              //selected: _selectedIndex == 2,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
