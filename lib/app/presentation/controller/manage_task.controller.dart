import 'package:flutter/material.dart';
import 'package:tasks/app/data/database/table_task.dart';
import 'package:tasks/app/presentation/view/home_page.view.dart';
import '../../data/model/task.model.dart';

class ManageTaskController {

  TableTask data = TableTask.internal();
  
  void manageTask(BuildContext context, String title, String description, String date, TaskModel? task) {
    try {
      task?.id != null
      ? data.update(task!) 
      : data.save(
        TaskModel(
          title: title,
          description: description,
          date: date
        )
      );
    } catch (e) {
      rethrow;
    } finally {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePageView()), (route) => false);
    }
  }
}