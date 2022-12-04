import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/modal/add_todo_modal.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key, required this.title});

  final String title;

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  TodoBloc todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          StreamBuilder<List<AddTodoModal>>(
              stream: todoBloc.addListTaskStream,
              builder: (context, snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text('${snapshot.data![index].title}'),
                        subtitle: Text('${snapshot.data![index].description}'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}
