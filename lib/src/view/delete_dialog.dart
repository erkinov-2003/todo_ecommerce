import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future deleteDialog(BuildContext context, String clientId) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Noteni o'chirishni istaysizmi!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Yo'q",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.blue.shade600,
                  ),
            ),
          ),
          TextButton(
            onPressed: () {
              final fireStorage = FirebaseFirestore.instance.collection("todo_ecommerce");
              fireStorage.doc(clientId).delete();
              Navigator.pop(context);
            },
            child: Text(
              "Ha",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      );
    },
  );
}
