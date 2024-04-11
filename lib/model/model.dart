import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Todolist {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String subtitle;
  Todolist({required this.subtitle, required this.title, this.id});
}
