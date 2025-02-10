import 'package:flutter/cupertino.dart';

void showCupertinoAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String cancelButtonText,
  required String confirmButtonText,
  required VoidCallback onConfirm,
}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(cancelButtonText),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              onConfirm();
            },
            child: Text(confirmButtonText),
          ),
        ],
      );
    },
  );
}
