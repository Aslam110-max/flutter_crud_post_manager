import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showCurpertinoDialog(BuildContext context, String title, String message, VoidCallback onYes) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          child: const Text("No", style: TextStyle(color: Colors.red)),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: const Text("Yes",style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.pop(context);
            onYes();
          },
        ),
      ],
    ),
  );
}
