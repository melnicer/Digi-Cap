import 'package:digi_cap/model/time_capsule.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewPastCapsule extends StatelessWidget {
  TimeCapsule pastCapsule;
  ViewPastCapsule({super.key, required this.pastCapsule});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 350,
              child: Text(
                pastCapsule.getTitle(),
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 350,
                child: Text(
                  pastCapsule.getContent(),
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 40.0),
              width: 185,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Made on: ",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    pastCapsule.getCreationDate(),
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
