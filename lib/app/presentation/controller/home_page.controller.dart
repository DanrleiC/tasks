import 'package:flutter/material.dart';
import 'package:tasks/app/presentation/view/description_task.view.dart';
import '../../data/database/table_task.dart';
import '../../data/model/task.model.dart';
import '../view/manage_task.view.dart';

class HomePageController {

  TableTask data = TableTask.internal();
  
  void navegaAdd({required BuildContext ctx, TaskModel? task}) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (context) => ManageTaskView(task: task),
      ),
    );  
  }
  
  void navegaDescription({required BuildContext ctx, TaskModel? task}) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (context) => DescriptionTaskView(task: task),
      ),
    );  
  }

  Future<List<TaskModel>> getAll() async {
    return await data.getAll();
  }

  void deleteTask({required int id}) => data.delete(id);
  
  void get deleteAllTask => data.deleteAll();
}
