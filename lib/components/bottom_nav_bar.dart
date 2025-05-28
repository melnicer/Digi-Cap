import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)?
  onTabChange; // Accepts a function that accepts int as parameter and returns void. ? means nullable
  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBorderRadius: 16,
          tabBackgroundColor: Colors.grey.shade100,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChange:
              (value) => onTabChange!(
                value,
              ), // Value is index of each GButton, ! means it's not null
          tabs: [
            GButton(icon: Icons.draw),
            GButton(icon: Icons.lock_open),
            GButton(icon: Icons.lock),
          ],
        ),
      ),
    );
  }
}
