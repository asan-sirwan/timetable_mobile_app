import 'package:flutter/material.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    super.key,
    required this.title,
    this.body,
    this.bodyWidget,
  });

  final String title;
  final String? body;
  final Widget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: const TextStyle(
            color: kGray,
            fontSize: kTitleTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        body != null
            ? Text(
                body!,
                style: const TextStyle(
                  fontSize: kTextSize,
                ),
              )
            : const SizedBox(),
        bodyWidget != null ? bodyWidget! : const SizedBox(),
        const SizedBox(height: kGap * 2),
      ],
    );
  }
}
