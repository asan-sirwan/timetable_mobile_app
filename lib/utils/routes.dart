import 'package:flutter/material.dart';
import 'package:timetable_mobile_app/pages/course_detail/course_detail.dart';
import 'package:timetable_mobile_app/pages/home/home.dart';
import 'package:timetable_mobile_app/pages/lecturer_detail/lecturer_detail.dart';
import 'package:timetable_mobile_app/pages/login/login.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const Home(),
  '/login': (context) => const Login(),
  '/course-detail': (context) => const CourseDetail(),
  '/lecturer-detail': (context) => const LecturerDetail(),
};
