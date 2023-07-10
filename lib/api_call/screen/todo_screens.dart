import 'package:flutter/material.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        title: const Text("Todo List",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
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
                child: const Center(child: Text("1",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold))),
              ),
              const SizedBox(width: 12),
              const Text("this is test",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),

              const Expanded(child: SizedBox()),

              Checkbox(
                value: true,
                 activeColor: Colors.amber,
                checkColor: Colors.black,
                onChanged: (value) {

              },)
            ],
          ),
        );
      },),
    );
  }
}
