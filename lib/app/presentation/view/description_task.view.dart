import 'package:flutter/material.dart';

import '../../data/model/task.model.dart';

class DescriptionTaskView extends StatefulWidget {

  final TaskModel? task;

  const DescriptionTaskView({
    Key? key,
    this.task,
  }) : super(key: key);

  @override
  State<DescriptionTaskView> createState() => _DescriptionTaskViewState();
}

class _DescriptionTaskViewState extends State<DescriptionTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _content,
    );
  }

  AppBar get _appBar => AppBar(
    title: const Text('Description Tasks'),
    centerTitle: true,
    elevation: 35,
  );

  Widget get _content {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Title: ${widget.task?.title}'),
        Text('Description: ${widget.task?.description}'),
      ],
    );
  }
}