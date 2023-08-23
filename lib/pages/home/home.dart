import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

import 'components/courses_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        title: const Text(
          'Student Timetable',
          style:
              TextStyle(fontSize: kTitleTextSize, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kGray,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();

              if (context.mounted) {
                Navigator.popAndPushNamed(context, '/login');
              }
            },
            icon: const FaIcon(FontAwesomeIcons.rightFromBracket),
          ),
        ],
      ),
      body: const SafeArea(
        child: CoursesList(),
      ),
    );
  }
}
