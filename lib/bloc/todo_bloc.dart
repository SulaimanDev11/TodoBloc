import 'dart:async';

import '../modal/add_todo_modal.dart';

class TodoBloc {
  final _testController = StreamController<int>();
  StreamSink<int> get sink => _testController.sink;
  Stream<int> get stram => _testController.stream;

  final _addTodoListController = StreamController<AddTodoModal>();
  StreamSink<AddTodoModal> get addListTasksink =>
      _addTodoListController.sink;
  Stream<AddTodoModal> get addListTaskStream =>
      _addTodoListController.stream;


       final _getListOfTask = StreamController<List<AddTodoModal>>();
  StreamSink<List<AddTodoModal>> get getSinnk =>
      _getListOfTask.sink;
  Stream<List<AddTodoModal>> get getStream =>
      _getListOfTask.stream;

  setStream() {
    sink.add(10);
  }

  addTask(data) {
    addListTasksink.add(data);
    // getSinnk.add(addListTaskStream);

  }
}
