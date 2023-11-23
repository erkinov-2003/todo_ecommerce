import 'package:flutter/material.dart';

Future infoDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        title: const Text("Todo application info"),
        content: const Text(
            "Ushbu app digital dreams guruhi uchun maxsus tayyorlandi. Siz bu applicationda kelajakdagi qiladigan ishlaringizni yozib borishingiz mukin boladi. Sizga ushbu app yoqdi degan umitdama!. Etiboringiz uchun rahmat"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Exit",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.red,
                  ),
            ),
          ),
        ],
      );
    },
  );
}
