import 'package:flutter/material.dart';

import '../model/todo_model.dart';
import '../pages/home_page.dart';
import '../service/firebase_service.dart';

class MainController extends ChangeNotifier {

  void saveButton(
    TextEditingController titleController,
    TextEditingController descriptionController,
    BuildContext context,
  ) async {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("please do not leave blank!"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      try {
        final firebaseService = FireStorageService().createCollectionTodo;
        final todoModel = TodoModel(
          title: titleController.text,
          description: descriptionController.text,
        );
        firebaseService(todoModel);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const  HomePage(),
          ),
        );
      } catch (e) {
        throw Exception("error firebase storage $e");
      }
    }
  }

  void deleteButton(
    TextEditingController titleController,
    TextEditingController descriptionController,
  ) {
    titleController.clear();
    descriptionController.clear();
  }
}
