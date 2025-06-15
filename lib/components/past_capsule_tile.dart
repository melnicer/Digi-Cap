import 'package:digi_cap/pages/home_page.dart';
import 'package:digi_cap/pages/view_past_capsule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/time_capsule.dart';

class PastCapsuleTile extends StatelessWidget {
  String title;
  String content;
  String creationDate;
  String openDate;
  Function(BuildContext)? delete;
  PastCapsuleTile({
    super.key,
    required this.title,
    required this.content,
    required this.creationDate,
    required this.openDate,
    required this.delete,
  });

  String truncatedText(String text, int maxChars) {
    if (text.length <= maxChars) {
      return text;
    } else {
      return text.substring(0, maxChars) + '...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 25.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: delete,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ],
          ),
          child: Container(
            height: 65,
            width: 360,
            decoration: BoxDecoration(
              color: Color(0xFF343A40),
              borderRadius: BorderRadius.circular(8.0),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Image.asset("lib/images/tc-green-32.png"),
                ),
                Text(
                  truncatedText(title, 25),
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    openDate,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
