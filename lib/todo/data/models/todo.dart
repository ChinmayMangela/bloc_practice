import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  bool isCompleted;
  @HiveField(4)
  final DateTime createdAt;

  Todo({
    String? id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.isCompleted = false,
  }) : id = Uuid().v4();

  factory Todo.fromJson(Map<String, dynamic> data) {
    return Todo(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      createdAt: data['createdAt'],
      isCompleted: data['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'createdAt': createdAt,
      'isCompleted': isCompleted,
    };
  }

  Todo copyWith({
    String? title,
    String? description,
    bool? isCompleted,
}) {
    return Todo(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt,
    );
  }
}
