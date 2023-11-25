import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../pages/home_page.dart';


class MainController extends ChangeNotifier {
  void addTodoList(
    TextEditingController title,
    TextEditingController description,
    BuildContext context,
  ) {
    if (title.text.isEmpty || description.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Iltimos kataklarni bosh qoldirmang!"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)
            )
          ),
        ),
      );
    }else{
      final box = Hive.box("settings");
      box.put(title.text, description.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
      notifyListeners();
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
