import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_mobile_app/api/send.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

import 'components/login_failed.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kOffWhite,
      body: SafeArea(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late Size screenSize;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenSize = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(kGap * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Student Timetable',
              style: TextStyle(
                color: kGray,
                fontSize: kTitleTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: kGap * 2),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                icon: FaIcon(FontAwesomeIcons.solidEnvelope),
                hintText: 'Email',
                contentPadding: EdgeInsets.symmetric(horizontal: kGap),
              ),
            ),
            const SizedBox(height: kGap),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                icon: FaIcon(FontAwesomeIcons.key),
                hintText: 'Password',
                contentPadding: EdgeInsets.symmetric(horizontal: kGap),
              ),
            ),
            const SizedBox(height: kGap * 2),
            SizedBox(
              height: 50.0,
              width: screenSize.width * 0.5,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                ),
                onPressed: () async {
                  Map data = {
                    'email': emailController.text,
                    'password': passwordController.text,
                  };
                  final res = await send(
                    url: 'http://10.0.2.2:5286/students/login',
                    data: data,
                  );
                  if (res['error'] != null && context.mounted) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LoginFailed(res: res);
                      },
                    );
                  } else {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    await prefs.setInt('studentId', res['id']);
                    if (context.mounted) {
                      Navigator.popAndPushNamed(context, '/');
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: kTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
