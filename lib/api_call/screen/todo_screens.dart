import 'package:flutter/material.dart';
import 'package:flutter_provider_example/api_call/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  @override
  void initState() {
    super.initState();
    // api call
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<TodoProvider>(context,listen: false).getAllTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        title: const Text("Todo List",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          if(value.isLoading){
            return const Center(child: CircularProgressIndicator());
          }else{
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: value.todoList.length,
              itemBuilder: (context, index) {
                final todo = value.todoList[index];
                return Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle
                        ),
                        child:  Center(child: Text(todo.id.toString(),style: const TextStyle(fontSize: 26,fontWeight: FontWeight.bold))),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 270,
                          child: Text(
                              todo.title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold))),

                      const Expanded(child: SizedBox()),

                      Checkbox(
                        value: todo.completed,
                        activeColor: Colors.amber,
                        checkColor: Colors.black,
                        onChanged: (value) {

                        },)
                    ],
                  ),
                );
              },);
          }
        },
      ),
    );
  }
}
