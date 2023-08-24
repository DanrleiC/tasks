// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tasks/app/data/model/task.model.dart';
import 'package:tasks/app/presentation/controller/manage_task.controller.dart';

class ManageTaskView extends StatefulWidget {
  
  final TaskModel? task;

  const ManageTaskView({
    Key? key,
    this.task,
  }) : super(key: key);

  @override
  State<ManageTaskView> createState() => _ManageTaskViewState();
}

class _ManageTaskViewState extends State<ManageTaskView> {

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  TaskModel _currentTask = TaskModel();
  final _manageTaskController = ManageTaskController();

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _currentTask = TaskModel.fromMap(widget.task!.toMap());
    }

    _titleController.text = _currentTask.title ?? '';
    _descriptionController.text = _currentTask.description ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.clear();
    _descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _content,
    );
  }

  AppBar get _appBar => AppBar(
    title: widget.task != null? const Text('Edit Task') : const Text('Add Task'),
    centerTitle: true,
    elevation: 35,
  );

  Widget get _content {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         _text(text: 'Title', controller: _titleController),
         _sizedBox,
         _text(text: 'Description', controller: _descriptionController),
         _sizedBox,
         _buttonSave
        ],
      ),
    );
  }

  Widget get _sizedBox => const SizedBox(height: 20);

  Widget _text({String? text, TextEditingController? controller}){
    return  TextField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal
          )
        ),
        labelText: text,
        labelStyle: const TextStyle(
          color: Colors.teal,
        ),
        filled: true,
      ),
      controller: controller,
    );
  }

  Widget get _buttonSave {
    return ElevatedButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal)
      ),
      onPressed: () {
        _currentTask.title = _titleController.text;
        _currentTask.description = _descriptionController.text;
        _manageTaskController.manageTask(context, _titleController.text, _descriptionController.text, _currentTask);
      }, 
      icon: const Icon(FontAwesomeIcons.floppyDisk), 
      label: const Text('Save')
    );
  }
}