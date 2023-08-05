import 'package:flutter/material.dart';
import '../view/add_task.view.dart';

class HomePageController {
  
  void navegaAdd(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (context) => const AddTaskView(),
      ),
    );  
  }
}
