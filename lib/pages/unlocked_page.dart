import 'package:digi_cap/components/past_capsule_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/capsule_db_manager.dart';

class UnlockedPage extends StatefulWidget {
  const UnlockedPage({super.key});

  @override
  State<UnlockedPage> createState() => _UnlockedPageState();
}

class _UnlockedPageState extends State<UnlockedPage> {
  void deleteCapsule(int index) {
    Provider.of<CapsuleDbManager>(
      context,
      listen: false,
    ).getPastCapsules().removeAt(index);
  }

  final capsuleStream = Supabase.instance.client
      .from('capsules')
      .stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Consumer<CapsuleDbManager>(
      builder:
          (context, capsuleDbManager, child) => Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Unlocked Time Capsules",
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
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: capsuleStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final capsules = snapshot.data!;

                    return ListView.builder(
                      itemCount: capsules.length,
                      itemBuilder: (context, index) {
                        final capsule = capsules[index];
                        return PastCapsuleTile(
                          title: capsule['title'],
                          content: capsule['content'],
                          creationDate: capsule['created_at'],
                          openDate: capsule['open_at'],
                          delete: (_) {
                            setState(() {
                              deleteCapsule(index);
                            });
                          },
                        );
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
