import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_mobile_app/utils/routes.dart';
import 'package:timetable_mobile_app/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String initialRoute = prefs.containsKey('studentId') ? '/' : '/login';

  Widget app = MaterialApp(
    title: 'Student Timetable',
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    routes: appRoutes,
    initialRoute: initialRoute,
  );

  runApp(app);
}
