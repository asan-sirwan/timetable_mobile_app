import 'package:flutter/material.dart';
import 'package:timetable_mobile_app/api/fetch.dart';
import 'package:timetable_mobile_app/components/detail_text.dart';
import 'package:timetable_mobile_app/models/lecturer.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

class LecturerDetailBody extends StatefulWidget {
  const LecturerDetailBody({
    super.key,
    required this.lecturerId,
  });

  final int lecturerId;

  @override
  State<LecturerDetailBody> createState() => _LecturerDetailBodyState();
}

class _LecturerDetailBodyState extends State<LecturerDetailBody> {
  late Future<Lecturer> lecturer;

  @override
  void initState() {
    super.initState();
    lecturer = _getLecturer(widget.lecturerId);
  }

  Future<Lecturer> _getLecturer(int id) async {
    final res =
        await fetch(url: 'http://10.0.2.2:5286/lecturers/$id?detailed=true');
    return Lecturer.fromJson(res);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: lecturer,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimary),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to fetch lecturer data'),
          );
        } else if (snapshot.hasData) {
          Lecturer lecturer = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(kGap),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailText(
                  title: 'Lecturer Name',
                  body: lecturer.name,
                ),
                DetailText(
                  title: 'Lecturer Email',
                  body: lecturer.email,
                ),
                DetailText(
                  title: 'Lecturer Degree',
                  body: lecturer.degree,
                ),
                DetailText(
                  title: 'Courses Taught',
                  bodyWidget: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: lecturer.courses?.length,
                    itemBuilder: (context, index) {
                      return Text(
                        ' - ${lecturer.courses?[index].title}',
                        style: const TextStyle(fontSize: kTextSize),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('No lecturer found.'),
          );
        }
      },
    );
  }
}
