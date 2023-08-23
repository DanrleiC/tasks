import 'package:flutter/material.dart';
import 'package:tasks/app/data/database/table_task.dart';
import 'package:tasks/app/presentation/view/home_page.view.dart';
import '../../data/model/task.model.dart';

class AddTaskController {

  TableTask data = TableTask.internal();
  
  void addTask(BuildContext context,String title, String description) {
    data.save(TaskModel(
      title: title,
      description: description,
    ));
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const HomePageView()), (route) => false);
  }
}