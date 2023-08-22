import 'course.dart';

class Student {
  int? id;
  String? name;
  String? email;
  String? birthDate;
  String? address;
  List<Course>? courses;

  Student({
    this.id,
    this.name,
    this.email,
    this.birthDate,
    this.address,
    this.courses,
  });

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    birthDate = json['birthDate'];
    address = json['address'];
    if (json['courses'] != null) {
      courses = <Course>[];
      json['courses'].forEach((v) {
        courses!.add(Course.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['birthDate'] = birthDate;
    data['address'] = address;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
