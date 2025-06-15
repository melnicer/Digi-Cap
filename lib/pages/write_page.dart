import 'package:digi_cap/components/dialog_box.dart';
import 'package:digi_cap/model/capsule_db_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/time_capsule.dart';

class WritePage extends StatefulWidget {
  const WritePage({super.key});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final TextEditingController capsuleTitle = TextEditingController();
  final TextEditingController capsuleContent = TextEditingController();
  DateTime? _selectedDate;
  String datePlaceholder = "SELECT DATE";

  Future<void> _pickDate() async {
    FocusScope.of(context).requestFocus(FocusNode());

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // default to today
      firstDate: DateTime(2000), // earliest selectable date
      lastDate: DateTime(2100), // latest selectable date
    );

    setState(() {
      if (picked != null) {
        _selectedDate = picked;
        datePlaceholder = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      }
    });
  }

  void lockCapsule() {
    TimeCapsule timeCapsule = TimeCapsule(
      title: capsuleTitle.text,
      content: capsuleContent.text,
      creationDate: DateTime.now(),
      openDate: _selectedDate,
    );
    Provider.of<CapsuleDbManager>(
      context,
      listen: false,
    ).addCapsule(timeCapsule);

    // Close the confirmation dialog first (DialogBox)
    Navigator.of(context).pop();

    // Show success dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF343A40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock, color: Colors.white, size: 40),
              SizedBox(height: 10),
              Text(
                "Time capsule successfully locked!",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the success dialog
                Navigator.of(context).pop(); // Go back to home page
              },
              child: Center(
                child: Text(
                  "OK",
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void askConfirmLockCapsule() {
    if (_selectedDate == null ||
        capsuleTitle.text.trim().isEmpty ||
        capsuleContent.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF343A40),
            content: SizedBox(
              width: 200,
              height: 35,
              child: Text(
                "Please write a title, message, and select a date.",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBox(lockCapsule: lockCapsule);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Container(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  maxLength: 50,
                  controller: capsuleTitle,
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Title here',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 14.0,
                  top: 10.0,
                ),
                height: 550,
                child: TextField(
                  controller: capsuleContent,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Message goes here',
                    floatingLabelBehavior:
                        FloatingLabelBehavior.always, // always float label
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _pickDate,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        datePlaceholder,
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.date_range),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: askConfirmLockCapsule,
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF343A40),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Lock time capsule",
                      style: GoogleFonts.openSans(color: Color(0xFFF8F9FA)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
