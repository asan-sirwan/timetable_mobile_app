import 'package:flutter/material.dart';
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
      ),
      body: const SafeArea(
        child: CoursesList(),
      ),
    );
  }
}
