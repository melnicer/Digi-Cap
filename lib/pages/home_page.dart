import 'package:digi_cap/pages/create_page.dart';
import 'package:digi_cap/pages/locked_page.dart';
import 'package:digi_cap/pages/unlocked_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/bottom_nav_bar.dart';
import '../model/capsule_db_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = [CreatePage(), UnlockedPage(), LockedPage()];

  void navigateBottomBar(int index) {
    if (index == 1 || index == 2) {
      Provider.of<CapsuleDbManager>(
        context,
        listen: false,
      ).sortAndMoveExpiredCapsules();
    }
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: 110,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFF495057),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "Digi Cap",
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavBar(
        // Custom Bottom Nav Bar
        onTabChange:
            (index) => navigateBottomBar(
              index,
            ), // Passing an arrow function as parameter
      ),
    );
  }
}
