// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  final _dateController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  TaskModel _currentTask = TaskModel();
  final _manageTaskController = ManageTaskController();

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _currentTask = TaskModel.fromMap(widget.task!.toMap());
    }

    _dateController.text = _currentTask.date ?? '';
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
         _date,
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
  Widget get _date {
    return GestureDetector(
      onTap: () => _showDataPiker(context),
      child: Container(
        width: 50, // largura do container
        height: 50, // altura do container
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300, // cor da borda
            width: 2.0, // largura da borda
          ),
          borderRadius: BorderRadius.circular(12.0), // raio dos cantos
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedDate == null 
                ? 'Select a date'
                : formattedDate(_selectedDate),
              ),
              const Icon(FontAwesomeIcons.calendar)
            ],
          ),
        ),
      ),
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
        _manageTaskController.manageTask(context, _titleController.text, _descriptionController.text, formattedDate(_selectedDate), _currentTask);
      }, 
      icon: const Icon(FontAwesomeIcons.floppyDisk), 
      label: const Text('Save')
    );
  }

  Future<void> _showDataPiker(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null && selectedDate != _selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

  String formattedDate(date) => DateFormat('dd/MM/yyyy').format(date);
}