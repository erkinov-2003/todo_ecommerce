import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

Future deleteDialog(BuildContext context, String key) {
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
              final hiveBox = Hive.box("settings");
              hiveBox.delete(key);
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
