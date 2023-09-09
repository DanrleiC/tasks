import 'dart:convert';

class TaskModel {
  
  int? id;
  String? date;
  String? title;
  int? priority;
  String? description;

  TaskModel({
    this.id,
    this.date,
    this.title,
    this.priority,
    this.description,
  });

  TaskModel copyWith({
    int? id,
    String? date,
    String? title,
    int? priority,
    String? description,
  }) {
    return TaskModel(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'title': title,
      'priority': priority,
      'description': description,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] != null ? map['id'] as int : null,
      date: map['date'] != null ? map['date'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      priority: map['priority'] != null ? map['priority'] as int : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
