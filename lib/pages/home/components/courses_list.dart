import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timetable_mobile_app/api/fetch.dart';
import 'package:timetable_mobile_app/models/course.dart';
import 'package:timetable_mobile_app/utils/constants.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({
    super.key,
  });

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  late Future<List<Course>> courses;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    courses = _getCourses();
  }

  Future<List<Course>> _getCourses() async {
    List<Course> courses = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int studentId = prefs.getInt('studentId') ?? 0;
    if (studentId == 0) {
      return courses;
    }

    final res = await fetch(
        url: 'http://10.0.2.2:5286/students/$studentId?detailed=true');
    for (var course in res['courses']) {
      courses.add(Course.fromJson(course));
    }
    return courses;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: courses,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: kPrimary),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load data'));
        } else if (snapshot.hasData) {
          List<Course> courses = snapshot.data!;
          return RefreshIndicator.adaptive(
            color: kPrimary,
            onRefresh: () async {
              setState(() {
                this.courses = _getCourses();
              });
            },
            child: Scrollbar(
              controller: scrollController,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: kGap),
                physics: const AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return courseTile(courses, index);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: kGap * 2,
                    thickness: 1.5,
                    indent: kGap,
                    endIndent: kGap,
                  );
                },
              ),
            ),
          );
        } else {
          return const Center(child: Text('No courses found'));
        }
      },
    );
  }

  ListTile courseTile(List<Course> courses, int index) {
    return ListTile(
      title: Text(
        courses[index].title!,
        style: const TextStyle(fontSize: kTitleTextSize),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(courses[index].lecturer!.name!),
          Text(
            DateFormat('EEE, MMM d, hh:mm a')
                .format(DateTime.parse(courses[index].courseDateTime!))
                .toString(),
          ),
        ],
      ),
      isThreeLine: true,
      onTap: () {
        Navigator.pushNamed(
          context,
          '/course-detail',
          arguments: {'course': courses[index]},
        );
      },
    );
  }
}
