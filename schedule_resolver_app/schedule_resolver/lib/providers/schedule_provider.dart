import 'package:flutter/material.dart';
import '../models/task_model.dart';
import 'package:uuid/uuid.dart';

class ScheduleProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [];
  final Uuid _uuid = const Uuid();

  List<TaskModel> get tasks => _tasks;

  void addTask({
    required String title,
    required String category,
    required DateTime date, // Removed "String" before DateTime
    required TimeOfDay startTime,
    required TimeOfDay endTime, // Changed semicolon to comma
    required int urgency,
    required int importance,
    required double estimatedEffortHours,
    required String energyLevel, // Fixed typo "enegyLevel"
  }) {
    final newTask = TaskModel(
      id: _uuid.v4(),
      title: title,
      category: category,
      date: date,
      startTime: startTime,
      endTime: endTime,
      urgency: urgency,
      importance: importance,
      estimatedEffortHours: estimatedEffortHours,
      energyLevel: energyLevel, // Fixed typo here as well
    );

    _tasks.add(newTask); // Add the task to the list
    notifyListeners(); // Notify the UI to rebuild

  }

  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}