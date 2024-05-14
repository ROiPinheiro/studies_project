import 'package:studies_project/app/value_objects/age_vo.dart';
import 'package:studies_project/app/value_objects/name_vo.dart';

class User {
  final NameVO name;
  final AgeVO age;

  User({
    required this.name,
    required this.age,
  });

  ({String? name, String? age}) validate() {
    return (
      name: name.validate(),
      age: age.validate(),
    );
  }

  @override
  String toString() => 'User(name: $name, age: $age)';
}
