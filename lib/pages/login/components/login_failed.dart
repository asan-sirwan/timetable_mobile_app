import 'package:flutter/material.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

class LoginFailed extends StatelessWidget {
  const LoginFailed({
    super.key,
    required this.res,
  });

  final dynamic res;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Something went wrong',
        style: TextStyle(
          fontSize: kTitleTextSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(res['error']),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: kPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Ok',
            style: TextStyle(fontSize: kTextSize),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kRadius),
      ),
    );
  }
}
