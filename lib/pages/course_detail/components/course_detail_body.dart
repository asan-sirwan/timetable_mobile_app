import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timetable_mobile_app/components/detail_text.dart';
import 'package:timetable_mobile_app/models/course.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

class DetailBody extends StatefulWidget {
  const DetailBody({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailText(
          title: 'Course Name',
          body: widget.course.title!,
        ),
        DetailText(
          title: 'Course Description',
          body: widget.course.description!,
        ),
        DetailText(
          title: 'Course Date & Time',
          body: DateFormat('EEEE, MMM d. y\nhh:mm a')
              .format(DateTime.parse(widget.course.courseDateTime!))
              .toString(),
        ),
        DetailText(
          title: 'Course Lecturer',
          bodyWidget: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: kPrimary,
              visualDensity: VisualDensity.compact,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/lecturer-detail',
                arguments: {'lecturerId': widget.course.lecturer!.id},
              );
            },
            child: Text(
              widget.course.lecturer!.name!,
              style: const TextStyle(
                fontSize: kTextSize,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
