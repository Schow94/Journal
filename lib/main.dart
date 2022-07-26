/*
  Student: Stephen Chow
  Email: chowst@oregonstate.edu
  Course: CS492 - Mobile Software Development
  Last Updated: 7/20/22
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'db/database_manager.dart';

void main() async {
  // Allow these orientations on device
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  await DatabaseManager.initialize();
  runApp(const App());
}
