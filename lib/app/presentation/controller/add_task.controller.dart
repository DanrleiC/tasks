import 'package:tasks/app/data/database/table_task.dart';
import '../../data/model/task.model.dart';

class AddTaskController {

  TableTask data = TableTask.internal();
  
  void addTask(String title, String description) {
    data.save(TaskModel(
      title: title,
      description: description,
    ));
  }
}