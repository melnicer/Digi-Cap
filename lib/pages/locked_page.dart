import 'package:digi_cap/components/future_capsule_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/capsule_db_manager.dart';

class LockedPage extends StatefulWidget {
  const LockedPage({super.key});

  @override
  State<LockedPage> createState() => _LockedPageState();
}

class _LockedPageState extends State<LockedPage> {
  void deleteCapsule(int index) {
    Provider.of<CapsuleDbManager>(
      context,
      listen: false,
    ).deleteFutureCapsule(index);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CapsuleDbManager>(
      builder:
          (context, capsuleDbManager, child) => Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Locked Time Capsules",
                    style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                width: 390,
                height: 600,
                child: ListView.builder(
                  itemCount: capsuleDbManager.getFutureCapsulesLength(),
                  itemBuilder: (context, index) {
                    return FutureCapsuleTile(
                      futureCapsule:
                          capsuleDbManager.getFutureCapsules()[index],
                      delete: (_) {
                        setState(() {
                          deleteCapsule(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
    );
  }
}
