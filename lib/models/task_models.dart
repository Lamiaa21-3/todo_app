import 'package:hive/hive.dart';

part 'task_models.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;
  @HiveField(4)
   bool isCompleted;

  TaskModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color,
         this.isCompleted = false,
      });
}
