// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

class DescriptionController {
  
  DateTime tempDate(String date) => DateFormat("dd/MM/yyy").parse(date);
}