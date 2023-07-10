import 'package:flutter/material.dart';
import 'package:flutter_provider_example/api_call/service/todo_service.dart';
import '../model/todo_model.dart';

class TodoProvider extends ChangeNotifier{
  final TodoService _service = TodoService();
  bool isLoading = false;
  List<TodoModel> _allTodo = [];
  List<TodoModel> get todoList => _allTodo;

  Future<void> getAllTodo() async {
    isLoading = true;
    notifyListeners();
    final response =  await _service.getAll();
    _allTodo = response;
    isLoading = false;
    notifyListeners();
  }

}