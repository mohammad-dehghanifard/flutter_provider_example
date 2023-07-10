import 'dart:convert';
import 'package:flutter_provider_example/api_call/model/todo_model.dart';
import 'package:http/http.dart' as http ;

class TodoService{

  Future<List<TodoModel>> getAll() async {
    const endPoint = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(endPoint);
    final response = await http.get(uri);

    if(response.statusCode == 200){
    final json = jsonDecode(response.body) as List ;
    final List<TodoModel> todoList = [];
    for (var element in json) {
      todoList.add(TodoModel.formJson(element));
    }
    return todoList;
    }
    return [];
  }
}