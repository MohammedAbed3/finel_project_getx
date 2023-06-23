import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String title;
  String description;

  User({
    this.id,
    required this.title,
    required this.description
  });
}
