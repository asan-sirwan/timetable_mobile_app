import 'package:flutter/material.dart';
import 'package:timetable_mobile_app/models/course.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

import 'components/course_detail_body.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    Course course = arguments['course'];

    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        title: const Text(
          'Course Detail',
          style: TextStyle(
            fontSize: kTitleTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kGray,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(kGap),
          child: DetailBody(course: course),
        ),
      ),
    );
  }
}
