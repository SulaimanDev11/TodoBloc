import 'dart:async';

import '../modal/add_todo_modal.dart';

class TodoBloc {
  List<AddTodoModal> myList = [];

  // final _addTodoListController = StreamController<AddTodoModal>();
  // StreamSink<AddTodoModal> get addListTasksink => _addTodoListController.sink;
  // Stream<AddTodoModal> get addListTaskStream => _addTodoListController.stream;

  final _getListOfTask = StreamController<List<AddTodoModal>>();
  StreamSink<List<AddTodoModal>> get getSinnk => _getListOfTask.sink;
  Stream<List<AddTodoModal>> get getStream => _getListOfTask.stream;

  addTask(data) {
    myList.add(data);
    getSinnk.add(myList);
  }

  deleteTask(index) {
    myList.removeAt(index);
    getSinnk.add(myList);
  }
  List<int> mydata=[];
  Stream< List<int> > myReport() async*{
    for(int i=0;i<=10;i++){
      mydata.add(i);
      await Future.delayed(Duration(seconds: 2));
   yield mydata;
    }

 

  }
}
