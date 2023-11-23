import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_ecommerce/src/model/todo_model.dart';

class FireStorageService {
  final _storage = FirebaseFirestore.instance.collection("todo_ecommerce");

  void createCollectionTodo(TodoModel todoModel) {
    _storage.add({
      "title": todoModel.title,
      "description": todoModel.description,
       "createTodo": todoModel.createTodo,
    });
  }
}
