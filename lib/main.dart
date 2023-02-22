import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/screens/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_bloc/screens/todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ToDo',
      routerConfig: _newRouter,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }

  final GoRouter _newRouter = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const MyHomePage(title: 'Category Screen'),
        routes: [
          GoRoute(
              path: "todoScreen",
              builder: (context, state) =>
                  ToDoScreen(title: '', object: TodoBloc()))
        ],
      )
    ],
  );
}
