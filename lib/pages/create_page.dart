import 'package:digi_cap/pages/write_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 240,
                  child: Text(
                    "What's on your mind?",
                    style: GoogleFonts.openSans(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Create a time capsule.",
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40),
                Image.asset("lib/images/tc-grey-128.png"),
              ],
            ),
          ),
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WritePage()),
                ),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFF343A40),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  "Create time capsule",
                  style: GoogleFonts.openSans(color: Color(0xFFF8F9FA)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
