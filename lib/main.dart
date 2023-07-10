import 'package:flutter/material.dart';
import 'package:flutter_provider_example/api_call/provider/todo_provider.dart';
import 'package:flutter_provider_example/counter_example/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import 'api_call/screen/todo_screens.dart';
import 'counter_example/view/counter_view.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CounterProvider()),
      ChangeNotifierProvider(create: (context) => TodoProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/apiCall",
      routes: {
        "/" : (context) => CounterView(),
        "/apiCall" : (context) => const TodoListScreen(),
      },
    );
  }
}
