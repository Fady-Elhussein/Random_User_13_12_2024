import 'package:dio/dio.dart';
import '../models/task_model.dart';

class TaskService {
  static Dio dio = Dio();
  static Future<TaskModel> getData() async {
    Response response =
        await dio.get('https://dummyjson.com/todos/user/13');
    return TaskModel.fromJson(response.data);
  }

  static Future<void> addItem({required String newTask}) async {
    await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {
        'todo': newTask,
        'completed': false,
        'userId': 13
      },
    );
  }
}
