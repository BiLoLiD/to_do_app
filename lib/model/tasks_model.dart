import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do_app/model/task_status.dart';

part 'tasks_model.freezed.dart';
part 'tasks_model.g.dart';

@freezed
class TasksModel with _$TasksModel {
  const factory TasksModel(
      {String? id,
      String? userId,
      String? taskListName,
      String? title,
      String? description,
      TaskStatus? taskStatus,
      bool? isCompleted,
      DateTime? publishDate,
      bool? isFavourite,
      bool? isSelected}) = _TasksModel;

  factory TasksModel.fromJson(Map<String, dynamic> json) =>
      _$TasksModelFromJson(json);
}
