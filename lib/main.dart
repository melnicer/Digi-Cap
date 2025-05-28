import 'package:digi_cap/model/capsule_db_manager.dart';
import 'package:digi_cap/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CapsuleDbManager(),
      builder:
          (context, child) =>
              MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
