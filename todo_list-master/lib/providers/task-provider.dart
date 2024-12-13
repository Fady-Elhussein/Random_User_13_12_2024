import 'package:flutter/material.dart';
import 'package:tododayapp_p/models/task_model.dart';
import '../services/task_service.dart';

class TaskProvider extends ChangeNotifier {
  TaskModel? data; //   

  // function to fetch data
  Future<void> getAllData() async {
    data = await TaskService.getData();
    notifyListeners(); 
  }

  Future<void> addTask(String newTask) async {
    await TaskService.addItem(newTask: newTask); // add task to service

    // update for data
    data?.todos.add({"todo": newTask});
    data?.total += 1;
    

    notifyListeners(); 
  }
}
