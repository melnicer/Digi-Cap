import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget {
  VoidCallback lockCapsule;

  DialogBox({super.key, required this.lockCapsule});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF343A40),
      content: SizedBox(
        width: 200,
        height: 100,
        child: Column(
          children: [
            Text(
              "Locked time capsules can't be open until selected date.",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: lockCapsule,
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        "Lock",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
