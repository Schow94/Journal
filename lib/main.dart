/*
  Student: Stephen Chow
  Email: chowst@oregonstate.edu
  Course: CS492 - Mobile Software Development
  Last Updated: 7/27/22
*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'db/database_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Allow these orientations on device
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);

  // Initialize single db instance
  await DatabaseManager.initialize();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Loading darkTheme from SharedPreferences
  bool darkTheme = prefs.getBool("dark") ?? false;

  // Single Instance of SharedPreferences so theme can persist
  runApp(App(darkTheme, prefs));
}
