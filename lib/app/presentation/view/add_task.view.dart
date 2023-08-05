import 'package:flutter/material.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
    );
  }

  AppBar get _appBar => AppBar(
    title: const Text('Add Task'),
    centerTitle: true,
    elevation: 35,
  );
}