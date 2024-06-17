import 'package:hive/hive.dart';
part 'emp_model.g.dart';

@HiveType(typeId: 0)
class EmployeeModel extends HiveObject{

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String mobile;

  @HiveField(3)
  String dob;

  @HiveField(4)
  String values;

  @HiveField(5)
  String gender;

  @HiveField(6)
  double maxage;

  @HiveField(7)
  List hobbies;

  @HiveField(8)
  String country;

  @HiveField(9)
  String city;

  @HiveField(10)
  String commune;

  EmployeeModel({required this.name, required this.email, required this.mobile, required this.dob,
                  required this.values, required this.gender, required this.maxage, required this.hobbies,
                 required this.country, required this.city, required this.commune
  });
}