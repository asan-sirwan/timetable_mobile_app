import 'lecturer.dart';

class Course {
  int? id;
  String? title;
  String? description;
  String? courseDateTime;
  Lecturer? lecturer;

  Course({
    this.id,
    this.title,
    this.description,
    this.courseDateTime,
    this.lecturer,
  });

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    courseDateTime = json['courseDateTime'];
    lecturer =
        json['lecturer'] != null ? Lecturer.fromJson(json['lecturer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['courseDateTime'] = courseDateTime;
    if (lecturer != null) {
      data['lecturer'] = lecturer!.toJson();
    }
    return data;
  }
}
