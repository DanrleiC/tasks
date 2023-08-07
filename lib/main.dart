import 'package:flutter/material.dart';
import 'package:tasks/app/data/database/table_task.dart';

import 'app/app.dart';

void main() {
  runApp(const App());
  TableTask.internal().db;
}
