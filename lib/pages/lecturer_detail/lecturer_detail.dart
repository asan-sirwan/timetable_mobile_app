import 'package:flutter/material.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

import 'components/lecturer_detail_body.dart';

class LecturerDetail extends StatelessWidget {
  const LecturerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        title: const Text(
          'Lecturer Detail',
          style: TextStyle(
            fontSize: kTitleTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kGray,
        centerTitle: true,
      ),
      body: SafeArea(
        child: LecturerDetailBody(lecturerId: arguments['lecturerId']),
      ),
    );
  }
}
