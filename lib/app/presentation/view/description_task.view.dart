import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasks/app/presentation/controller/description.controller.dart';

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

  final _descriptionController = DescriptionController();
  late final DateTime date;

  @override
  void initState() {
    date = _descriptionController.tempDate(widget.task!.date!);
    super.initState();
  }

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
        _title,
        _description,
        _date,
        _calendar
      ],
    );
  }

  Widget get _title{
    return RichText(
      text: TextSpan(
        text: 'Title:\n',
        style: const TextStyle(
          fontSize: 16
        ),
        children: <TextSpan>[
          TextSpan(
            text: '${widget.task?.title}', 
            style: const TextStyle(
              fontSize: 50
            )
          ),
        ],
      ),
    );
  }

  Widget get _description{
    return RichText(
      text: TextSpan(
        text: 'Description:\n',
        style: const TextStyle(
          fontSize: 16
        ),
        children: <TextSpan>[
          TextSpan(
            text: '${widget.task?.description}', 
            style: const TextStyle(
              fontSize: 50
            )
          ),
        ],
      ),
    );
  }

  Widget get _date{
    return RichText(
      text: const TextSpan(
        text: 'Date:\n',
        style: TextStyle(
          fontSize: 16
        ),
      ),
    );
  }

  Widget get _calendar {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: date
    );
  }
}