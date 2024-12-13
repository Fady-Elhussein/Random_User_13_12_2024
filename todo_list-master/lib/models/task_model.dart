class TaskModel {
  List<dynamic> todos;
  int total; 


  TaskModel({required this.todos, required this.total});

 
  factory TaskModel.fromJson(Map<String, dynamic> json) {
  



   
    return TaskModel(todos: json["todos"], total:json['total']);
  }
}
