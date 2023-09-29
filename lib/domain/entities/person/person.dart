import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable(explicitToJson: true)
class Person {
  final int id;
  final String name;
  final String username;
  final String email;

  Person({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
