import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String title;
  String description;
  String? date;

  User({
    this.id,
    this.date,
    required this.title,
    required this.description
  });
}
